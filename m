From: Alexander Aring <alex.aring@gmail.com>
Subject: Re: [PATCH v2 4/8] ARM: bcm2835: Split the DT for peripherals from
 the DT for the CPU
Date: Fri, 18 Dec 2015 11:00:46 +0100
Message-ID: <20151218100041.GA1145@omega>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
 <1450310115-22163-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450310115-22163-5-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Marc Zyngier <marc.zyngier@arm.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Wed, Dec 16, 2015 at 03:55:11PM -0800, Eric Anholt wrote:
> The set of peripherals remained constant across bcm2835 (Raspberry Pi
> 1) and bcm2836 (Raspberry Pi 2), but the CPU was swapped out.  Split
> the files so that we can include just peripheral setup in 2836.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
> -
>  		arm-pmu {
>  			compatible = "arm,arm1176-pmu";
>  		};
>  	};

This is bcm2835 related only? It's still inside bcm283x.dtsi, see [0].
The rename here makes it a little hard to review.

I suppose it should be removed from [0].

- Alex

[0] https://github.com/anholt/linux/blob/bcm2836-4.4/arch/arm/boot/dts/bcm283x.dtsi#L189
