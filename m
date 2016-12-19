From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 7/9] ARM: dts: dm814x: Add an empty chosen node to top level DTSI
Date: Mon, 19 Dec 2016 11:44:39 -0300
Message-ID: <1482158681-4530-8-git-send-email-javier@osg.samsung.com>
References: <1482158681-4530-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482158681-4530-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pali Rohar <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 76155b378c59 ("ARM: dts: dm814x: Remove skeleton.dtsi usage")
removed the skeleton.dtsi usage since we want to get rid of it.

But this can cause issues when booting a kernel with a boot-loader
that doesn't create a chosen node if this isn't present in the DTB
since the decompressor relies on a pre-existing chosen node to be
available to insert the command line and merge other ATAGS info.

Fixes: 76155b378c59 ("ARM: dts: dm814x: Remove skeleton.dtsi usage")
Reported-by: Pali Rohar <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---

 arch/arm/boot/dts/dm814x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
index 1facc5f12cef..81b8cecb5820 100644
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -12,6 +12,7 @@
 	interrupt-parent = <&intc>;
 	#address-cells = <1>;
 	#size-cells = <1>;
+	chosen { };
 
 	aliases {
 		i2c0 = &i2c1;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
