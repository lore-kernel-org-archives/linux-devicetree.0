From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] bcma: register bcma as device tree driver
Date: Thu, 18 Sep 2014 22:03:57 +0200
Message-ID: <CACna6rw0-g+v6u3Yxhnmy1NT0mhj-s4re5R3z0dbBV-tMvky6Q@mail.gmail.com>
References: <1410904582-6519-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410904582-6519-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: John Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16 September 2014 23:56, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> +The cores on the AXI bus are auto detected by bcma. bcma automatical=
ly
> +detects the cores

I'm far from being an English expert, but above is kind of pleonasm to =
me ;)


> and the memory ranges they are using and they get
> +registered afterwards. Automatic detection of the IRQ number is not
> +possible on BCM47xx/BCM53xx ARM and MIPS SoCs.

Should we replace "not possible" with something like "not reliable"?
After the last info we got from Arend.


> +#ifdef CONFIG_BCMA_HOST_SOC
> +/* host_pci.c */

s/pci/soc/


> +#ifdef CONFIG_OF
> +extern int __init bcma_host_soc_register_driver(void);
> +extern void __exit bcma_host_soc_unregister_driver(void);
> +#else
> +static inline int __init bcma_host_soc_register_driver(void)
> +{
> +       return 0;
> +}
> +static inline void __exit bcma_host_soc_unregister_driver(void)
> +{
> +}
> +#endif /* CONFIG_OF */
> +#endif /* CONFIG_BCMA_HOST_SOC */

OK, so you just made bcma_host_soc_(un)register_driver calls safe above=
=2E


> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
> index c421403..e5d578c 100644
> --- a/drivers/bcma/main.c
> +++ b/drivers/bcma/main.c
> @@ -528,6 +528,13 @@ static int __init bcma_modinit(void)
>         if (err)
>                 return err;
>
> +#ifdef CONFIG_BCMA_HOST_SOC
> +       err =3D bcma_host_soc_register_driver();
> +       if (err) {
> +               pr_err("SoC host initialization failed\n");
> +               err =3D 0;
> +       }
> +#endif

And above you check for CONFIG_ anyway.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
