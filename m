From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10 v3] usb: usb251xb: Update usb251xb bindings
Date: Thu, 26 Oct 2017 22:21:55 -0500
Message-ID: <20171027032155.flrvucjbtbjlodoi@rob-hp-laptop>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
 <20171022203812.9379-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171022203812.9379-2-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 22, 2017 at 11:38:03PM +0300, Serge Semin wrote:
> Since hub usb2517 is going to be supported by the usb251xb driver,
> the bindings need to be properly updated. Particularly:
> - add "microchip,usb2517" and "microchip,usb2517i" compatible strings.
> - add "boolean" description to all the properties, which really accept
> a boolean value including a new one "led-{usb,speed}-mode".
> - move reset-gpios property to the optional section. It isn't
> defined as required in the code and shouldn't be required at all, since
> hardware may handle reset pins by itself.
> - add new led-{usb,speed}-mode mode property. USB2517 device supports
> two LED modes: USB mode and speed (default) indication mode. The last one
> can be switched on by this property.
> - add {bp,sp}-max-{total,removable}-current-microamp property measured in
> microamp. It hasn't been defined as property before. Since the limitation
> specified by these parameters is hardware specific it needs to be defined
> in dts.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/usb251xb.txt           | 46 +++++++++++++++-------
>  1 file changed, 32 insertions(+), 14 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
