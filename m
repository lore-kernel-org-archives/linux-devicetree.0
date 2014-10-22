From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Wed, 22 Oct 2014 15:02:30 +0300
Message-ID: <87tx2ws46h.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
	<20141002132914.GN5788@leverpostej>
	<87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
	<542DA1F7.9090904@amacapital.net>
	<CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com>
	<CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com>
	<87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
	<F0D1326B-4716-4897-8259-1591B64EB55C@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F0D1326B-4716-4897-8259-1591B64EB55C-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (Kumar
	Gala's message of "Fri, 17 Oct 2014 14:25:01 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Adrian Chadd <adrian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kumar,

Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> As Arnd mentioned you would have something like:
>
> pci {  =20
>         pcie@0 {
>                 reg =3D <0 0 0 0 0>;=20
>                 #interrupt-cells =3D <1>;
>                 #size-cells =3D <2>;
>                 #address-cells =3D <3>;
>                 device_type =3D "pci";
>
>                 ath10k@0,0 {
>                         reg =3D <0x0000 0x0 0x0 0x0 0x0>;
>                         device_type =3D "pci";
>                         qcom,ath10k-calibration-data =3D [ 01 03 04 0=
5 06 =E2=80=A6 ];
>                 };     =20
>         };
> };
>
> On the driver side you can do something like:
>
> 	struct device_node *np;
>
> 	np =3D pci_device_to_OF_node(dev);
>
> than you can do normal OF calls on =E2=80=98np=E2=80=99.

Ah, now I understand how this is supposed to work. Thank you very much
for providing an example.

--=20
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
