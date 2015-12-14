From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ehci-platform: Add support for
 controllers with multiple reset lines
Date: Mon, 14 Dec 2015 21:11:32 +0100
Message-ID: <1450123892.3407.86.camel@pengutronix.de>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
	 <1449848520-27379-2-git-send-email-hdegoede@redhat.com>
	 <1449853984.3419.52.camel@pengutronix.de> <566B15B7.40703@redhat.com>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBB7GEXSZQKGQETNSZWMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <566B15B7.40703-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 11.12.2015, 19:28 +0100 schrieb Hans de Goede:
[...]
> >> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> >> index a12d601..0701812 100644
> >> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> >> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> >> @@ -18,7 +18,7 @@ Optional properties:
> >>    - clocks : a list of phandle + clock specifier pairs
> >>    - phys : phandle + phy specifier pair
> >>    - phy-names : "usb"
> >> - - resets : phandle + reset specifier pair
> >> + - resets : a list of phandle + reset specifier pairs
> >
> > Are there documented names for these resets?
> 
> This binding is a generic ehci controller binding, so even if
> the names are documented for the allwinner SoC we should
> not use names, just like the binding is deliberately not
> using names for the clocks either to keep it generic, so
> that we can reuse the binding + driver with many different SoCs.

I know, I'm just interested in understanding why this is necessary ...

> > Is the companion you
> > mention the Port Control?
> 
> Sort of, with USB-2, USB-1 compatibility is handled via a mux on the
> datalines (controlled by the EHCI controller Port Control) which muxes
> the lines to an USB-1 controller (typically either UHCI or OHCI) when the
> device does not connect after USB-2 highspeed handshaking.
> 
> This USB-1 controller (or controller_S_ in some case since the
> USB-1 companions may have less root-ports per controller then the EHCI
> has root-ports) is called the companion controller.
> 
> The 2 controllers are supposed to be 100% independent but on the H3
> Allwinner has done something (not documented) which requires one to
> deassert reset on both before you can talk to either one.

... so thank you for the explanation.

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp
