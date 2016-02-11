From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/8] arm: add device-tree SoC bindings for Axis Artpec-6
Date: Thu, 11 Feb 2016 15:14:56 +0100
Message-ID: <7242985.WgQduhPVkk@wuerfel>
References: <cover.1455198819.git.larper@axis.com> <0f096d1ad277cf94032ca274ced0cb35cb5d967c.1455198819.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0f096d1ad277cf94032ca274ced0cb35cb5d967c.1455198819.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thursday 11 February 2016 15:04:37 Lars Persson wrote:
> +
> +The DMA configuration unit muxes dma request lines between single and burst
> +alternatives.
> +
> +Required properties:
> +- compatible: axis,artpec6-dmacfg
> +- reg: Address and length of DMACFG register.
> +
> +Example:
> +       dmacfg {
> +               compatible = "axis,artpec6-dmacfg";
> +               reg = <0xf8000010 4>;
> +       };
> +


This method looks better than before, but putting a single register
into DT looks wrong. I can almost guarantee that there are more
registers at 0xf8000000-0xf8000fff (or more) that belong to either
some system controller or a DMA controller.

Whatever it is, please describe it in the DT in a sensible way based
on what the hardware does and what other resources it uses (interrupts
etc) rather than what today's kernel happens to need.

	Arnd
