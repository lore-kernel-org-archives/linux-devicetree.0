From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Mon, 04 Jul 2016 16:54:25 +0200
Message-ID: <8717879.O1RMZcQt4V@wuerfel>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com> <5756670.9hMGo8oEyl@wuerfel> <6cc6dabf-e6da-d70d-3cce-a7f1804f233e@broadcom.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDEKVJM7XAHRB5PP5G5QKGQEBR43GSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6cc6dabf-e6da-d70d-3cce-a7f1804f233e-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, July 4, 2016 11:08:38 AM CEST Arend Van Spriel wrote:
> On 4-7-2016 10:55, Arnd Bergmann wrote:
> > On Monday, July 4, 2016 10:41:20 AM CEST Arend Van Spriel wrote:
> >> On 2-7-2016 23:30, Arnd Bergmann wrote:
> >>> On Saturday, July 2, 2016 8:20:35 PM CEST Arend Van Spriel wrote:
> >>>>> If you want a separate property, then I repeat my very first
> >>>>> suggestion, the well defined model property.
> >>>>> e.g.
> >>>>>
> >>>>> brcmf@0 {
> >>>>>         model =3D "ampak,ap6210";
> >>>>>         compatible =3D "brcm,bcm4329-fmac";
> >>>>>         ...
> >>>>> };
> >>>>>
> >>>>> All device nodes may have a model property, not just the top "machi=
ne" one.
> >>>>
> >>>> I heard you the first time  I just was not sure what the implication=
s
> >>>> would be to use it. Hence I suggested a vendor specific property.
> >>>> However, looking up and reading the definition in ePAPRv1.1 I suppos=
e it
> >>>> is fine to use the model property:
> >>>>
> >>>> Property: model
> >>>> Value type: <string>
> >>>> Description:
> >>>> The model property value is a <string> that specifies the manufactur=
er=E2=80=99s
> >>>> model number of the device.
> >>>>
> >>>> The recommended format is: =E2=80=9Cmanufacturer,model=E2=80=9D, whe=
re manufacturer is a
> >>>> string describing the name of the manufacturer (such as a stock tick=
er
> >>>> symbol), and model specifies the model number.
> >>>
> >>> The model property is very similar to compatible, except that there i=
s
> >>> only one entry rather than a list of entries from most specific to
> >>> most generic.
> >>
> >> They seem very similar, but I think there is a conceptual difference.
> >> The compatible property is mainly used to select the appropriate drive=
r
> >> and as such the property is typically ignored by device drivers.
> >> Probably there are exceptions to be found.
> >>
> >>> I think by writing the above example as
> >>>
> >>>       compatible =3D "ampak,ap6210", "brcm,bcm4329-fmac";
> >>>
> >>> we can provide the same functionality in a slightly simpler way, the =
driver
> >>> then just goes on to look for the nvram file for each entry in sequen=
ce until
> >>> it finds one.
> >>
> >> Not sure why this would be simpler. Why would traversing the compatibl=
e
> >> string be simpler than handling the model property if present and
> >> otherwise fallback to the default nvram naming.
> >=20
> > Because you have to walk the list anyway to find the other firmware fil=
es:
> > when you have a specialization of a device that requires listing both v=
alues
> > as compatible, the driver has no idea which of the entries to use, unle=
ss
> > you add a lookup table that adds more complexity.
>=20
> Currently, the brcmfmac bindings describe a single compatible string,
> ie. "brcm,bcm4329-fmac", which selects the driver/programming model. If
> that programming model supports "use model property if present,
> otherwise use default" there is nothing to traverse. The default way in
> the driver to determine firmware and nvram filename already has a lookup
> table which uses the chip id and chip revision as key, which are read
> from the device.

In drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c I already see
over a dozen different chips being supported, bcm4329 is only one of
them. In particular, there seem to be some that have various modules:

        BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0x0000001F, 43241B0),
        BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0x00000020, 43241B4),
        BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0xFFFFFFC0, 43241B5),

So if you have a bcm43241, that compatible string probably should
include both brcm,bcm43241-b4-fmac and brcm,bcm43241-fmac, possibly also
brcm,bcm4329-fmac, to show that it is a superset of the programming
interface of that one.

	Arnd

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
