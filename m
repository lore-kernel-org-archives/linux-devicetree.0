From: pgreco@centosproject.org
Subject: [PATCH 0/2] ARM: dts: sun8i: v40 Rewrite BPi M2 Berry DTS based on
 BPi M2 Ultra
Date: Thu, 11 Apr 2019 08:54:47 -0300
Message-ID: <1554983689-47305-1-git-send-email-pgreco@centosproject.org>
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
To: linux-sunxi@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Pablo Greco <pgreco@centosproject.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Pablo Greco <pgreco@centosproject.org>

BPi M2 Berry is a trimmed down version of the BPi M2 Ultra, completely
software compatible.

Changes include:
- 2GiB -> 1GiB
- no eMMC
- no onboard microphone
- no IR
- no blue LED
- no charging (and power jack to USB)
- dropped USB2 and connect USB1 to a 4-port HUB.


Pablo Greco (2):
  ARM: dts: sun8i: v40: bananapi-m2-berry: Sort device node
    dereferences.
  ARM: dts: sun8i: v40: Update BPi M2 Berry DTS to the level of M2 Ultra

 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 144 ++++++++++++++++++++--
 1 file changed, 131 insertions(+), 13 deletions(-)

-- 
1.8.3.1
