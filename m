From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 7/7] arm-cci: Add aliases for PMU events
Date: Tue,  5 May 2015 12:49:08 +0100
Message-ID: <1430826548-29960-8-git-send-email-suzuki.poulose@arm.com>
References: <1430826548-29960-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430826548-29960-1-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

Each CCI model have different event/source codes and formats. This
patch exports this information via the sysfs, which includes the
aliases for the events. The aliases are listed by 'perf list', helping
the users to specify the name of the event instead of the binary
config values.

Each event alias must accompany the 'source' code except for the
following cases :

1) CCI-400 - cycles event, doesn't relate to an interface.
2) CCI-500 - Global events to the CCI. (Fixed source code =3D 0xf)

Each CCI model provides two sets of attributes(format and event),
which are dynamically populated before registering the PMU, to
allow for the appropriate information.

Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 drivers/bus/arm-cci.c |  296 +++++++++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 295 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index e12ddba..a72fccb 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -121,6 +121,10 @@ struct cci_pmu_model {
 =09u32 fixed_hw_cntrs;
 =09u32 num_hw_cntrs;
 =09u32 cntr_size;
+=09u64 nformat_attrs;
+=09u64 nevent_attrs;
+=09struct dev_ext_attribute *format_attrs;
+=09struct dev_ext_attribute *event_attrs;
 =09struct event_range event_ranges[CCI_IF_MAX];
 =09int (*validate_hw_event)(struct cci_pmu *, unsigned long);
 =09int (*get_event_idx)(struct cci_pmu *, struct cci_pmu_hw_events *, unsi=
gned long);
@@ -157,6 +161,19 @@ enum cci_models {
 =09CCI_MODEL_MAX
 };
=20
+static ssize_t cci_pmu_format_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf);
+static ssize_t cci_pmu_event_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf);
+
+#define CCI_EXT_ATTR_ENTRY(_name, _func, _config) \
+=09{ __ATTR(_name, S_IRUGO, _func, NULL), (void *)_config }
+
+#define CCI_FORMAT_EXT_ATTR_ENTRY(_name, _config) \
+=09CCI_EXT_ATTR_ENTRY(_name, cci_pmu_format_show, (char *)_config)
+#define CCI_EVENT_EXT_ATTR_ENTRY(_name, _config) \
+=09CCI_EXT_ATTR_ENTRY(_name, cci_pmu_event_show, (unsigned long)_config)
+
 /* CCI400 PMU Specific definitions */
=20
 #ifdef CONFIG_ARM_CCI400_PMU
