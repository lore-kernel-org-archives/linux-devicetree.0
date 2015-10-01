From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/8] dt-bindings: consolidate eeprom bindings
Date: Thu,  1 Oct 2015 17:12:29 -0500
Message-ID: <1443737554-10352-4-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Create a top level eeprom binding directory and move several scattered
binding files there.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/{misc => eeprom}/at25.txt | 0
 Documentation/devicetree/bindings/{ => eeprom}/eeprom.txt   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{misc => eeprom}/at25.txt (100%)
 rename Documentation/devicetree/bindings/{ => eeprom}/eeprom.txt (100%)

diff --git a/Documentation/devicetree/bindings/misc/at25.txt b/Documentation/devicetree/bindings/eeprom/at25.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/at25.txt
rename to Documentation/devicetree/bindings/eeprom/at25.txt
diff --git a/Documentation/devicetree/bindings/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
similarity index 100%
rename from Documentation/devicetree/bindings/eeprom.txt
rename to Documentation/devicetree/bindings/eeprom/eeprom.txt
-- 
2.1.4
