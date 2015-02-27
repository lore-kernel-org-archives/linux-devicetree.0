From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/2] add dts for PopMetal board
Date: Fri, 27 Feb 2015 18:55:05 +0800
Message-ID: <1425034505-25163-1-git-send-email-andy.yan@rock-chips.com>
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
To: heiko@sntech.de, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, naobsd@gmail.com, b.galvani@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, Andy Yan <andy.yan@rock-chips.com>, romain.perier@gmail.com, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org


PopMetal is a rockchip rk3288 based board made by ChipSpark,
which has many interface such as VGA,HDMI,usb,ir,sdcad and lots of
sensors such as gyroscope(L3G4200D),accelerometer(mma8452),compass(AK8963C).

http://wiki.chipspark.com/en/index.php?title=PopMetal

This patch add basic support for it. More feather will be enabled later.


Andy Yan (2):
  dt-bindings: add root compatible property for PopMetal board
  ARM: dts: add rk3288 PopMetal board

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
 arch/arm/boot/dts/rk3288-popmetal.dts              | 396 +++++++++++++++++++++
 2 files changed, 400 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-popmetal.dts

-- 
1.9.1
