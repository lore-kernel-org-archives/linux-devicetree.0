From: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Wed, 20 Jun 2012 07:41:11 +0800
Message-ID: <c29d9643-0962-46e7-b726-cebdac7d9a67@email.android.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <1339590863-10564-9-git-send-email-richard.zhao@freescale.com> <CAOMZO5AxnOCqajCS39bpjo-86FXSV9C8fMPrhmRXH=OndfXuVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5AxnOCqajCS39bpjo-86FXSV9C8fMPrhmRXH=OndfXuVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=46abio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>On Wed, Jun 13, 2012 at 9:34 AM, Richard Zhao
><richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> +static void __init imx6q_config_on_boot(void)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct device_node *np;
>> + =C2=A0 =C2=A0 =C2=A0 struct property *pp;
>> + =C2=A0 =C2=A0 =C2=A0 int cnt, len, i;
>> + =C2=A0 =C2=A0 =C2=A0 int gpio;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 np =3D of_find_node_by_path("/config-on-boot"=
);
>> + =C2=A0 =C2=A0 =C2=A0 if (!np)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> + =C2=A0 =C2=A0 =C2=A0 cnt =3D of_gpio_named_count(np, "output-gpios=
");
>> + =C2=A0 =C2=A0 =C2=A0 pp =3D of_find_property(np, "output-gpio-valu=
es", &len);
>> + =C2=A0 =C2=A0 =C2=A0 if (!pp || cnt !=3D len / sizeof(u32)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Invalid c=
onfig-on-boot gpios!\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_node_put(np);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < cnt; i++) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio =3D of_get_n=
amed_gpio(np, "output-gpios", i);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gpio_is_valid=
(gpio))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "con=
fig-on-boot");
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 of_node_put(np);
>> +}
>
>Couldn't this function be made generic and put outside of mach-imx6q.c
>so that other platforms could use it?
>
>I need the same for mxs.
Yes, it is common. But it must be called after populate devices.  Rob d=
idn't agree the way yet.
--=20
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
