From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 17 Oct 2014 14:25:01 +0200
Message-ID: <F0D1326B-4716-4897-8259-1591B64EB55C@codeaurora.org>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com> <20141002132914.GN5788@leverpostej> <87ppeamvr9.fsf@kamboji.qca.qualcomm.com> <542DA1F7.9090904@amacapital.net> <CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com> <CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com> <87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vbnvhls4.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Adrian Chadd <adrian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 7, 2014, at 6:44 PM, Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org> wrote:

> Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> writes:
>=20
>> Perhaps unsurprisingly, the OpenWRT patch that enables it to work fo=
r
>> real (by shoving a file into /lib/firmware that's contains a copy of
>> data read from flash) hasn't made it upstream.  I assume that the
>> purpose of this discussion is to settle on a real solution.
>=20
> I'm hoping to have ath10k support three different methods to get
> calibration data:
>=20
> 1) OTP (already supported)
>=20
> 2) Device Tree (under discussion)
>=20
> 3) from a file
>=20
> I'm hoping to send patches for 2) and 3) soon.


As Arnd mentioned you would have something like:

pci {  =20
        pcie@0 {
                reg =3D <0 0 0 0 0>;=20
                #interrupt-cells =3D <1>;
                #size-cells =3D <2>;
                #address-cells =3D <3>;
                device_type =3D "pci";

                ath10k@0,0 {
                        reg =3D <0x0000 0x0 0x0 0x0 0x0>;
                        device_type =3D "pci";
                        qcom,ath10k-calibration-data =3D [ 01 03 04 05 =
06 =85 ];
                };     =20
        };
};

On the driver side you can do something like:

	struct device_node *np;

	np =3D pci_device_to_OF_node(dev);

than you can do normal OF calls on =91np=92.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
