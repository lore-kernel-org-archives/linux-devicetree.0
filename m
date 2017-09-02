From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: [PATCH] devicetree: Adjust status "ok" -> "okay" under drivers/of/
Date: Sat, 2 Sep 2017 03:44:07 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1709020336290.12205@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Tweak a small number of status "ok" lines in a single file under
/drivers/of/ to use the proper DTSpec 0.1 spelling of "okay".

Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

---

  since there was a single file under all of drivers/ that had this,
it seemed trivial to just patch it and be done with it. the vast
majority of "ok" spellings are under arch/arm*/, and i'm not going
near that.

diff --git a/drivers/of/unittest-data/overlay.dts b/drivers/of/unittest-data/overlay.dts
index 6cd7e6a..ca4533c 100644
--- a/drivers/of/unittest-data/overlay.dts
+++ b/drivers/of/unittest-data/overlay.dts
@@ -7,7 +7,7 @@
 		target = <&electric_1>;

 		__overlay__ {
-			status = "ok";
+			status = "okay";

 			hvac_2: hvac-large-1 {
 				compatible = "ot,hvac-large";
@@ -23,7 +23,7 @@
 		__overlay__ {
 			#address-cells = <1>;
 			#size-cells = <1>;
-			status = "ok";
+			status = "okay";

 			ride@200 {
 				compatible = "ot,ferris-wheel";
@@ -44,7 +44,7 @@
 		target = <&lights_2>;

 		__overlay__ {
-			status = "ok";
+			status = "okay";
 			color = "purple", "white", "red", "green";
 			rate = < 3 256 >;
 		};

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