@@ -218,6 +235,106 @@ enum cci400_perf_events {
 #define CCI400_R1_MASTER_PORT_MIN_EV=090x00
 #define CCI400_R1_MASTER_PORT_MAX_EV=090x11
=20
+#define CCI400_CYCLE_EVENT_EXT_ATTR_ENTRY(_name, _config) \
+=09CCI_EXT_ATTR_ENTRY(_name, cci400_pmu_cycle_event_show, \
+=09=09=09=09=09(unsigned long)_config)
+
+static ssize_t cci400_pmu_cycle_event_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf);
+
+static struct dev_ext_attribute cci400_pmu_format_attrs[] =3D {
+=09CCI_FORMAT_EXT_ATTR_ENTRY(event, "config:0-4"),
+=09CCI_FORMAT_EXT_ATTR_ENTRY(source, "config:5-7"),
+};
+
+static struct dev_ext_attribute cci400_r0_pmu_event_attrs[] =3D {
+=09/* Slave events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_any, 0x0),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_device, 0x01),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_normal_or_nonshareable, 0x2),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_inner_or_outershareable, 0x3),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_cache_maintenance, 0x4),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_mem_barrier, 0x5),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_sync_barrier, 0x6),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_dvm_msg, 0x7),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_dvm_msg_sync, 0x8),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_stall_tt_full, 0x9),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_data_last_hs_snoop, 0xA),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_data_stall_rvalids_h_rready_l, 0xB),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_any, 0xC),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_device, 0xD),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_normal_or_nonshareable, 0xE),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_inner_or_outershare_wback_wclean, 0x=
F),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_write_unique, 0x10),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_write_line_unique, 0x11),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_evict, 0x12),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_stall_tt_full, 0x13),
+=09/* Master events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_retry_speculative_fetch, 0x14),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_addr_hazard, 0x15),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_id_hazard, 0x16),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_tt_full, 0x17),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_barrier_hazard, 0x18),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_barrier_hazard, 0x19),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_tt_full, 0x1A),
+=09/* Special event for cycles counter */
+=09CCI400_CYCLE_EVENT_EXT_ATTR_ENTRY(cycles, 0xff),
+};
+
+static struct dev_ext_attribute cci400_r1_pmu_event_attrs[] =3D {
+=09/* Slave events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_any, 0x0),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_device, 0x01),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_normal_or_nonshareable, 0x2),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_inner_or_outershareable, 0x3),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_cache_maintenance, 0x4),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_mem_barrier, 0x5),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_sync_barrier, 0x6),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_dvm_msg, 0x7),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_dvm_msg_sync, 0x8),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_stall_tt_full, 0x9),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_data_last_hs_snoop, 0xA),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_data_stall_rvalids_h_rready_l, 0xB),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_any, 0xC),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_device, 0xD),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_normal_or_nonshareable, 0xE),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_inner_or_outershare_wback_wclean, 0x=
F),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_write_unique, 0x10),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_write_line_unique, 0x11),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_evict, 0x12),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_stall_tt_full, 0x13),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_stall_slave_id_hazard, 0x14),
+=09/* Master events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_retry_speculative_fetch, 0x0),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_stall_cycle_addr_hazard, 0x1),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_master_id_hazard, 0x2),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_hi_prio_rtq_full, 0x3),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_barrier_hazard, 0x4),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_barrier_hazard, 0x5),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_wtq_full, 0x6),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_low_prio_rtq_full, 0x7),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_mid_prio_rtq_full, 0x8),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_qvn_vn0, 0x9),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_qvn_vn1, 0xA),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_qvn_vn2, 0xB),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall_qvn_vn3, 0xC),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_qvn_vn0, 0xD),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_qvn_vn1, 0xE),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_qvn_vn2, 0xF),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall_qvn_vn3, 0x10),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_unique_or_line_unique_addr_hazard, 0x11=
),
+=09/* Special event for cycles counter */
+=09CCI400_CYCLE_EVENT_EXT_ATTR_ENTRY(cycles, 0xff),
+};
+
+static ssize_t cci400_pmu_cycle_event_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf)
+{
+=09struct dev_ext_attribute *eattr =3D container_of(attr,
+=09=09=09=09struct dev_ext_attribute, attr);
+=09return snprintf(buf, PAGE_SIZE, "config=3D0x%lx\n", (unsigned long)eatt=
r->var);
+}
+
 static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
 =09=09=09=09struct cci_pmu_hw_events *hw,
 =09=09=09=09unsigned long cci_event)
