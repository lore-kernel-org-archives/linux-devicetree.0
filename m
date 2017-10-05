From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 0/3] ARM: dts: gr-peach: Mix DTS fixes/updates
Date: Thu,  5 Oct 2017 10:58:17 +0200
Message-ID: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
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
To: horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,
   this series includes three patches for GR-Peach DTS.

The first, very trivial one is the re-proposal of the already sent patch, with
the commit message updated as suggested by Sergei.

The second just enables the Multi-function timer/counter unit which was
disabled and is actually used for timer event generations and wake-ups.

After enabling the MTU unit, ETHER is now working properly, so I am re-proposing
this patch, which had been left out from previous gr-peach DTS series because
the interface was not working correctly.

Thanks
   j

Jacopo Mondi (3):
  ARM: dts: gr-peach: Fix 'leds' node name indent
  ARM: dts: gr-peach: Enable MTU2 timer pulse unit
  ARM: dts: gr-peach: Add ETHER pin group

 arch/arm/boot/dts/r7s72100-gr-peach.dts | 44 ++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

--
2.7.4
