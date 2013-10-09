From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Dove: fix bad properties of the si5351 clkout2
 used by Cubox audio
Date: Wed, 9 Oct 2013 09:23:56 -0400
Message-ID: <20131009132356.GB5402@titan.lakedaemon.net>
References: <20131008202027.6d9f0bd2@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131008202027.6d9f0bd2@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 08:20:27PM +0200, Jean-Francois Moine wrote:
> As defined in the DT, clkout2 is not allowed to change the pll inside
> si5351.
> 
> This patch extends the properties of clkout2 so that it works as the
> external clock of the audio device in the Cubox.
> 
> Also, as the second si5351 clock is not used in the Cubox, its
> definition is removed.
> 
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
> v2:
> - remove clkout1 which is not used in the Cubox (Sebastian Hesselbarth)
> ---
>  arch/arm/boot/dts/dove-cubox.dts | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied to mvebu/dt with Sebastian's Ack.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
