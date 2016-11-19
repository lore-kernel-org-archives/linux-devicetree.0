From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v8] mwifiex: parse device tree node for PCIe
Date: Sat, 19 Nov 2016 08:56:15 +0200
Message-ID: <87lgwghsa8.fsf@kamboji.qca.qualcomm.com>
References: <1479472624-22340-1-git-send-email-akarwar@marvell.com>
        <87oa1coj1m.fsf@purkki.adurom.net>
        <CACK8Z6EAXTd07ZK3Y6Hy=7iGEY0fN91gO9Tz0NMh+shDAJoc+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACK8Z6EAXTd07ZK3Y6Hy=7iGEY0fN91gO9Tz0NMh+shDAJoc+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Rajat Jain's message of "Fri, 18 Nov 2016 08:38:52 -0800")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> writes:

> On Fri, Nov 18, 2016 at 8:21 AM, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
>     > @@ -10,6 +10,8 @@ Required properties:
>     >=C2=A0 =C2=A0 - compatible : should be one of the following:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0* "marvell,sd8897"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0* "marvell,sd8997"
>     > +=C2=A0 =C2=A0 =C2=A0* "pci11ab,2b42"
>     > +=C2=A0 =C2=A0 =C2=A0* "pci1b4b,2b42"
>
>     Are these correct? In v6 Rob said:
>
>     "I think I already said this, but you have the vendor and product IDs
>     reversed."
>
>     https://patchwork.kernel.org/patch/9390225/
>=20=20=20=20
>
>
> I had responded to it:
>
>
> Hi Rob,
>
>> I think I already said this, but you have the vendor and product IDs
>> reversed.
>
> Actually Marvell has 2 vendor IDs assigned to it. In include/linux/pci_id=
s.h:
>
> #define PCI_VENDOR_ID_MARVELL           0x11ab
> #define PCI_VENDOR_ID_MARVELL_EXT       0x1b4b
>
> So in this case the compatible property describes a single product ID,
> with both possible vendor IDs.

Ok, I missed that.

BTW, please avoid using HTML. text/plain is very much preferred.

--=20
Kalle Valo
