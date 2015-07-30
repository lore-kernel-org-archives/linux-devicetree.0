From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/6] mailbox: Add support for ST's Mailbox IP
Date: Thu, 30 Jul 2015 12:45:45 +0100
Message-ID: <20150730114545.GG14642@x1>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
 <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
 <1438121215.30903.27.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438121215.30903.27.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, jassisinghbrar@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Jul 2015, Paul Bolle wrote:

> On ma, 2015-07-27 at 10:44 +0100, Lee Jones wrote:
> > --- /dev/null
> > +++ b/drivers/mailbox/mailbox-sti.c
>=20
> > +static int sti_mbox_probe(struct platform_device *pdev)
> > +{
> > +	[...]
> > +
> > +	match =3D of_match_device(sti_mailbox_match, &pdev->dev);
> > +	if (!match) {
> > +		dev_err(&pdev->dev, "No configuration found\n");
> > +		return -ENODEV;
> > +	}
> > +	pdev->dev.platform_data =3D (struct sti_mbox_pdata *) match->data=
;
> > +
> > +	[...]
> > +}
>=20
> > +static struct platform_driver sti_mbox_driver =3D {
> > +	.probe =3D sti_mbox_probe,
> > +	.remove =3D sti_mbox_remove,
> > +	.driver =3D {
> > +		.name =3D "sti-mailbox",
> > +		.of_match_table =3D sti_mailbox_match,
> > +	},
> > +};
> > +module_platform_driver(sti_mbox_driver);
>=20
> > +MODULE_ALIAS("platform:mailbox-sti");
>=20
> It seems this alias is only useful if there's a corresponding struct
> platform_device with a "mailbox-sti" .name. I couldn't spot that
> platform_device.
>=20
> Besides, if I read sti_max_probe() correctly, without OF support load=
ing
> this module won't accomplish much. So what would another way of
> autoloading this module buy you?

I think this line can be safely removed.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
