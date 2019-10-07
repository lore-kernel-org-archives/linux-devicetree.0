From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 3/3] dt-bindings: usb: generic-ehci: Add "companion" entry
Date: Mon, 7 Oct 2019 15:44:10 +0200
Message-ID: <20191007134410.10337-4-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

"companion" entry is present in "generic.txt" usb binding file. This commit
adds it also in generic-ehci yaml binding.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 059f6ef1ad4a..f89897fe2df6 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -63,6 +63,11 @@ properties:
     description:
       Set this flag to force EHCI reset after resume.
 
+  companion:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+     Phandle of a companion.
+
   phys: true
 
 required:
-- 
2.17.1
