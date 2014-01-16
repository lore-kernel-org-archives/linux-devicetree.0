From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/2] ehci-platform: Add support for clks
 and phy passed through devicetree
Date: Wed, 15 Jan 2014 16:11:03 -0800
Message-ID: <CAGVrzcY1koEX=9pJHMOZ4rvKn49aAEzFvvqvsS74N+nDRW2L+g@mail.gmail.com>
References: <1389813883-567-1-git-send-email-hdegoede@redhat.com> <1389813883-567-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH67JWTV4DBBQGH3SLAKGQEI4ALISI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1389813883-567-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014/1/15 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> Currently ehci-platform is only used in combination with devicetree when used
> with some Via socs. By extending it to (optionally) get clks and a phy from
> devicetree, and enabling / disabling those on power_on / off, it can be used
> more generically. Specifically after this commit it can be used for the
> ehci controller on Allwinner sunxi SoCs.
>
> Since ehci-platform is intended to handle any generic enough non pci ehci
> device, add a "usb-ehci" compatibility string.
>
> There already is a usb-ehci device-tree bindings document, update this
> with clks and phy bindings info.
>
> Although actually quite generic so far the via,vt8500 compatibilty string
> had its own bindings document. Somehow we even ended up with 2 of them. Since
> these provide no extra information over the generic usb-ehci documentation,
> this patch removes them.
>
> The ehci-ppc-of.c driver also claims the usb-ehci compatibility string,
> even though it mostly is ibm,usb-ehci-440epx specific. ehci-platform.c is
> not needed on ppc platforms, so add a !PPC_OF dependency to it to avoid
> 2 drivers claiming the same compatibility string getting build on ppc.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-ehci.txt |  25 +++-
>  .../devicetree/bindings/usb/via,vt8500-ehci.txt    |  15 ---
>  .../devicetree/bindings/usb/vt8500-ehci.txt        |  12 --
>  drivers/usb/host/Kconfig                           |   1 +
>  drivers/usb/host/ehci-platform.c                   | 149 +++++++++++++++++----
>  5 files changed, 142 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/via,vt8500-ehci.txt
>  delete mode 100644 Documentation/devicetree/bindings/usb/vt8500-ehci.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> index fa18612..fad10f3 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> @@ -7,13 +7,14 @@ Required properties:
>      (debug-port or other) can be also specified here, but only after
>      definition of standard EHCI registers.
>    - interrupts : one EHCI interrupt should be described here.
> -If device registers are implemented in big endian mode, the device
> -node should have "big-endian-regs" property.
> -If controller implementation operates with big endian descriptors,
> -"big-endian-desc" property should be specified.
> -If both big endian registers and descriptors are used by the controller
> -implementation, "big-endian" property can be specified instead of having
> -both "big-endian-regs" and "big-endian-desc".
> +
> +Optional properties:
> + - big-endian-regs : boolean, set this for hcds with big-endian registers
> + - big-endian-desc : boolean, set this for hcds with big-endian descriptors
> + - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc

These properties are specified here in the documentation binding, but
they are not handled by the ehci-platform driver, is that intentional?
Fairly quickly people will start adopting the ehci-platform driver on
DT-aware platforms, so it would be nice to support those 2 (3)
properties right away?
-- 
Florian