@@ -355,6 +472,92 @@ static inline struct cci_pmu_model *probe_cci_model(st=
ruct platform_device *pdev
 #define CCI500_GLOBAL_PORT_MIN_EV=090x00
 #define CCI500_GLOBAL_PORT_MAX_EV=090x0f
=20
+
+#define CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(_name, _config) \
+=09CCI_EXT_ATTR_ENTRY(_name, cci500_pmu_global_event_show, \
+=09=09=09=09=09(unsigned long) _config)
+
+static ssize_t cci500_pmu_global_event_show(struct device *dev,
+=09=09=09=09struct device_attribute *attr, char *buf);
+
+static struct dev_ext_attribute cci500_pmu_format_attrs[] =3D {
+=09CCI_FORMAT_EXT_ATTR_ENTRY(event, "config:0-4"),
+=09CCI_FORMAT_EXT_ATTR_ENTRY(source, "config:5-8"),
+};
+
+static struct dev_ext_attribute cci500_pmu_event_attrs[] =3D {
+=09/* Slave events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_arvalid, 0x0),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_dev, 0x1),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_nonshareable, 0x2),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_shareable_non_alloc, 0x3),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_shareable_alloc, 0x4),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_invalidate, 0x5),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_cache_maint, 0x6),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_dvm_msg, 0x7),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_rval, 0x8),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_hs_rlast_snoop, 0x9),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_hs_awalid, 0xA),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_dev, 0xB),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_non_shareable, 0xC),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_share_wb, 0xD),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_share_wlu, 0xE),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_share_wunique, 0xF),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_evict, 0x10),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_wrevict, 0x11),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_w_data_beat, 0x12),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_srq_acvalid, 0x13),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_srq_read, 0x14),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_srq_clean, 0x15),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_srq_data_transfer_low, 0x16),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rrq_stall_arvalid, 0x17),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_data_stall, 0x18),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_wrq_stall, 0x19),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_w_data_stall, 0x1A),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_w_resp_stall, 0x1B),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_srq_stall, 0x1C),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_s_data_stall, 0x1D),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_rq_stall_ot_limit, 0x1E),
+=09CCI_EVENT_EXT_ATTR_ENTRY(si_r_stall_arbit, 0x1F),
+
+=09/* Master events */
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_r_data_beat_any, 0x0),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_w_data_beat_any, 0x1),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_rrq_stall, 0x2),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_r_data_stall, 0x3),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_wrq_stall, 0x4),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_w_data_stall, 0x5),
+=09CCI_EVENT_EXT_ATTR_ENTRY(mi_w_resp_stall, 0x6),
+
+=09/* Global events */
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_filter_bank_0_1, 0x=
0),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_filter_bank_2_3, 0x=
1),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_filter_bank_4_5, 0x=
2),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_filter_bank_6_7, 0x=
3),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_miss_filter_bank_0_=
1, 0x4),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_miss_filter_bank_2_=
3, 0x5),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_miss_filter_bank_4_=
5, 0x6),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_access_miss_filter_bank_6_=
7, 0x7),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_back_invalidation, 0x8),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_stall_alloc_busy, 0x9),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_stall_tt_full, 0xA),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_wrq, 0xB),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_cd_hs, 0xC),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_rq_stall_addr_hazard, 0xD),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snopp_rq_stall_tt_full, 0xE),
+=09CCI500_GLOBAL_EVENT_EXT_ATTR_ENTRY(cci_snoop_rq_tzmp1_prot, 0xF),
+};
+
+static ssize_t cci500_pmu_global_event_show(struct device *dev,
+=09=09=09=09struct device_attribute *attr, char *buf)
+{
+=09struct dev_ext_attribute *eattr =3D container_of(attr,
+=09=09=09=09=09struct dev_ext_attribute, attr);
+=09/* Global events have single fixed source code */
+=09return snprintf(buf, PAGE_SIZE, "event=3D0x%lx,source=3D0x%x\n",
+=09=09=09=09(unsigned long)eattr->var, CCI500_PORT_GLOBAL);
+}
+
 static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
 =09=09=09=09=09unsigned long hw_event)
 {
@@ -398,6 +601,24 @@ static int cci500_validate_hw_event(struct cci_pmu *cc=
i_pmu,
 }
 #endif=09/* CONFIG_ARM_CCI500_PMU */
=20
+static ssize_t cci_pmu_format_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf)
+{
+=09struct dev_ext_attribute *eattr =3D container_of(attr,
+=09=09=09=09struct dev_ext_attribute, attr);
+=09return snprintf(buf, PAGE_SIZE, "%s\n", (char *)eattr->var);
+}
+
+static ssize_t cci_pmu_event_show(struct device *dev,
+=09=09=09struct device_attribute *attr, char *buf)
+{
+=09struct dev_ext_attribute *eattr =3D container_of(attr,
+=09=09=09=09struct dev_ext_attribute, attr);
+=09/* source parameter is mandatory for normal PMU events */
+=09return snprintf(buf, PAGE_SIZE, "source=3D?,event=3D0x%lx\n",
+=09=09=09=09=09 (unsigned long)eattr->var);
+}
+
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
 {
 =09return 0 <=3D idx && idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);
@@ -980,17 +1201,78 @@ static struct attribute_group pmu_attr_group =3D {
 =09.attrs =3D pmu_attrs,
 };
=20
+static struct attribute_group pmu_format_attr_group =3D {
+=09.name =3D "format",
+=09.attrs =3D NULL,=09=09/* Filled in cci_pmu_init_attrs */
+};
+
+static struct attribute_group pmu_event_attr_group =3D {
+=09.name =3D "events",
+=09.attrs =3D NULL,=09=09/* Filled in cci_pmu_init_attrs */
+};
+
 static const struct attribute_group *pmu_attr_groups[] =3D {
 =09&pmu_attr_group,
+=09&pmu_format_attr_group,
+=09&pmu_event_attr_group,
 =09NULL
 };
