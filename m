From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 4/4] arm-cci: Fix CCI PMU event validation
Date: Tue, 24 Feb 2015 13:17:43 +0000
Message-ID: <1424783863-9894-5-git-send-email-suzuki.poulose@arm.com>
References: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com>
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

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 drivers/bus/arm-cci.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7e330fe..b0ee582 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -191,11 +191,14 @@ static int pmu_is_valid_master_event(u8 ev_code)
 =09=09ev_code <=3D pmu->model->event_ranges[CCI_IF_MASTER].max;
 }
=20
-static int pmu_validate_hw_event(u8 hw_event)
+static int pmu_validate_hw_event(u32 hw_event)
 {
 =09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
 =09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
=20
+=09if (hw_event & ~CCI_PMU_EVENT_MASK)
+=09=09return -ENOENT;
+
 =09switch (ev_source) {
 =09case CCI_PORT_S0:
 =09case CCI_PORT_S1:
@@ -265,7 +268,6 @@ static void pmu_enable_counter(int idx)
=20
 static void pmu_set_event(int idx, unsigned long event)
 {
-=09event &=3D CCI_PMU_EVENT_MASK;
 =09pmu_write_register(event, idx, CCI_PMU_EVT_SEL);
 }
=20
@@ -282,7 +284,7 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *=
hw, struct perf_event *ev
 {
 =09struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
 =09struct hw_perf_event *hw_event =3D &event->hw;
-=09unsigned long cci_event =3D hw_event->config_base & CCI_PMU_EVENT_MASK;
+=09unsigned long cci_event =3D hw_event->config_base;
 =09int idx;
=20
 =09if (cci_event =3D=3D CCI_PMU_CYCLES) {
@@ -303,7 +305,7 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *=
hw, struct perf_event *ev
 static int pmu_map_event(struct perf_event *event)
 {
 =09int mapping;
-=09u8 config =3D event->attr.config & CCI_PMU_EVENT_MASK;
+=09u32 config =3D event->attr.config;
=20
 =09if (event->attr.type < PERF_TYPE_MAX)
 =09=09return -ENOENT;
--=20
1.7.9.5
