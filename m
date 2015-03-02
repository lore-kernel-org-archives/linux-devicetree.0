From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 5/5] arm-cci: Fix CCI PMU event validation
Date: Mon,  2 Mar 2015 11:29:14 +0000
Message-ID: <1425295754-13376-6-git-send-email-suzuki.poulose@arm.com>
References: <1425295754-13376-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425295754-13376-1-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Sudeep.Holla-5wv7dgnIgG8@public.gmane.org, Punit.Agrawal-5wv7dgnIgG8@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

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

Helps in killing CCI_PMU_EVENT_MASK from common code.

Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 drivers/bus/arm-cci.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index f86f096..438a121 100644
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


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
