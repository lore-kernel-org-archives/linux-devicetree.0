From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ohci-/ehci-platform: Change compatible string to ?hci-platform
Date: Tue, 11 Feb 2014 16:43:37 +0100
Message-ID: <1635726.gc3dEs0zOi@wuerfel>
References: <Pine.LNX.4.44L0.1402111023240.1209-100000@iolanthe.rowland.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBMEK5GLQKGQELHWFGAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1402111023240.1209-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 11 February 2014 10:27:12 Alan Stern wrote:
> 
> It might even be a good idea to change the "xhci-platform" string to 
> match, it that doesn't cause too much trouble.

The original xhci binding was contributed by Al Cooper, but I don't
see any dts files using it. I agree that xhci-generic is a better
name than xhci-platform, and I think we should make that the recommended
string. If Al or someone thinks the xhci-generic string might already
be used in production devices, we should however allow both names
in the binding and in the driver.

	Arnd
