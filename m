From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: set missing irq ack handler for
 ar7100-misc-intc irq chip
Date: Wed, 9 Sep 2015 15:52:55 +0200
Message-ID: <20150909155255.63e7c27e@avionic-0020>
References: <1441251262-13335-1-git-send-email-lynxis@fe80.eu>
	<1441251262-13335-2-git-send-email-lynxis@fe80.eu>
	<20150903103245.21dc9dd7@avionic-0020>
	<20150909110406.2e4a4f97@lazus.yip>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/91gl=x/xb.6iA01Y+x1yPog"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150909110406.2e4a4f97-HsCBy8pOd9l4Eiagz67IpQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Cc: Alban <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/91gl=x/xb.6iA01Y+x1yPog
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Sep 2015 11:04:06 +0200
Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org> wrote:

> On Thu, 3 Sep 2015 10:32:45 +0200
> Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
>=20
> > > -IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
> > > -		ath79_misc_intc_of_init);
> > > +
> > > +static int __init ar7100_misc_intc_of_init(
> > > +	struct device_node *node, struct device_node *parent)
> > > +{
> > > +	pr_info("IRQ: Setup ar7100 misc IRQ controller from
> > > devicetree.\n");
> >=20
> > Debug left over?
>=20
> I'll remove it in next patch. I added it because you mentioned a log
> message in your last review.

I meant the commit log, sorry for the misunderstanding.

Alban

--Sig_/91gl=x/xb.6iA01Y+x1yPog
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8Dm4AAoJEHSUmkuduC28BwcQAKxzBEPVPq+ObAA0qA6VmxK8
FkpQ1s5lJ6B72tviuTkkdUNhBCc286FUn9xNqmjqa8htcTfKTAgbfGxsAFqxg6p/
l9NEWrevzHwyIDd4EMLivcpOSq1Nda64eEaRUVKGjpyh9ovDlkxMhy+UPCxvs6/a
YDwFcArhy+7p+YdS9biyd1Tr7WKY6qMrZUBI4PXDSIXLe8VdBUMplw3O6FgviCFw
bVHfyKG+GNzBF/1srxoOEKItn9SRxEqDktpwdm7o2E3Fup/pHW51bHv4w44X1Xwg
k7VfOZlQsbMq4JmMcMzKdFXKnOXPrcwWvHJDY9E9K763fdcPCJX3WxkFQlxuedgd
ug75N/XUdHS5PS5HvXGUsb0rJbrLi8ER58pEaf1NRFCeP6wMR3086pMFRSJF8C+X
nsNOvfSZFNBmyGg6mxUbyk4QzfS3WbyrzHH789LZODjyDwmke4V6cIPn6zwiizdS
rzM71kJqH+LmClxEhZgtu3Yw9EKCe7JyGYRUUJsX0cAzr3GQ/jIL3zOwnER73Ok9
Q3GIZLnFb3y0fEANssMF1VEfgM8njKAzWn6UiSzEguBJ3MEdmuTaq+oK0NnvtL6n
2F1DoXdEmQEI02RUK5u6QVJ9ujVl7JC0wnylzsh0i/NC3PjhtGomlri1vJOIJr7y
CIpf6vN8IZiNOU1rFPci
=Kb8o
-----END PGP SIGNATURE-----

--Sig_/91gl=x/xb.6iA01Y+x1yPog--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
