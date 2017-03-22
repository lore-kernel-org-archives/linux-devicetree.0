From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: setup DMA-channels for mmc0 and emmc
 for rk3188
Date: Wed, 22 Mar 2017 16:54:33 +0100
Message-ID: <11123239.Wc863F7R2R@phil>
References: <1490109227-4006-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490109227-4006-1-git-send-email-al.kochet@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

Am Dienstag, 21. M=E4rz 2017, 18:13:47 CET schrieb Alexander Kochetkov:
> This commit enable DMA-based transfers for SD/eMMC card adapters
> and reduce number of interrupts produced by SD-card/eMMC-card
> adapters.
> =

> Sometimes interrupts from SD-card/eMMC-card adapters running in
> PIO mode blocks execution of hrtimers and I2S DMA callbacks for
> a long periods (100 ms or more).
> =

> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>

I've applied a slightly different variant in [0] with your commit message a=
nd
moved the dma properties to the mmc/emmc nodes in rk3xxx.dtsi - as the dma
channels are the same on both rk3188 and rk3066.

While at it, I've also added the sdio dma as there is no need to leave it o=
ut.


Also when changing the devicetree, please do not append stuff at the bottom
but instead sort new nodes (the &mmc &emmc in this case) and properties
alphabetically.


Thanks
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D94bbdd77247d8c16eed5f55dddcf1cbc38d06cc4
