From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 04/15] MIPS: dts: img: pistachio_marduk: Switch mmc to 1 bit mode
Date: Sun, 22 Jul 2018 23:19:59 +0200
Message-ID: <20180722212010.3979-5-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Ian Pozella <Ian.Pozella@imgtec.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, James Hartley <james.hartley@sondrel.com>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ian Pozella <Ian.Pozella@imgtec.com>

The mmc block in Pistachio allows 1 to 8 data bits to be used.
Marduk uses 4 bits allowing the upper 4 bits to be allocated
to the Mikrobus ports. However these bits are still connected
internally meaning the mmc block recieves signals on all data lines
and seems the internal HW CRC checks get corrupted by this erroneous
data.

We cannot control what data is sent on these lines because they go
to external ports. 1 bit mode does not exhibit the issue hence the
safe default is to use this. If a user knows that in their use case
they will not use the upper bits then they can set to 4 bit mode in
order to improve performance.

Also make sure that the upper 4 bits don't get allocated to the mmc
driver (the default is to assign all 8 pins) so they can be allocated
to other drivers. Allocating all 4 despite setting 1 bit mode as this
matches what is there in hardware.

Signed-off-by: Ian Pozella <Ian.Pozella@imgtec.com>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index 29358d1f7027..5557a6ad61c3 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -120,6 +120,7 @@
 
 &pin_sdhost_data {
 	drive-strength = <2>;
+	pins = "mfio17", "mfio18", "mfio19", "mfio20";
 };
 
 &pwm {
@@ -132,7 +133,7 @@
 
 &sdhost {
 	status = "okay";
-	bus-width = <4>;
+	bus-width = <1>;
 	disable-wp;
 };
 
-- 
2.16.4
