From: sakari.ailus@iki.fi
Subject: Re: [PATCH 0/6] media: sun6i: Separate H3 compatible from A31
Date: Fri, 14 Dec 2018 00:10:31 +0200
Message-ID: <20181213221030.f7c5mzuyke3ik43r@valkosipuli.retiisi.org.uk>
References: <20181130075849.16941-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130075849.16941-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

On Fri, Nov 30, 2018 at 03:58:43PM +0800, Chen-Yu Tsai wrote:
> The CSI (camera sensor interface) controller found on the H3 (and H5)
> is a reduced version of the one found on the A31. It only has 1 channel,
> instead of 4 channels supporting time-multiplexed BT.656 on the A31.
> Since the H3 is a reduced version, it cannot "fallback" to a compatible
> that implements more features than it supports.
> 
> This series separates support for the H3 variant from the A31 variant.
> 
> Patches 1 ~ 3 separate H3 CSI from A31 CSI in the bindings, driver, and
> device tree, respectively.
> 
> Patch 4 adds a pinmux setting for the MCLK (master clock). Some camera
> sensors use the master clock from the SoC instead of a standalone
> crystal.

I've picked patches 1 and 2, but I presume patches 3 and 4 would go through
another tree. Is that right?

> 
> Patches 5 and 6 are examples of using a camera sensor with an SBC.
> Since the modules are detachable, these changes should not be merged.
> They should be implemented as overlays instead.
> 
> Please have a look.
> 
> In addition, I found that the first frame captured seems to always be
> incomplete, with either parts cropped, out of position, or missing
> color components.


-- 
Regards,

Sakari Ailus
