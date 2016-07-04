From: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Mon, 4 Jul 2016 10:41:20 +0200
Message-ID: <ac480a61-5bfd-5d0c-26fe-b85220ee5076@broadcom.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <CAOiHx=m8Zf0T4=BTG6BMRjj3kOHzt4YaQa3yzutmrhFSOyZMmA@mail.gmail.com>
 <ced2a770-2724-bdc9-7e2a-3dc9f76abf29@broadcom.com>
 <7975990.MvNRQ06u39@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7975990.MvNRQ06u39@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2-7-2016 23:30, Arnd Bergmann wrote:
> On Saturday, July 2, 2016 8:20:35 PM CEST Arend Van Spriel wrote:
>>> If you want a separate property, then I repeat my very first
>>> suggestion, the well defined model property.
>>> e.g.
>>>
>>> brcmf@0 {
>>>         model =3D "ampak,ap6210";
>>>         compatible =3D "brcm,bcm4329-fmac";
>>>         ...
>>> };
>>>
>>> All device nodes may have a model property, not just the top "machi=
ne" one.
>>
>> I heard you the first time  I just was not sure what the implication=
s
>> would be to use it. Hence I suggested a vendor specific property.
>> However, looking up and reading the definition in ePAPRv1.1 I suppos=
e it
>> is fine to use the model property:
>>
>> Property: model
>> Value type: <string>
>> Description:
>> The model property value is a <string> that specifies the manufactur=
er=E2=80=99s
>> model number of the device.
>>
>> The recommended format is: =E2=80=9Cmanufacturer,model=E2=80=9D, whe=
re manufacturer is a
>> string describing the name of the manufacturer (such as a stock tick=
er
>> symbol), and model specifies the model number.
>=20
> The model property is very similar to compatible, except that there i=
s
> only one entry rather than a list of entries from most specific to
> most generic.

They seem very similar, but I think there is a conceptual difference.
The compatible property is mainly used to select the appropriate driver
and as such the property is typically ignored by device drivers.
Probably there are exceptions to be found.

> I think by writing the above example as
>=20
> 	compatible =3D "ampak,ap6210", "brcm,bcm4329-fmac";
>=20
> we can provide the same functionality in a slightly simpler way, the =
driver
> then just goes on to look for the nvram file for each entry in sequen=
ce until
> it finds one.

Not sure why this would be simpler. Why would traversing the compatible
string be simpler than handling the model property if present and
otherwise fallback to the default nvram naming.

Regards,
Arend
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
