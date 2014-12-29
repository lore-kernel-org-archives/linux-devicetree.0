From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v3 0/4] Add basic support for Mediatek MT8173 SoC
Date: Mon, 29 Dec 2014 09:51:50 +0800
Message-ID: <1419817910.2371.8.camel@mtksdaap41>
References: <1419582417-4448-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1419582417-4448-1-git-send-email-eddie.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, marc.zyngier@arm.com, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, peter.maydell@linaro.org, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi,

Sorry for my IT setting issue that accidentally add mediatek
confidential notice in the tail of this mail series.
Please skip it, and if anyone have concern, I can resend it.

> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
>  arch/arm64/Kconfig                                 |   6 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |   5 +
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |  34 +++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 159 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/irqchip/irq-mtk-sysirq.c                   |  18 ++-
>  8 files changed, 222 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/Makefile
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173.dtsi
> 
> --
> 1.8.1.1.dirty
> 
> ************* Email Confidentiality Notice ********************
> The information contained in this e-mail message (including any 
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be 
> conveyed only to the designated recipient(s). Any use, dissemination, 
> distribution, printing, retaining or copying of this e-mail (including its 
> attachments) by unintended recipient(s) is strictly prohibited and may 
> be unlawful. If you are not an intended recipient of this e-mail, or believe 
> that you have received this e-mail in error, please notify the sender 
> immediately (by replying to this e-mail), delete any and all copies of 
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
