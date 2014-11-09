From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 02/11] ARM: dts: omap3-igep00x0: Move NAND configuration
 to a common place.
Date: Sun, 9 Nov 2014 09:17:54 +0100
Message-ID: <CABxcv=k+rGscdzB0mtTie5YyvEHxws1tCveytmSYU=dK01wm1A@mail.gmail.com>
References: <1415275311-6857-1-git-send-email-eballetbo@iseebcn.com>
	<1415275311-6857-3-git-send-email-eballetbo@iseebcn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1415275311-6857-3-git-send-email-eballetbo@iseebcn.com>
Sender: linux-omap-owner@vger.kernel.org
To: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Enric,

On Thu, Nov 6, 2014 at 1:01 PM, Enric Balletbo i Serra
<eballetbo@iseebcn.com> wrote:
> At this moment all supported boards use same NAND chip, so has more sense
> move the GPMC and NAND configuration to the omap3-igep.dtsi common place.
>
> Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>

Agreed that makes sense to factor out this into the .dtsi

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
