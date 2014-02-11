From: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 1/8] bus: arm-cci: make use of of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 10:23:59 -0600
Message-ID: <1392135847-30791-2-git-send-email-joshc@codeaurora.org>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392135847-30791-1-git-send-email-joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Instead of the of_find_matching_node()/of_match_node() pair, which requ=
ires two
iterations through the match table, make use of of_find_matching_node_a=
nd_match(),
which only iterates through the table once.

This also has the side effect of fixing the following following error h=
it
during randconfig testing:

  drivers/bus/arm-cci.c: In function =E2=80=98cci_probe=E2=80=99:
  drivers/bus/arm-cci.c:976:49: warning: dereferencing =E2=80=98void *=E2=
=80=99 pointer [enabled by default]
    cci_config =3D of_match_node(arm_cci_matches, np)->data;
                                                   ^
  drivers/bus/arm-cci.c:976:49: error: request for member =E2=80=98data=
=E2=80=99 in something not a structure or union

Signed-off-by: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/bus/arm-cci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 962fd35..e249cdb2 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -962,6 +962,7 @@ static const struct of_device_id arm_cci_ctrl_if_ma=
tches[] =3D {
=20
 static int cci_probe(void)
 {
+	const struct of_device_id *match;
 	struct cci_nb_ports const *cci_config;
 	int ret, i, nb_ace =3D 0, nb_ace_lite =3D 0;
 	struct device_node *np, *cp;
@@ -969,11 +970,11 @@ static int cci_probe(void)
 	const char *match_str;
 	bool is_ace;
=20
-	np =3D of_find_matching_node(NULL, arm_cci_matches);
+	np =3D of_find_matching_node_and_match(NULL, arm_cci_matches, &match)=
;
 	if (!np)
 		return -ENODEV;
=20
-	cci_config =3D of_match_node(arm_cci_matches, np)->data;
+	cci_config =3D match->data;
 	if (!cci_config)
 		return -ENODEV;
=20
--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
