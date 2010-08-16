From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [patch] ehci-ppc-of: problems in unwind
Date: Mon, 16 Aug 2010 15:52:54 -0600
Message-ID: <AANLkTinq9m=8DHFLJRmdFceGn3+_j5wcT4bUws0_W-vm@mail.gmail.com>
References: <20100814090619.GY645@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100814090619.GY645@bicker>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Sean MacLennan <smaclennan-Qtffpm9i2AVWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Vitaly Bordug <vitb-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 14, 2010 at 3:06 AM, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> The iounmap(ehci->ohci_hcctrl_reg); should be the first thing we do
> because the ioremap() was the last thing we did. =A0Also if we hit an=
y of
> the goto statements in the original code then it would have led to a
> NULL dereference of "ehci". =A0This bug was introduced in: 796bcae736=
1c
> "USB: powerpc: Workaround for the PPC440EPX USBH_23 errata [take 3]"
>
> I modified the few lines in front a little so that my code didn't
> obscure the return success code path.
>
> Signed-off-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Looks correct, but I don't have the hardware to test.

Slightly-Reviewed-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

g.

> ---
> I don't have a cross compile environment set up so I haven't compiled
> this code. =A0Sorry for that.
>
> diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-p=
pc-of.c
> index 335ee69..ba52be4 100644
> --- a/drivers/usb/host/ehci-ppc-of.c
> +++ b/drivers/usb/host/ehci-ppc-of.c
> @@ -192,17 +192,19 @@ ehci_hcd_ppc_of_probe(struct platform_device *o=
p, const struct of_device_id *mat
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0rv =3D usb_add_hcd(hcd, irq, 0);
> - =A0 =A0 =A0 if (rv =3D=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 if (rv)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_ehci;
> +
> + =A0 =A0 =A0 return 0;
>
> +err_ehci:
> + =A0 =A0 =A0 if (ehci->has_amcc_usb23)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(ehci->ohci_hcctrl_reg);
> =A0 =A0 =A0 =A0iounmap(hcd->regs);
> =A0err_ioremap:
> =A0 =A0 =A0 =A0irq_dispose_mapping(irq);
> =A0err_irq:
> =A0 =A0 =A0 =A0release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> -
> - =A0 =A0 =A0 if (ehci->has_amcc_usb23)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(ehci->ohci_hcctrl_reg);
> =A0err_rmr:
> =A0 =A0 =A0 =A0usb_put_hcd(hcd);
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
