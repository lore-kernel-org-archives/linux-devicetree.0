From: Badhri Jagan Sridharan <badhri@google.com>
Subject: [PATCH v3 1/3] dt-bindings: connector: Add self-powered property
Date: Mon,  1 Oct 2018 12:44:59 -0700
Message-ID: <20181001194501.58338-1-badhri@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Li Jun <jun.li@nxp.com>, linux@roeck-us.net, jackp@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
List-Id: devicetree@vger.kernel.org

>From USB_PD_R3_0
7.1.5 Response to Hard Resets
Device operation during and after a Hard Reset is defined as follows:
Self-powered devices Should Not disconnect from USB during a Hard Reset
(see Section 9.1.2).
Bus powered devices will disconnect from USB during a Hard Reset due to the
loss of their power source.

Therefore it is necessary to know whether the port belongs to
a device which is self powered or bus powered. This change
adds "self-powered" flag to the connector class which present indicates
that the port belongs to a device that is self powered. Else it is
bus powered usb device.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
-------
Changes is v3:
- Rebase on top of usb-next
- no change w.r.t to this patch. Same as previous versions.

No v2 version as the patch was introduced there.

---
 Documentation/devicetree/bindings/connector/usb-connector.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index d90e17e2428b..a9a2f2fc44f2 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -14,6 +14,8 @@ Optional properties:
 - label: symbolic name for the connector,
 - type: size of the connector, should be specified in case of USB-A, USB-B
   non-fullsize connectors: "mini", "micro".
+- self-powered: Set this property if the usb device that has its own power
+  source.
 
 Optional properties for usb-c-connector:
 - power-role: should be one of "source", "sink" or "dual"(DRP) if typec
-- 
2.19.0.605.g01d371f741-goog
