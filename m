Return-Path: <karl@kernel.org>
Date: Thu, 4 Aug 2016 08:39:26 +0000
From: Karl Beldan <kbeldan@baylibre.com>
Subject: Re: [PATCH] ARM: dts: da850: Adjust the pinctrl muxing for the NAND
 on CS3
Message-ID: <20160804083926.GA19101@gobelin>
References: <20160803170627.1773-1-kbeldan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160803170627.1773-1-kbeldan@baylibre.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, karl.beldan+oss@gmail.com, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 03, 2016 at 05:06:27PM +0000, Karl Beldan wrote:
> - Adjust the settings to also allow driving EMA_D[8..15] for 16bits
>   NANDs. These are shared with GPIO3[0..7] which have no in-tree user.
> - Remove the useless CS4 setting
> 

Please drop it, I think it is better to create several pinctrls instead.
 
Karl
