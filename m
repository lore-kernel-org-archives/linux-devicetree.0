From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] dts: sunxi: Add sunxi NAND Flash Controller support
Date: Mon,  6 Jun 2016 13:24:17 +0300
Message-ID: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIPTHWVXICRUBFS5PMOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds the sunxi NAND Flash Controller nodes to dts.

The first 4 patches is Boris Brezillon's patches with dtsi changes.
The second 1 patch adds Hynix H27UBG8T2BTR-BC NAND chip definition.
The last 2 patches enables NAND on Marsboard A10 board and Wexler TAB7200
tablet.

Aleksei Mamlin (3):
  mtd: nand: Add Hynix H27UBG8T2BTR-BC to nand_ids table
  ARM: dts: sun4i: Enable NAND on Marsboard A10
  ARM: dts: sun7i: Enable NAND on Wexler TAB7200

Boris Brezillon (4):
  ARM: dts: sun4i: Add A10 NAND controller pin definitions
  ARM: dts: sun4i: Add NFC node to Allwinner A10 SoC
  ARM: dts: sun7i: Add A20 NAND controller pin definitions
  ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC

 arch/arm/boot/dts/sun4i-a10-marsboard.dts      | 41 ++++++++++++
 arch/arm/boot/dts/sun4i-a10.dtsi               | 91 ++++++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi               | 91 ++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c                    |  4 ++
 5 files changed, 268 insertions(+)

-- 
2.7.3
