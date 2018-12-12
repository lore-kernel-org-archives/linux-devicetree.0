From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 12 Dec 2018 08:55:51 +0200
Message-ID: <877egfmdxk.fsf@linux.intel.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com> <1544445555-17325-3-git-send-email-pawell@cadence.com> <87h8fkmfar.fsf@linux.intel.com> <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com> <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL411-ryK2LLZVg5_sLkCYOuhwdHLVm5XavSyC9nbEXZah_43w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>, pawell@cadence.com
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, rogerq@ti.com, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Chen <hzpeterchen@gmail.com> writes:

>> >> +            tmode =3D le16_to_cpu(ctrl->wIndex);
>> >> +
>> >> +            if (!set || (tmode & 0xff) !=3D 0)
>> >> +                    return -EINVAL;
>> >> +
>> >> +            switch (tmode >> 8) {
>> >> +            case TEST_J:
>> >> +            case TEST_K:
>> >> +            case TEST_SE0_NAK:
>> >> +            case TEST_PACKET:
>> >> +                    cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>> >> +                                           USB_CMD_STMODE |
>> >> +                                           USB_STS_TMODE_SEL(tmode -=
 1));
>> >
>> >I'm 90% sure this won't work. There's a reason why we only enter the
>> >requested test mode from status stage. How have you tested this?
>>
>
> What's the reason?
> It can work although the code is a little different with above, I
> tested it using USBxHSETT tool at Windows.

put a sniffer. Status stage won't complete

>> >> +    irqreturn_t ret =3D IRQ_NONE;
>> >> +    unsigned long flags;
>> >> +    u32 reg;
>> >> +
>> >> +    priv_dev =3D cdns->gadget_dev;
>> >> +    spin_lock_irqsave(&priv_dev->lock, flags);
>> >
>> >you're already running in hardirq context. Why do you need this lock at
>> >all? I would be better to use the hardirq handler to mask your
>> >interrupts, so they don't fire again, then used the top-half (softirq)
>> >handler to actually handle the interrupts.
>>
>
> This controller may be ran at SMP environment, register and flag access
> needs to be protected among CPUs running.

in hardirq context? When interrupts are already disabled?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwQsPcACgkQzL64meEa
mQaFMhAAivaFXmE5zk1145Lxf0qGZfICtUAOftRLhjxoE8QiyVaONzDrWmSfVZOV
BFxf5p2YunTi5DEk2o/YVvDnmqmg5ctc5MASUeyuvBskEK8xAj5pcJ3zC4fGc10F
roSp3Lh8VPvTy9p9Plzj6wqtCf6cGQGdmFhZU9m8uOBH+5venL7+l2Nr/i+YwFyN
iq8s6YxT/qVNr311BZFokIH3ddfUNWRrizVfgfYORHU4NrSw5XV8185YvpRmZgbf
Ji8F6PNxtwkdVDhYlBcdApxMTpwsz8ZksPuJ8g8NhRoyksxL4J02qQUykMcSEkDS
h4H4+kMJWF+lC6a9Aj6KbaECK6IglZrkn7XLZURUmV6GxduvuiRWQ/FjAMbvrsYa
DjSPCyrIH1SODNw26ij0N/EYtGMQqkM5voRYN1fDb+u1dTT8ZTYZAYbHMAUDX+Kv
Fd3CZjeG7mQGWq7ctGWTKZAOA539rBczTN12YquxGneXa7xMjh4PuUfi6hqA9nxP
4S/+yyu51P1qrdCFjKcbiSd/SrPnOLLtKmb2tppokczi2H51XubfZcSNLha2OCfs
edcJQnY1XSbB+fHuZ3mKtwP+5RzhTnSEvAor96/hz6WPGh2W2xgySWieoRR2jauO
oOawN3NoHxsj8MTILERYcMKE3mfTZclHEv7Q58KjZTlssnudmDo=
=kGLu
-----END PGP SIGNATURE-----
--=-=-=--
