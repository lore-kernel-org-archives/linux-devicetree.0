From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: phy-lpc18xx-usb-otg: remove unit address
 from binding
Date: Wed, 2 Mar 2016 11:34:40 -0600
Message-ID: <20160302173440.GA4583@rob-hp-laptop>
References: <1456352438-15691-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456352438-15691-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 11:20:38PM +0100, Joachim Eastwood wrote:
> DT bindings should either use a unit address and a reg property
> or none of them. Since either of them aren't really useful for
> such a simple device like this one remove the unit address.
> 
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Hi Rob,
> 
> As discussed here:
> http://marc.info/?l=devicetree&m=145626556706715&w=2
> 
> I'll take the DT changes through my own tree. Note that
> they might not make it in the next kernel release.

Okay.

>  Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
