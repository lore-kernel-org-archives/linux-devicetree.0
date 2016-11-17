From: Florian Larysch <fl@n621.de>
Subject: [PATCH v2 2/2] DT: i2c: W83793 is a trivial device
Date: Thu, 17 Nov 2016 11:23:24 +0100
Message-ID: <20161117102324.18319-3-fl@n621.de>
References: <20161117102324.18319-1-fl@n621.de>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20161117102324.18319-1-fl@n621.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <oss@buserror.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Florian Larysch <fl@n621.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Florian Larysch <fl@n621.de>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index fbbad64..c65aff0 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -158,4 +158,5 @@ ti,tsc2003		I2C Touch-Screen Controller
 ti,tmp102		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
 ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
 ti,tmp275		Digital Temperature Sensor
+winbond,w83793		Winbond/Nuvoton H/W Monitor
 winbond,wpct301		i2c trusted platform module (TPM)
-- 
2.10.2
