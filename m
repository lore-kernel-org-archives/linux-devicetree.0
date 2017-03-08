From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: [PATCH 0/2] [kernel] ARM: lpc32xx: migrate CLCD config to device tree
Date: Wed,  8 Mar 2017 12:46:36 -0500
Message-ID: <20170308174638.25578-1-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vz@mleia.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux@tycoint.com>

Migrate the CLCD configurations to the device tree and
remove custom functions from board files.

This change depends on the following change:
"video: ARM CLCD: fix dma allocation size"
https://www.spinics.net/lists/arm-kernel/msg567178.html

Note:
* We tested a similar change on a custom LPC32xx board with a 480x272 LCD.
* We did not test this change on hardware;
  we do not have access to a PHY3250 board with the 240x320 LCD.

Liam Beguin (2):
  ARM: dts: lpc32xx: phy3250: add clcd configuration
  ARM: lpc32xx: drop CLCD configuration

 arch/arm/boot/dts/lpc3250-phy3250.dts | 35 ++++++++++++++++++
 arch/arm/mach-lpc32xx/phy3250.c       | 70 -----------------------------------
 2 files changed, 35 insertions(+), 70 deletions(-)

-- 
2.11.0
