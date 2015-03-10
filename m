From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 5/5] arm-cci: Fix CCI PMU event validation
Date: Tue, 10 Mar 2015 15:18:55 +0000
Message-ID: <1426000735-14375-6-git-send-email-suzuki.poulose@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

We mask the event with the CCI_PMU_EVENT_MASK, before passing
the config to pmu_validate_hw_event(), which causes extra bits
to be ignored and qualifies an invalid event code as valid.

e.g,
 $ perf stat -a -C 0 -e CCI_400/config=3D0x1ff,name=3Dcycles/ sleep 1
   Performance counter stats for 'system wide':

         506951142      cycles

       1.013879626 seconds time elapsed

where, cycles has an event coding of 0xff. This patch also removes
the unnecessary 'event' mask in pmu_write_register, since the config_base
is set by the pmu code after the event is validated.

Changes since V2:
 - Switch to input unsigned long for pmu_validate_hw_event()

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 drivers/bus/arm-cci.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 581190d..89c86e9 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -179,12 +179,15 @@ enum cci400_perf_events {
 #define CCI_REV_R1_MASTER_PORT_MIN_EV=090x00
 #define CCI_REV_R1_MASTER_PORT_MAX_EV=090x11
=20
-static int pmu_validate_hw_event(u8 hw_event)
+static int pmu_validate_hw_event(unsigned long hw_event)
 {
 =09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
 =09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
 =09int if_type;
=20
+=09if (hw_event & ~CCI_PMU_EVENT_MASK)
+=09=09return -ENOENT;
+
 =09switch (ev_source) {
 =09case CCI_PORT_S0:
 =09case CCI_PORT_S1:
@@ -258,7 +261,6 @@ static void pmu_enable_counter(int idx)
=20
 static void pmu_set_event(int idx, unsigned long event)
 {
-=09event &=3D CCI_PMU_EVENT_MASK;
 =09pmu_write_register(event, idx, CCI_PMU_EVT_SEL);
 }
=20
@@ -275,7 +277,7 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *=
hw, struct perf_event *ev
 {
 =09struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
 =09struct hw_perf_event *hw_event =3D &event->hw;
-=09unsigned long cci_event =3D hw_event->config_base & CCI_PMU_EVENT_MASK;
+=09unsigned long cci_event =3D hw_event->config_base;
 =09int idx;
=20
 =09if (cci_event =3D=3D CCI_PMU_CYCLES) {
@@ -296,7 +298,7 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *=
hw, struct perf_event *ev
 static int pmu_map_event(struct perf_event *event)
 {
 =09int mapping;
-=09u8 config =3D event->attr.config & CCI_PMU_EVENT_MASK;
+=09unsigned long config =3D event->attr.config;
=20
 =09if (event->attr.type < PERF_TYPE_MAX)
 =09=09return -ENOENT;
--=20
1.7.9.5
