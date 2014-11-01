From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] of/irq: Drop obsolete 'interrupts' vs 'interrupts-extended'
 text
Date: Sat, 01 Nov 2014 17:35:31 -0600
Message-ID: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property
first") updated the description to say that:

  - Both 'interrupts' and 'interrupts-extended' may be present
  - Software should prefer 'interrupts-extended'
  - Software that doesn't comprehend 'interrupts-extended' may use
    'interrupts'

But there is still a paragraph at the end that prohibits having both and
says 'interrupts' should be preferred.

Remove the contradictory text.

Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property first")
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: stable@vger.kernel.org	# v3.13+
---
 .../bindings/interrupt-controller/interrupts.txt   |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index ce6a1a072028..8a3c40829899 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -30,10 +30,6 @@ should only be used when a device has multiple interrupt parents.
   Example:
 	interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;
 
-A device node may contain either "interrupts" or "interrupts-extended", but not
-both. If both properties are present, then the operating system should log an
-error and use only the data in "interrupts".
-
 2) Interrupt controller nodes
 -----------------------------
 
