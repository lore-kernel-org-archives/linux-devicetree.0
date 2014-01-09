From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/2] ohci and ehci-platform clks, phy and dt support
Date: Thu,  9 Jan 2014 18:57:04 +0100
Message-ID: <1389290226-6971-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB6GFXOLAKGQEUT4W2OA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

Here is v3 of my ohci and ehci-platform clks, phy and dt support patch-set.

This version is mostly the result of some discussions on irc with Maxime to
improve the dt-bindings. This has resulted in 2 changes:

1) Drop the clock-names from the dt-bindings, instead get clocks by index.

Since the intend is to be a generic ohci / ehci driver, the code does not
give any special meaning to any of the clocks, so simply just get as many
clocks as there are by index.

2) Change the compatible string to "mmio-ohci" resp. "mmio-ehci"

v2 was using allwinner,sun4i-ohci as compat string to avoid having to come
up with a generic name, but in retrospect this is the wrong thing to do. This
will likely lead to dts files for non allwinner boards using compatible =
"allwinner,sun4i-ohci", and if we then ever need to do some allwinner specific
quirks, these boards end up getting these quirks applied too.

dts files should use the generic mmio-ehci compatible as least prefered option,
ie: compatible = "allwinner,sun7i-a20-ehci", "mmio-ehci";

This will allow use of the generic driver while leaving the option open to
later add soc specific quirks without needing dt changes.

Regards,

Hans
