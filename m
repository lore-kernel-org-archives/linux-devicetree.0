From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2] ARM: dts: at91: add devicetree for the Axentia Nattis
 with Natte power
Date: Mon, 4 Dec 2017 20:38:02 +0100
Message-ID: <20171204193802.GG21780@piout.net>
References: <20171204135708.8234-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171204135708.8234-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2017 at 14:57:08 +0100, Peter Rosin wrote:
> The Axentia Nattis is a device designed for presenting departures for
> public transport systems. The Natte helper board provides power and
> features a battery of battery chargers.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
> 
> This was part of a two-patch series, but the first patch in that
> series was redundant, so I dropped it (there was a dt binding
> recently added for the tfa9879 amplifier that I had not noticed).
> 
> Changes since v1:    https://lkml.org/lkml/2017/12/1/844
> - removed chip-ids from before the @-sign instead naming the nodes
>   for the function, e.g sx1502q@20 -> ioexp@20
> - added #sound-dai-cells to the amplifier node
> - switch to SPDX license tags
> 
> Cheers,
> Peter
> 
> Documentation/devicetree/bindings/arm/axentia.txt |   9 +
>  MAINTAINERS                                       |   2 +
>  arch/arm/boot/dts/Makefile                        |   1 +
>  arch/arm/boot/dts/at91-natte.dtsi                 | 244 ++++++++++++++++++++
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts       | 258 ++++++++++++++++++++++
>  5 files changed, 514 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-natte.dtsi
>  create mode 100644 arch/arm/boot/dts/at91-nattis-2-natte-2.dts
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
