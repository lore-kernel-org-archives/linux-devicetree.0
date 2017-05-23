From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 4/5] gpio: of: Add documentation of new sleep standard GPIO specifiers
Date: Tue, 23 May 2017 15:47:31 +0100
Message-ID: <1495550852-3672-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com, frowand.list@gmail.com, ldewangan@nvidia.com
List-Id: devicetree@vger.kernel.org

Add documentation of new GPIO specifiers indicating if the state of an
output pin should be maintained during sleep/low-power mode.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

New to the series.

Thanks,
Charles

 Documentation/devicetree/bindings/gpio/gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index bccb8623..802402f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -80,6 +80,8 @@ Optional standard bitfield specifiers for the last cell:
            https://en.wikipedia.org/wiki/Single-ended_triode
 - Bit 2: 0 means open-source, 1 means open drain, see:
            https://en.wikipedia.org/wiki/Open_collector
+- Bit 3: 0 means the output should be maintained during sleep/low-power mode
+         1 means the output state can be lost during sleep/low-power mode
 
 1.1) GPIO specifier best practices
 ----------------------------------
-- 
2.1.4

