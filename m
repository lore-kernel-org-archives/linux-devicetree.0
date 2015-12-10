From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sunxi: allwinner,sun4i-a10-lradc-keys
 binding: typo fix
Date: Thu, 10 Dec 2015 21:32:01 +0100
Message-ID: <1449779521-754-4-git-send-email-merker@debian.org>
References: <1449779521-754-1-git-send-email-merker@debian.org>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBEODU6ZQKGQEIZZH4OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449779521-754-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Trivial typo fix ("mut" -> "must") in the sunxi LRADC-keys binding
documentation.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b=
/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
index b9c32f6..4357e49 100644
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
@@ -12,7 +12,7 @@ Each key is represented as a sub-node of "allwinner,sun4i=
-a10-lradc-keys":
 Required subnode-properties:
 	- label: Descriptive name of the key.
 	- linux,code: Keycode to emit.
-	- channel: Channel this key is attached to, mut be 0 or 1.
+	- channel: Channel this key is attached to, must be 0 or 1.
 	- voltage: Voltage in =C2=B5V at lradc input when this key is pressed.
=20
 Example:
--=20
2.1.4

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
