From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] dts: sunxi: Add sunxi NAND Flash
 Controller support
Date: Tue, 14 Jun 2016 14:17:34 +0300
Message-ID: <1465903058-9211-1-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIPLUH7XICRUBBU2RTFK-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1465208664-9366-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds the sunxi NAND Flash Controller pin definitions and nodes to
dts.

Changes since v1:
- Remove patch with Hynix H27UBG8T2BTR-BC MLC NAND chip definition.
- Remove patches with NAND support on Marsboard A10 board and Wexler TAB7200.
- Enable only the pin groups that are actually used by sunxi boards.
- Enable DMA support. Depends on sunxi NFC DMA support([1], [2]), merged into
  linux-nand.

[1] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066899.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066898.html

Boris Brezillon (4):
  ARM: dts: sun4i: Add A10 NAND controller pin definitions
  ARM: dts: sun4i: Add NFC node to Allwinner A10 SoC
  ARM: dts: sun7i: Add A20 NAND controller pin definitions
  ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC

 arch/arm/boot/dts/sun4i-a10.dtsi | 65 ++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 65 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
2.7.3
