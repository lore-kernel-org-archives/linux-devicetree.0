From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARC: [plat-eznps] remove macros for timer0 TSI
Date: Fri, 21 Oct 2016 16:12:17 +0200
Message-ID: <20161021141217.GA5553@mai>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
 <1476370350-3853-3-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476370350-3853-3-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 13, 2016 at 05:52:29PM +0300, Noam Camus wrote:
> From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Now it is defined at include/soc/nps/mtm.h
> It will be used by module from driver/clocksource/
> 

This patch should be folded with the previous one in order to prevent
to break the git bisecting, otherwise there will be duplicate macros
at some point, leading to a compilation failure.


> Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arc/plat-eznps/include/plat/ctop.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
> index 9d6718c..ee2e32d 100644
> --- a/arch/arc/plat-eznps/include/plat/ctop.h
> +++ b/arch/arc/plat-eznps/include/plat/ctop.h
> @@ -46,9 +46,7 @@
>  #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
>  
>  /* EZchip core instructions */
> -#define CTOP_INST_HWSCHD_OFF_R3			0x3B6F00BF
>  #define CTOP_INST_HWSCHD_OFF_R4			0x3C6F00BF
> -#define CTOP_INST_HWSCHD_RESTORE_R3		0x3E6F70C3
>  #define CTOP_INST_HWSCHD_RESTORE_R4		0x3E6F7103
>  #define CTOP_INST_SCHD_RW			0x3E6F7004
>  #define CTOP_INST_SCHD_RD			0x3E6F7084
> -- 
> 1.7.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
