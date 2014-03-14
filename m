From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: restrict BCM_KONA_UART to ARCH_BCM_MOBILE
Date: Fri, 14 Mar 2014 12:51:33 -0400
Message-ID: <20140314165133.GB25092@beef>
References: <1394127959-3159-1-git-send-email-f.fainelli@gmail.com>
 <1394127959-3159-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394127959-3159-3-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 06, 2014 at 09:45:55AM -0800, Florian Fainelli wrote:
> Low-level debugging using the Broadcom Kona UART only makes sense on the
> ARCH_BCM_MOBILE platform and would otherwise prevent ARCH_BCM_63XX from
> picking up the right UART implementation by default.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to mach-bcm armsoc/for-3.15/soc-3

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
