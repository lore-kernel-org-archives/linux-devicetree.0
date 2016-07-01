From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm, nvram_file_name
 dt property
Date: Fri, 01 Jul 2016 10:51:10 +0200
Message-ID: <5046715.4MWnq2SdoR@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <3960223.GqB9zXL8s8@wuerfel> <1f44df41-0111-441b-4671-718eec0c4346@broadcom.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBZG43C5QKGQE34YIDTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1f44df41-0111-441b-4671-718eec0c4346-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, June 30, 2016 9:23:56 PM CEST Arend Van Spriel wrote:
> 
> On 30-6-2016 13:31, Arnd Bergmann wrote:
> > On Thursday, June 30, 2016 12:25:15 PM CEST Hans de Goede wrote:
> >>> So then how about making use of a more specific compatible string?
> >>>
> >>> e.g.
> >>>
> >>> brcmf {
> >>>         compatible = "foo,ap6210", "brcm,bcm4329-fmac";
> >>>         ...
> >>> };
> >>>
> >>> and if the compatible has more than one element you request
> >>> FW_NAME_<compatible>.txt as the nvram file. Or try each comptible (and
> >>> lastly no suffix) until you get a match. (AFAICT, this is what the
> >>> "model" property was originally intended for anyway, but almost nobody
> >>> did it right, and everyone put a user readable string into "model" for
> >>> boards instead of the ePAPR defined compatible string).
> >>
> >> Hmm, interesting idea. Not sure how easy / hard it will be to implement
> >> this, but from a dt binding point of view it seems elegant.
> >>
> >> Kalle, Arend, what do you think of this ?
> 
> At first glance I like the suggestion, but this would mean updating the
> bindings document for each new wifi module that we want to add. Not a
> big problem, but it makes that I have a slight preference to using a
> property for it, eg. brcm,module = "ap6210";

I think we can be a little relaxed with the requirement for updating the
binding document here, as long as the binding lists all the strings that
are understood by the driver itself and documents that there can be
additional strings in it.

In particular, documenting how a compatible string that is made up from
the board id and revision should be unproblematic.

	Arnd
