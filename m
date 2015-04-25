From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 4/4] Documentation: DT: misc: Add ti-st bindings
Date: Sat, 25 Apr 2015 15:15:18 -0700
Message-ID: <1430000118-26386-4-git-send-email-eric.nelson@boundarydevices.com>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430000118-26386-1-git-send-email-eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 Documentation/devicetree/bindings/misc/ti-st.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ti-st.txt

diff --git a/Documentation/devicetree/bindings/misc/ti-st.txt b/Documentation/devicetree/bindings/misc/ti-st.txt
new file mode 100644
index 0000000..a1948d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ti-st.txt
@@ -0,0 +1,17 @@
+TI Shared-transport driver (a.k.a. kim)
+
+Required properties:
+- compatible : kim
+- nshutdown_gpio : gpio name and polarity
+- dev_name : uart used for communication
+- flow_cntrl : 1 if RTS/CTS hardware flow control is available
+- baud_rate : baud rate for the UART
+
+Example (from am355x-evm):
+	kim {
+		compatible = "kim";
+		nshutdown_gpio = <&gpio3 21 GPIO_ACTIVE_LOW>;
+		dev_name = "/dev/ttyS1";
+		flow_cntrl = <1>;
+		baud_rate = <3000000>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
