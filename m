From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
Subject: [PATCH 1/4] sh-pfc: add macro to define pinmux without function
Date: Fri, 12 Dec 2014 21:01:34 +0100
Message-ID: <1418414497-23741-2-git-send-email-niso@kth.se>
References: <1418414497-23741-1-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418414497-23741-1-git-send-email-niso-UNjuZkX4dYU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Used to define pinmux configurations where the pinmux function have no
representation in the configuration registers but instead solely depend=
s
on a group selection.

Signed-off-by: Niklas S=C3=B6derlund <niso-UNjuZkX4dYU@public.gmane.org>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/s=
h_pfc.h
index 5b72831..c837286 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -167,6 +167,8 @@ struct sh_pfc_soc_info {
 	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ipsr)
 #define PINMUX_IPSR_NOGM(ispr, fn, ms)					\
 	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ms)
+#define PINMUX_IPSR_NOFN(ipsr, fn, ms)					\
+	PINMUX_DATA(fn##_MARK, FN_##ipsr, FN_##ms)
 #define PINMUX_IPSR_MSEL(ipsr, fn, ms)					\
 	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ipsr, FN_##ms)
 #define PINMUX_IPSR_MODSEL_DATA(ipsr, fn, ms)				\
--=20
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
