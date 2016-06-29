From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Wed, 29 Jun 2016 21:33:59 +0200
Message-ID: <6402170.5s0abZDqlD@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com> <f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBFGE2C5QKGQE3D34A2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <f8995599-115d-87e5-7928-c029b48584f1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday, June 29, 2016 8:51:44 PM CEST Arend Van Spriel wrote:
> > Typical wifi devices will have some sort of non volatile storage
> > on board to not only store the ethernet(mac) address, but also
> > to contain e.g. info about the antenna gain so that the firmware
> > and/or the driver can take the antenna gain into account and ensure
> > that they never exceed the maximum allowed broadcast strength.
> > 
> > However on some embedded devices there is no non-volatile storage
> > for the wifi (for cost reasons) and instead this configuration info
> > (which is board / pcb specific) is loaded in the form of a
> > file which contains the contents which would normally be in the
> > non-volatile storage.
> > 
> > Since we are dealing with a per-board config-file here, which is
> > loaded from the os filesystem we really need to specify a basename
> > here as the list of possible boards is endless, so we cannot
> > have a lookup table in the driver.
> 
> As Jonas mentioned the general principle of device tree is to be
> agnostic with regards to OS and/or driver as you undoubtedly know. His
> proposal seems like a usable solution for your problem while complying
> to the device tree principle. So instead of overriding the default
> brcmfmac should modify it when dt specifies the "module" property, ie:
> 
> no "module" in DT:      nvram filename = brcm/brcmfmac43362-sdio.txt
> "module=ap6210" in DT:  nvram filename = brcm/brcmfmac43362-ap6210.txt
> 
> By the way, the example in the bindings file does not seem to specify a
> basename, but path+basename+fileext.

What is the size of this nvram file? As it's board specific, I wonder
if we can simply include it inside of the DT verbatim. I remember
doing that (in the pre-dtb days, on real open firmware) for the "spidernet"
ethernet driver.

	Arnd
