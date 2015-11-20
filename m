From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 0/2] Add I2C support for Marvell Berlin BG4CT
Date: Fri, 20 Nov 2015 17:46:59 +0800
Message-ID: <1448012821-7413-1-git-send-email-jszhang@marvell.com>
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
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Jisheng Zhang <jszhang@marvell.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The first patch adds i2c nodes in the soc's dtsi, the second patch
enables all i2c nodes for BG4CT STB board.

NOTE: this series depends on the missed-in-v4.4rc1 patches:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378634.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378635.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/378638.html

Jisheng Zhang (2):
  arm64: dts: berlin4ct: add I2C nodes for BG4CT
  arm64: dts: berlin4ct: enable all i2c nodes for the STB board

 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts | 50 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 52 +++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

-- 
2.6.2
