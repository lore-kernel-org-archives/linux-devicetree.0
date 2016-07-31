From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH 2/3] phy: sun4i: add support for A64 usb phy
Date: Sun, 31 Jul 2016 18:09:12 +0530
Message-ID: <CABHD4K9awH3moyCktEq3acYN=GS74nhThuFDsYt10UTqOHSw3Q@mail.gmail.com>
References: <20160731112536.4625-1-icenowy@aosc.xyz>
 <20160731112536.4625-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160731112536.4625-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Reinder de Haan <patchesrdh@mveas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello ,

> @@ -264,6 +266,12 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>                 val = readl(phy->pmu + REG_PMU_UNK_H3);
>                 writel(val & ~2, phy->pmu + REG_PMU_UNK_H3);
>         } else {
> +               /* A64 needs also this unknown bit */
> +               if (data->cfg->type == sun50i_a64_phy) {
> +                       val = readl(phy->pmu + REG_PMU_UNK_H3);
> +                       writel(val & ~2, phy->pmu + REG_PMU_UNK_H3);
> +               }
> +

This bit is also set for H3, shall we reuse it or we should enclose it
in else-if part ?

Thanks
Amit.
