From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: sunxi: add support for R40 SoC
Date: Fri, 25 Aug 2017 13:28:00 -0500
Message-ID: <20170825182800.in2ljipod5nox5we@rob-hp-laptop>
References: <20170822052322.15338-1-icenowy@aosc.io>
 <20170822052322.15338-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170822052322.15338-3-icenowy@aosc.io>
Sender: linux-doc-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 01:23:22PM +0800, Icenowy Zheng wrote:
> Allwinner R40 is a new SoC, with Quad Core Cortex-A7 and peripherals
> like A20.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Fix alphabetical orders.
> 
>  Documentation/arm/sunxi/README                  | 6 ++++++
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>  3 files changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

