From: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 1/3] DT: net: document Bluetooth bindings in one place
Date: Tue,  5 Sep 2017 20:58:41 +0200
Message-ID: <1504637923-21652-1-git-send-email-loic.poulain@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

In the same way as Ethernet, gather the Bluetooth related bindings in
one file. Introduce the bluetooth-bd-address property which can be used
to store the assigned BD address.

Signed-off-by: lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 v2: Set device as unconfigured if default address detected
     Add warning if BD addr retrieved from DT
 v3: if no addr retrieved from DT, unconditionally set
     the invalid BD addr flag.
     swap and set bdaddr in the platform probe
 v4: Add dt-bindings documentation
     split patch in two parts (setup, dt prop)
     use local-bd-address name instead of local-mac-address
 v5: remove 2/3 merged in bluetooth-next tree
     Add bluetooth.txt for common BT bindings
     expect local-bd-address in little-endian format

 Documentation/devicetree/bindings/net/bluetooth.txt | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth.txt

diff --git a/Documentation/devicetree/bindings/net/bluetooth.txt b/Documentation/devicetree/bindings/net/bluetooth.txt
new file mode 100644
index 0000000..94797df
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth.txt
@@ -0,0 +1,5 @@
+The following properties are common to the Bluetooth controllers:
+
+- local-bd-address: array of 6 bytes, specifies the BD address that was
+  uniquely assigned to the Bluetooth device, formatted with least significant
+  byte first (little-endian).
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
