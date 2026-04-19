(define (domain sepsis)
    (:requirements :strips :typing :conditional-effects)
    (:types
        activity leucocytes_type lacticacid_type crp_type
    )
    (:constants
        admission_nc crp er_registration er_sepsis_triage er_triage iv_antibiotics iv_liquid lacticacid leucocytes release_a release_b return_er tau_1 tau_10 tau_11 tau_12 tau_13 tau_14 tau_15 tau_16 tau_17 tau_18 tau_19 tau_2 tau_20 tau_21 tau_3 tau_4 tau_5 tau_6 tau_7 tau_8 tau_9 - activity
        gte_0_2_lte_0_75 gte_0_75_lte_2_15 gte_2_15 lte_0_2 - lacticacid_type
        gte_147_5 gte_28_5_lte_40_5 gte_40_5_lte_57_5 gte_57_5_lte_147_5 lte_28_5 - crp_type
        gte_12_15_lte_13_95 gte_13_95 gte_3_4_lte_7_15 gte_7_15_lte_12_15 lte_3_4 - leucocytes_type
    )
    (:predicates
        (completed ?a - activity)
        (enabled ?a - activity)
        (lacticacid ?v - lacticacid_type)
        (diagnosticlacticacid)
        (crp ?v - crp_type)
        (leucocytes ?v - leucocytes_type)
    )
    (:action exec_admission_nc
        :parameters ()
        :precondition (and
            (enabled admission_nc)
            (completed tau_7))
        :effect (and
            (completed admission_nc)
            (enabled tau_15)
            (enabled tau_7)
            (not (enabled admission_nc)))
    )
    (:action exec_crp-gte_147_5
        :parameters ()
        :precondition (enabled crp)
        :effect (and
            (completed crp)
            (forall
                (?old - crp_type)
                (when
                    (crp ?old)
                    (not (crp ?old))))
            (crp gte_147_5)
            (enabled tau_14)
            (enabled tau_1)
            (not (enabled crp)))
    )
    (:action exec_crp-gte_28_5_lte_40_5
        :parameters ()
        :precondition (enabled crp)
        :effect (and
            (completed crp)
            (forall
                (?old - crp_type)
                (when
                    (crp ?old)
                    (not (crp ?old))))
            (crp gte_28_5_lte_40_5)
            (enabled tau_14)
            (enabled tau_1)
            (not (enabled crp)))
    )
    (:action exec_crp-gte_40_5_lte_57_5
        :parameters ()
        :precondition (enabled crp)
        :effect (and
            (completed crp)
            (forall
                (?old - crp_type)
                (when
                    (crp ?old)
                    (not (crp ?old))))
            (crp gte_40_5_lte_57_5)
            (enabled tau_14)
            (enabled tau_1)
            (not (enabled crp)))
    )
    (:action exec_crp-gte_57_5_lte_147_5
        :parameters ()
        :precondition (enabled crp)
        :effect (and
            (completed crp)
            (forall
                (?old - crp_type)
                (when
                    (crp ?old)
                    (not (crp ?old))))
            (crp gte_57_5_lte_147_5)
            (enabled tau_14)
            (enabled tau_1)
            (not (enabled crp)))
    )
    (:action exec_crp-lte_28_5
        :parameters ()
        :precondition (enabled crp)
        :effect (and
            (completed crp)
            (forall
                (?old - crp_type)
                (when
                    (crp ?old)
                    (not (crp ?old))))
            (crp lte_28_5)
            (enabled tau_14)
            (enabled tau_1)
            (not (enabled crp)))
    )
    (:action exec_er_registration
        :parameters ()
        :precondition (enabled er_registration)
        :effect (and
            (completed er_registration)
            (enabled er_triage)
            (not (enabled er_registration)))
    )
    (:action exec_er_sepsis_triage_v1
        :parameters ()
        :precondition (and
            (enabled er_sepsis_triage)
            (crp gte_57_5_lte_147_5))
        :effect (and
            (completed er_sepsis_triage)
            (enabled tau_9)
            (enabled tau_2)
            (not (enabled er_sepsis_triage)))
    )
    (:action exec_er_sepsis_triage_v2
        :parameters ()
        :precondition (and
            (enabled er_sepsis_triage)
            (crp gte_147_5))
        :effect (and
            (completed er_sepsis_triage)
            (enabled tau_9)
            (enabled tau_2)
            (not (enabled er_sepsis_triage)))
    )
    (:action exec_er_triage
        :parameters ()
        :precondition (enabled er_triage)
        :effect (and
            (completed er_triage)
            (enabled tau_6)
            (enabled tau_5)
            (enabled tau_18)
            (enabled tau_21)
            (enabled lacticacid)
            (enabled tau_4)
            (enabled er_sepsis_triage)
            (not (enabled er_triage)))
    )
    (:action exec_iv_antibiotics
        :parameters ()
        :precondition (and
            (completed tau_9)
            (enabled iv_antibiotics))
        :effect (and
            (completed iv_antibiotics)
            (enabled tau_16)
            (not (enabled iv_antibiotics)))
    )
    (:action exec_iv_liquid
        :parameters ()
        :precondition (and
            (enabled iv_liquid)
            (diagnosticlacticacid))
        :effect (and
            (completed iv_liquid)
            (enabled tau_16)
            (not (enabled iv_liquid)))
    )
    (:action exec_lacticacid-gte_0_2_lte_0_75
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled lacticacid))
        :effect (and
            (completed lacticacid)
            (forall
                (?old - lacticacid_type)
                (when
                    (lacticacid ?old)
                    (not (lacticacid ?old))))
            (lacticacid gte_0_2_lte_0_75)
            (enabled tau_17)
            (not (enabled lacticacid)))
    )
    (:action exec_lacticacid-gte_0_75_lte_2_15
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled lacticacid)
        )
        :effect (and
            (completed lacticacid)
            (forall
                (?old - lacticacid_type)
                (when
                    (lacticacid ?old)
                    (not (lacticacid ?old))))
            (lacticacid gte_0_75_lte_2_15)
            (enabled tau_17)
            (not (enabled lacticacid)))
    )
    (:action exec_lacticacid-gte_2_15
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled lacticacid))
        :effect (and
            (completed lacticacid)
            (forall
                (?old - lacticacid_type)
                (when
                    (lacticacid ?old)
                    (not (lacticacid ?old))))
            (lacticacid gte_2_15)
            (enabled tau_17)
            (not (enabled lacticacid)))
    )
    (:action exec_lacticacid-lte_0_2
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled lacticacid))
        :effect (and
            (completed lacticacid)
            (forall
                (?old - lacticacid_type)
                (when
                    (lacticacid ?old)
                    (not (lacticacid ?old))))
            (lacticacid lte_0_2)
            (enabled tau_17)
            (not (enabled lacticacid)))
    )
    (:action exec_leucocytes-gte_12_15_lte_13_95
        :parameters ()
        :precondition (enabled leucocytes)
        :effect (and
            (completed leucocytes)
            (forall
                (?old - leucocytes_type)
                (when
                    (leucocytes ?old)
                    (not (leucocytes ?old))))
            (leucocytes gte_12_15_lte_13_95)
            (enabled tau_8)
            (enabled tau_20)
            (not (enabled leucocytes)))
    )
    (:action exec_leucocytes-gte_13_95
        :parameters ()
        :precondition (enabled leucocytes)
        :effect (and
            (completed leucocytes)
            (forall
                (?old - leucocytes_type)
                (when
                    (leucocytes ?old)
                    (not (leucocytes ?old))))
            (leucocytes gte_13_95)
            (enabled tau_8)
            (enabled tau_20)
            (not (enabled leucocytes)))
    )
    (:action exec_leucocytes-gte_3_4_lte_7_15
        :parameters ()
        :precondition (enabled leucocytes)
        :effect (and
            (completed leucocytes)
            (forall
                (?old - leucocytes_type)
                (when
                    (leucocytes ?old)
                    (not (leucocytes ?old))))
            (leucocytes gte_3_4_lte_7_15)
            (enabled tau_8)
            (enabled tau_20)
            (not (enabled leucocytes)))
    )
    (:action exec_leucocytes-gte_7_15_lte_12_15
        :parameters ()
        :precondition (enabled leucocytes)
        :effect (and
            (completed leucocytes)
            (forall
                (?old - leucocytes_type)
                (when
                    (leucocytes ?old)
                    (not (leucocytes ?old))))
            (leucocytes gte_7_15_lte_12_15)
            (enabled tau_8)
            (enabled tau_20)
            (not (enabled leucocytes)))
    )
    (:action exec_leucocytes-lte_3_4
        :parameters ()
        :precondition (enabled leucocytes)
        :effect (and
            (completed leucocytes)
            (forall
                (?old - leucocytes_type)
                (when
                    (leucocytes ?old)
                    (not (leucocytes ?old))))
            (leucocytes lte_3_4)
            (enabled tau_8)
            (enabled tau_20)
            (not (enabled leucocytes)))
    )
    (:action exec_release_a
        :parameters ()
        :precondition (and
            (enabled release_a)
            (completed tau_19))
        :effect (and
            (completed release_a)
            (enabled return_er)
            (enabled tau_3)
            (not (enabled release_a)))
    )
    (:action exec_release_b_v1
        :parameters ()
        :precondition (and
            (crp gte_147_5)
            (enabled release_b)
            (completed tau_19)
            (completed iv_antibiotics))
        :effect (and
            (completed release_b)
            (not (enabled release_b)))
    )
    (:action exec_return_er_v1
        :parameters ()
        :precondition (and
            (leucocytes gte_3_4_lte_7_15)
            (enabled return_er)
            (completed leucocytes)
            (completed release_a))
        :effect (and
            (completed return_er)
            (not (enabled return_er)))
    )
    (:action exec_tau_1
        :parameters ()
        :precondition (and
            (completed crp)
            (enabled tau_1))
        :effect (and
            (completed tau_1)
            (enabled crp)
            (not (enabled tau_1)))
    )
    (:action exec_tau_10
        :parameters ()
        :precondition (and
            (completed tau_17)
            (enabled tau_10))
        :effect (and
            (completed tau_10)
            (enabled admission_nc)
            (not (enabled tau_10)))
    )
    (:action exec_tau_11
        :parameters ()
        :precondition (and
            (completed tau_19)
            (enabled tau_11))
        :effect (and
            (completed tau_11)
            (not (enabled tau_11)))
    )
    (:action exec_tau_12
        :parameters ()
        :precondition (and
            (completed tau_9)
            (enabled tau_12))
        :effect (and
            (completed tau_12)
            (enabled tau_16)
            (not (enabled tau_12)))
    )
    (:action exec_tau_13
        :parameters ()
        :precondition (and
            (completed tau_17)
            (enabled tau_13))
        :effect (and
            (completed tau_13)
            (enabled tau_19)
            (not (enabled tau_13)))
    )
    (:action exec_tau_14
        :parameters ()
        :precondition (and
            (completed crp)
            (enabled tau_14))
        :effect (and
            (completed tau_14)
            (enabled tau_19)
            (not (enabled tau_14)))
    )
    (:action exec_tau_15
        :parameters ()
        :precondition (and
            (enabled tau_15)
            (completed admission_nc))
        :effect (and
            (completed tau_15)
            (enabled tau_19)
            (not (enabled tau_15)))
    )
    (:action exec_tau_16
        :parameters ()
        :precondition (and
            (enabled tau_16)
            (completed iv_antibiotics))
        :effect (and
            (completed tau_16)
            (enabled tau_17)
            (not (enabled tau_16)))
    )
    (:action exec_tau_17
        :parameters ()
        :precondition (and
            (completed tau_4)
            (enabled tau_17))
        :effect (and
            (completed tau_17)
            (enabled tau_13)
            (enabled tau_10)
            (not (enabled tau_17)))
    )
    (:action exec_tau_18
        :parameters ()
        :precondition (and
            (enabled tau_18)
            (completed er_triage))
        :effect (and
            (completed tau_18)
            (enabled crp)
            (not (enabled tau_18)))
    )
    (:action exec_tau_19
        :parameters ()
        :precondition (and
            (completed tau_21)
            (enabled tau_19))
        :effect (and
            (completed tau_19)
            (enabled release_a)
            (enabled release_b)
            (enabled tau_11)
            (not (enabled tau_19)))
    )
    (:action exec_tau_2
        :parameters ()
        :precondition (and
            (enabled tau_2)
            (completed er_sepsis_triage))
        :effect (and
            (completed tau_2)
            (enabled tau_17)
            (not (enabled tau_2)))
    )
    (:action exec_tau_20
        :parameters ()
        :precondition (and
            (completed leucocytes)
            (enabled tau_20))
        :effect (and
            (completed tau_20)
            (enabled tau_19)
            (not (enabled tau_20)))
    )
    (:action exec_tau_21
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled tau_21))
        :effect (and
            (completed tau_21)
            (enabled tau_19)
            (not (enabled tau_21)))
    )
    (:action exec_tau_3
        :parameters ()
        :precondition (and
            (enabled tau_3)
            (completed release_a))
        :effect (and
            (completed tau_3)
            (not (enabled tau_3)))
    )
    (:action exec_tau_4
        :parameters ()
        :precondition (and
            (completed er_triage)
            (enabled tau_4))
        :effect (and
            (completed tau_4)
            (enabled tau_17)
            (not (enabled tau_4)))
    )
    (:action exec_tau_5
        :parameters ()
        :precondition (and
            (enabled tau_5)
            (completed er_triage))
        :effect (and
            (completed tau_5)
            (enabled tau_19)
            (not (enabled tau_5)))
    )
    (:action exec_tau_6
        :parameters ()
        :precondition (and
            (enabled tau_6)
            (completed er_triage))
        :effect (and
            (completed tau_6)
            (enabled leucocytes)
            (not (enabled tau_6)))
    )
    (:action exec_tau_7
        :parameters ()
        :precondition (and
            (enabled tau_7)
            (completed admission_nc))
        :effect (and
            (completed tau_7)
            (enabled admission_nc)
            (not (enabled tau_7)))
    )
    (:action exec_tau_8
        :parameters ()
        :precondition (and
            (enabled tau_8)
            (completed leucocytes))
        :effect (and
            (completed tau_8)
            (enabled leucocytes)
            (not (enabled tau_8)))
    )
    (:action exec_tau_9
        :parameters ()
        :precondition (and
            (completed er_sepsis_triage)
            (enabled tau_9))
        :effect (and
            (completed tau_9)
            (enabled tau_12)
            (enabled iv_liquid)
            (enabled iv_antibiotics)
            (not (enabled tau_9)))
    )
)