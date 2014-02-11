From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ohci-/ehci-platform: Change compatible string to ?hci-platform
Date: Tue, 11 Feb 2014 16:54:28 +0100
Message-ID: <52FA47B4.50507@redhat.com>
References: <Pine.LNX.4.44L0.1402111023240.1209-100000@iolanthe.rowland.org> <1635726.gc3dEs0zOi@wuerfel>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBQ4P5GLQKGQE4GEXB5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1635726.gc3dEs0zOi@wuerfel>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/11/2014 04:43 PM, Arnd Bergmann wrote:
> On Tuesday 11 February 2014 10:27:12 Alan Stern wrote:
>>
>> It might even be a good idea to change the "xhci-platform" string to 
>> match, it that doesn't cause too much trouble.
> 
> The original xhci binding was contributed by Al Cooper, but I don't
> see any dts files using it. I agree that xhci-generic is a better
> name than xhci-platform, and I think we should make that the recommended
> string. If Al or someone thinks the xhci-generic string might already
> be used in production devices, we should however allow both names
> in the binding and in the driver.

I can live with generic as pre/post fix. Looking at what seems to
be the common trend I believe it should be a pre-fix and nost a post-fix
though.

The common way to build a compatible string seems to be:
vendor,soc_model-function. We have a few deviations from this in the
usb bindings, but ie the interrupt-controller bindings use this
structure for the compatible strings everywhere.

So since generic has no vendor, we fill just the soc_model-function
part leading to:
generic-ohci
generic-ehci

And possible also:
generic-uhci
generic-xhci

So I'm going to respin my 2 fixup patches to move from ?hci-platform
to generic-?hci.

Regards,

Hans
