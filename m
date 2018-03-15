From: afzal mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: arm64: allwinner: Add support for TERES I laptop
Date: Thu, 15 Mar 2018 22:36:06 +0530
Message-ID: <20180315170606.GA3635@afzalpc>
References: <20180312161050.7647-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180312161050.7647-1-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harald Geyer <harald@ccbib.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Mar 12, 2018 at 04:10:45PM +0000, Harald Geyer wrote:
> This series adds support for the TERES I open hardware laptop produced
> by olimex. With these patches and a bootloader capable of setting up
> simple framebuffer the laptop is quite useable.

Thanks for the patches

w/ defconfig could reach to prompt via serial console using audio
jack.

And just by enabling PWM_SUN4I & FB_SIMPLE, laptop could function
standalone as well.

Suggestions (feel free to ignore):

1. seems currently only review comment pending is on simple
framebuffer, perhaps you can proceed removing just that so that a
basic bootable system can be achieved at the earliest (iiuc, anyway
drm would be the final solution for display)

2. in next revision (if), may be you can put keywords DIY and/or Open
Hardware (irrespective of whatever exactly that means) Laptop in the
subject itself, that might bring more interest/eyeballs, especially at
this time of ME & so on.

Regards
afzal
