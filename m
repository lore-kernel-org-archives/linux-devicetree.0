From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controllers: add
 description of SIC1 and SIC2
Date: Mon, 25 Apr 2016 09:51:24 -0500
Message-ID: <20160425145124.GA23792@rob-hp-laptop>
References: <1461545990-25560-1-git-send-email-vz@mleia.com>
 <1461546023-25614-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461546023-25614-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 04:00:23AM +0300, Vladimir Zapolskiy wrote:
> NXP LPC32xx has three interrupt controllers, namely root Main
> Interrupt Controller (MIC) and two supplementary Sub Interrupt
> Controllers (SIC1 and SIC2), four interrupt outputs from SIC1 and SIC2
> are connected to MIC.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> ---
> Changes from v1 to v2:
> * removed introduced optional "interrupt-controller-name" property,
>   for users the name of a controller will be constructed from mic/sic
>   and controller physical address,
> * removed introduced optional "wakeup-sources" property, a list of
>   mappings between a hardware interrupt and its correspondent wakeup source
>   to exit CPU STOP mode will be discussed later on,
> * other negligible changes (rewording, small letters in unit address etc.)
> 
>  .../interrupt-controller/nxp,lpc3220-mic.txt       | 70 ++++++++++++++--------
>  1 file changed, 46 insertions(+), 24 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
