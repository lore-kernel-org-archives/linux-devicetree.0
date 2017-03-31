From: jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Fri, 31 Mar 2017 11:52:09 +0200
Message-ID: <20170331095209.GG7900@w540>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-3-git-send-email-jacopo+renesas@jmondi.org>
 <20170330223903.yafbhrdulrnv2pfz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170330223903.yafbhrdulrnv2pfz@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
   thanks for the ack

On Thu, Mar 30, 2017 at 05:39:03PM -0500, Rob Herring wrote:
> On Fri, Mar 24, 2017 at 04:22:09PM +0100, Jacopo Mondi wrote:
> > Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> > controller.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> > ---
> >  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 143 +++++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Just an heads-up: in v4 dt bindings will change considerably to meet a
format more close to standard pin controller bindings.

I cannot take you ack here and apply to next iteration as it will
require you or other dt guardians to have a look at it again. Sorry
about this.

Thanks
   j

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
