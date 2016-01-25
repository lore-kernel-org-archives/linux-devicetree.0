From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: Add support for Juno r2 board
Date: Mon, 25 Jan 2016 13:40:07 -0600
Message-ID: <20160125194007.GA11111@rob-hp-laptop>
References: <1453734849-13790-1-git-send-email-sudeep.holla@arm.com>
 <1453734849-13790-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453734849-13790-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2016 at 03:14:09PM +0000, Sudeep Holla wrote:
> Juno r2 is identical to Juno r1 with Cortex A57 cores replaced by
> Cortex A72 cores.
> 
> Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arm-boards   |  1 +
>  arch/arm64/boot/dts/arm/Makefile                   |  2 +-
>  .../boot/dts/arm/{juno-r1.dts => juno-r2.dts}      | 30 +++++++++++-----------
>  3 files changed, 17 insertions(+), 16 deletions(-)
>  copy arch/arm64/boot/dts/arm/{juno-r1.dts => juno-r2.dts} (87%)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
