From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] [kernel] ARM: lpc32xx: migrate CLCD config to
 device tree
Date: Tue, 28 Mar 2017 13:28:23 -0400
Message-ID: <1490722103.24147.5.camel@gmail.com>
References: <20170308174638.25578-1-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170308174638.25578-1-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, 2017-03-08 at 12:46 -0500, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
> 
> Migrate the CLCD configurations to the device tree and
> remove custom functions from board files.
> 
> This change depends on the following change:
> "video: ARM CLCD: fix dma allocation size"
> https://www.spinics.net/lists/arm-kernel/msg567178.html
> 
> Note:
> * We tested a similar change on a custom LPC32xx board with a 480x272 LCD.
> * We did not test this change on hardware;
>   we do not have access to a PHY3250 board with the 240x320 LCD.
> 
> Liam Beguin (2):
>   ARM: dts: lpc32xx: phy3250: add clcd configuration
>   ARM: lpc32xx: drop CLCD configuration
> 
>  arch/arm/boot/dts/lpc3250-phy3250.dts | 35 ++++++++++++++++++
>  arch/arm/mach-lpc32xx/phy3250.c       | 70 -----------------------------------
>  2 files changed, 35 insertions(+), 70 deletions(-)
> 
do you think you can look at this patchset?


Regards,
Sylvain


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