=20
+static struct attribute **alloc_attrs(struct platform_device *pdev,
+=09=09=09=09int n, struct dev_ext_attribute *source)
+{
+=09int i;
+=09struct attribute **attrs;
+
+=09/* Alloc n + 1 (for terminating NULL) */
+=09attrs  =3D devm_kcalloc(&pdev->dev, n + 1, sizeof(struct attribute *),
+=09=09=09=09=09=09=09=09GFP_KERNEL);
+=09if (!attrs)
+=09=09return attrs;
+=09for(i =3D 0; i < n; i++)
+=09=09attrs[i] =3D &source[i].attr.attr;
+=09return attrs;
+}
+
+static int cci_pmu_init_attrs(struct cci_pmu *cci_pmu, struct platform_dev=
ice *pdev)
+{
+=09const struct cci_pmu_model *model =3D cci_pmu->model;
+=09struct attribute **attrs;
+
+=09/*
+=09 * All allocations below are managed, hence doesn't need to be
+=09 * free'd explicitly in case of an error.
+=09 */
+
+=09if (model->nevent_attrs) {
+=09=09attrs =3D alloc_attrs(pdev, model->nevent_attrs,
+=09=09=09=09=09=09model->event_attrs);
+=09=09if (!attrs)
+=09=09=09return -ENOMEM;
+=09=09pmu_event_attr_group.attrs =3D attrs;
+=09}
+=09if (model->nformat_attrs) {
+=09=09attrs =3D alloc_attrs(pdev, model->nformat_attrs,
+=09=09=09=09=09=09 model->format_attrs);
+=09=09if (!attrs)
+=09=09=09return -ENOMEM;
+=09=09pmu_format_attr_group.attrs =3D attrs;
+=09}
+=09pmu_cpumask_attr.var =3D cci_pmu;
+
+=09return 0;
+}
+
 static int cci_pmu_init(struct cci_pmu *cci_pmu, struct platform_device *p=
dev)
 {
 =09char *name =3D cci_pmu->model->name;
 =09u32 num_cntrs;
+=09int rc;
+
+=09rc =3D cci_pmu_init_attrs(cci_pmu, pdev);
+=09if (rc)
+=09=09return rc;
=20
-=09pmu_cpumask_attr.var =3D cci_pmu;
 =09cci_pmu->pmu =3D (struct pmu) {
 =09=09.name=09=09=3D cci_pmu->model->name,
 =09=09.task_ctx_nr=09=3D perf_invalid_context,
@@ -1053,6 +1335,10 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
 =09=09.num_hw_cntrs =3D 4,
 =09=09.cntr_size =3D SZ_4K,
+=09=09.format_attrs =3D cci400_pmu_format_attrs,
+=09=09.nformat_attrs =3D ARRAY_SIZE(cci400_pmu_format_attrs),
+=09=09.event_attrs =3D cci400_r0_pmu_event_attrs,
+=09=09.nevent_attrs =3D ARRAY_SIZE(cci400_r0_pmu_event_attrs),
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
 =09=09=09=09CCI400_R0_SLAVE_PORT_MIN_EV,
@@ -1071,6 +1357,10 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
 =09=09.num_hw_cntrs =3D 4,
 =09=09.cntr_size =3D SZ_4K,
+=09=09.format_attrs =3D cci400_pmu_format_attrs,
+=09=09.nformat_attrs =3D ARRAY_SIZE(cci400_pmu_format_attrs),
+=09=09.event_attrs =3D cci400_r1_pmu_event_attrs,
+=09=09.nevent_attrs =3D ARRAY_SIZE(cci400_r1_pmu_event_attrs),
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
 =09=09=09=09CCI400_R1_SLAVE_PORT_MIN_EV,
@@ -1091,6 +1381,10 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09.fixed_hw_cntrs =3D 0,
 =09=09.num_hw_cntrs =3D 8,
 =09=09.cntr_size =3D SZ_64K,
+=09=09.format_attrs =3D cci500_pmu_format_attrs,
+=09=09.nformat_attrs =3D ARRAY_SIZE(cci500_pmu_format_attrs),
+=09=09.event_attrs =3D cci500_pmu_event_attrs,
+=09=09.nevent_attrs =3D ARRAY_SIZE(cci500_pmu_event_attrs),
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
 =09=09=09=09CCI500_SLAVE_PORT_MIN_EV,
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
