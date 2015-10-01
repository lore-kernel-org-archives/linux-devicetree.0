From: Rob Herring <robh@kernel.org>
Subject: [PATCH 7/8] dt-bindings: move Calxeda bindings to appropriate subsystems
Date: Thu,  1 Oct 2015 17:12:33 -0500
Message-ID: <1443737554-10352-8-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Move the Calxeda memory controller and PHY bindings to appropriate
subsystem directories.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 .../calxeda/mem-ctrlr.txt => memory-controllers/calxeda-ddr-ctrlr.txt}    | 0
 .../bindings/{arm/calxeda/combophy.txt => phy/calxeda-combophy.txt}       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/calxeda/mem-ctrlr.txt => memory-controllers/calxeda-ddr-ctrlr.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/calxeda/combophy.txt => phy/calxeda-combophy.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt b/Documentation/devicetree/bindings/memory-controllers/calxeda-ddr-ctrlr.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
rename to Documentation/devicetree/bindings/memory-controllers/calxeda-ddr-ctrlr.txt
diff --git a/Documentation/devicetree/bindings/arm/calxeda/combophy.txt b/Documentation/devicetree/bindings/phy/calxeda-combophy.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/calxeda/combophy.txt
rename to Documentation/devicetree/bindings/phy/calxeda-combophy.txt
-- 
2.1.4
