From: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v5 2/7] QE: Add ucc hdlc document to bindings
Date: Wed, 9 Mar 2016 09:21:29 +0800
Message-ID: <1457486494-11377-2-git-send-email-qiang.zhao@nxp.com>
References: <1457486494-11377-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457486494-11377-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add ucc hdlc document to
Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt

Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes for v2
	- use ucc-hdlc instead of ucc_hdlc
	- add more information to properties.
Changes for v3
	- use fsl,tx-timeslot-mask instead of fsl,tx-timeslot 
	- use fsl,rx-timeslot-mask instead of fsl,rx-timeslot 
	- add more info
Changes for v4
	- NA 
Changes for v5
	- NA 

 .../bindings/powerpc/fsl/cpm_qe/network.txt        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
index 29b28b8..03c7416 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
@@ -41,3 +41,84 @@ Example:
 		fsl,mdio-pin = <12>;
 		fsl,mdc-pin = <13>;
 	};
+
+* HDLC
+
+Currently defined compatibles:
+- fsl,ucc-hdlc
+
+Properties for fsl,ucc-hdlc:
+- rx-clock-name
+- tx-clock-name
+	Usage: required
+	Value type: <string>
+	Definition : Must be "brg1"-"brg16" for internal clock source,
+		     Must be "clk1"-"clk24" for external clock source.
+
+- fsl,tdm-interface
+	Usage: optional
+	Value type: <empty>
+	Definition : Specify that hdlc is based on tdm-interface
+
+The property below is dependent on fsl,tdm-interface:
+- fsl,rx-sync-clock
+	Usage: required
+	Value type: <string>
+	Definition : Must be "none", "rsync_pin", "brg9-11" and "brg13-15".
+
+- fsl,tx-sync-clock
+	Usage: required
+	Value type: <string>
+	Definition : Must be "none", "tsync_pin", "brg9-11" and "brg13-15".
+
+- fsl,tdm-framer-type
+	Usage: required for tdm interface
+	Value type: <string>
+	Definition : "e1" or "t1".Now e1 and t1 are used, other framer types
+		     are not supported.
+
+- fsl,tdm-id
+	Usage: required for tdm interface
+	Value type: <u32>
+	Definition : number of TDM ID
+
+- fsl,tx-timeslot-mask
+- fsl,rx-timeslot-mask
+	Usage: required for tdm interface
+	Value type: <u32>
+	Definition : time slot mask for TDM operation. Indicates which time
+		     slots used for transmitting and receiving.
+
+- fsl,siram-entry-id
+	Usage: required for tdm interface
+	Value type: <u32>
+	Definition : Must be 0,2,4...64. the number of TDM entry.
+
+- fsl,tdm-internal-loopback
+	usage: optional for tdm interface
+	value type: <empty>
+	Definition : Internal loopback connecting on TDM layer.
+
+Example for tdm interface:
+
+	ucc@2000 {
+		compatible = "fsl,ucc-hdlc";
+		rx-clock-name = "clk8";
+		tx-clock-name = "clk9";
+		fsl,rx-sync-clock = "rsync_pin";
+		fsl,tx-sync-clock = "tsync_pin";
+		fsl,tx-timeslot-mask = <0xfffffffe>;
+		fsl,rx-timeslot-mask = <0xfffffffe>;
+		fsl,tdm-framer-type = "e1";
+		fsl,tdm-id = <0>;
+		fsl,siram-entry-id = <0>;
+		fsl,tdm-interface;
+	};
+
+Example for hdlc without tdm interface:
+
+	ucc@2000 {
+		compatible = "fsl,ucc-hdlc";
+		rx-clock-name = "brg1";
+		tx-clock-name = "brg1";
+	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
