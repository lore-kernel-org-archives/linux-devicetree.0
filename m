From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH 0/3] Update board support for OLinuXino boards
Date: Tue, 22 Aug 2017 14:43:10 +0300
Message-ID: <20170822114313.9038-1-stefan@olimex.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

Based of increased number of boards with their shipping options,
there is new board naming convention.

Along with that, A20-OLinuXino-MICRO has new revision(rev.J),
which introduce new PHY chip (LAN8710) and eMMC option. The new
dts file is based on the already existing one for lime2-emmc.

Stefan Mavrodiev (3):
  ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for use with LAN8710
  ARM: dts: sun7i: Add dts file for A20-OLinuXino-MICRO-exGB
  ARM: dts: sun7i: Rename sun7i-a20-olinuxino-lime2-emmc

 arch/arm/boot/dts/Makefile                         |  3 +-
 ...emmc.dts => sun7i-a20-olinuxino-lime2-exgb.dts} |  4 +-
 .../boot/dts/sun7i-a20-olinuxino-micro-exgb.dts    | 81 ++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts    |  7 +-
 4 files changed, 91 insertions(+), 4 deletions(-)
 rename arch/arm/boot/dts/{sun7i-a20-olinuxino-lime2-emmc.dts => sun7i-a20-olinuxino-lime2-exgb.dts} (96%)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts

-- 
2.11.0
