From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: add rtc-asm9260 driver
Date: Tue, 2 Feb 2016 09:24:52 +0100
Message-ID: <56B067D4.2050801@rempel-privat.de>
References: <1454056802-23386-1-git-send-email-linux@rempel-privat.de>
 <1454056802-23386-2-git-send-email-linux@rempel-privat.de>
 <20160201160510.GS20165@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DA3A1Gmip6NmrHOUVDMUoLpOwQv1fmEvu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160201160510.GS20165-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DA3A1Gmip6NmrHOUVDMUoLpOwQv1fmEvu
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 01.02.2016 um 17:05 schrieb Alexandre Belloni:
> On 29/01/2016 at 09:40:01 +0100, Oleksij Rempel wrote :
>> +static irqreturn_t asm9260_rtc_irq(int irq, void *dev_id)
>> +{
>> +	struct asm9260_rtc_priv *priv =3D dev_id;
>> +	u32 isr;
>> +	unsigned long events =3D 0;
>> +
>> +	isr =3D ioread32(priv->iobase + HW_CIIR);
>> +	if (!isr)
>> +		return IRQ_NONE;
>> +
>> +	iowrite32(0, priv->iobase + HW_CIIR);
>> +
>> +	events |=3D RTC_AF | RTC_IRQF;
>> +
>> +	rtc_update_irq(priv->rtc, 1, events);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int asm9260_rtc_read_time(struct device *dev, struct rtc_time =
*tm)
>> +{
>> +	struct asm9260_rtc_priv *priv =3D dev_get_drvdata(dev);
>> +	u32 ctime0, ctime1, ctime2;
>> +	unsigned long irq_flags;
>> +
>=20
> It would be nice to actually use BM_RTC_OSCF and return -EINVAL if it i=
s
> set.

Hm... this register was described in reference driver, but not in the
documentation. Now i did some testing but i can't confirm that it is
working. BM_RTC_OSCF is never set, even after completely reseted clock
removed battery or shortened XTAL.
So, i will remove this register from the driver.

>> +	spin_lock_irqsave(&priv->lock, irq_flags);
>> +	ctime0 =3D ioread32(priv->iobase + HW_CTIME0);
>> +	ctime1 =3D ioread32(priv->iobase + HW_CTIME1);
>> +	ctime2 =3D ioread32(priv->iobase + HW_CTIME2);
>> +
>> +	if (ctime1 !=3D ioread32(priv->iobase + HW_CTIME1)) {
>> +		/*
>> +		 * woops, counter flipped right now. Now we are safe
>> +		 * to reread.
>> +		 */
>> +		ctime0 =3D ioread32(priv->iobase + HW_CTIME0);
>> +		ctime1 =3D ioread32(priv->iobase + HW_CTIME1);
>> +		ctime2 =3D ioread32(priv->iobase + HW_CTIME2);
>> +	}
>> +	spin_unlock_irqrestore(&priv->lock, irq_flags);
>> +
>> +	tm->tm_sec  =3D (ctime0 >> BM_CTIME0_SEC_S)  & BM_CTIME0_SEC_M;
>> +	tm->tm_min  =3D (ctime0 >> BM_CTIME0_MIN_S)  & BM_CTIME0_MIN_M;
>> +	tm->tm_hour =3D (ctime0 >> BM_CTIME0_HOUR_S) & BM_CTIME0_HOUR_M;
>> +	tm->tm_wday =3D (ctime0 >> BM_CTIME0_DOW_S)  & BM_CTIME0_DOW_M;
>> +
>> +	tm->tm_mday =3D (ctime1 >> BM_CTIME1_DOM_S)  & BM_CTIME1_DOM_M;
>> +	tm->tm_mon  =3D (ctime1 >> BM_CTIME1_MON_S)  & BM_CTIME1_MON_M;
>> +	tm->tm_year =3D (ctime1 >> BM_CTIME1_YEAR_S) & BM_CTIME1_YEAR_M;
>> +
>> +	tm->tm_yday =3D (ctime2 >> BM_CTIME2_DOY_S)  & BM_CTIME2_DOY_M;
>> +
>> +	return 0;
>> +}
>> +
>> +static int asm9260_rtc_set_time(struct device *dev, struct rtc_time *=
tm)
>> +{
>> +	struct asm9260_rtc_priv *priv =3D dev_get_drvdata(dev);
>> +	unsigned long irq_flags;
>> +
>> +	spin_lock_irqsave(&priv->lock, irq_flags);
>> +	/*
>> +	 * make sure SEC counter will not flip other counter on write time,
>> +	 * real value will be written at the enf of sequence.
>> +	 */
>> +	iowrite32(0, priv->iobase + HW_SEC);
>> +
>> +	iowrite32(tm->tm_year, priv->iobase + HW_YEAR);
>> +	iowrite32(tm->tm_mon,  priv->iobase + HW_MONTH);
>> +	iowrite32(tm->tm_mday, priv->iobase + HW_DOM);
>> +	iowrite32(tm->tm_wday, priv->iobase + HW_DOW);
>> +	iowrite32(tm->tm_yday, priv->iobase + HW_DOY);
>> +	iowrite32(tm->tm_hour, priv->iobase + HW_HOUR);
>> +	iowrite32(tm->tm_min,  priv->iobase + HW_MIN);
>> +	iowrite32(tm->tm_sec,  priv->iobase + HW_SEC);
>=20
> That would be a good time to reset BM_RTC_OSCF. Maybe it can also be
> useful to enable the interrupt but there isn't much more to do than
> print an error message.
>=20
>> +	spin_unlock_irqrestore(&priv->lock, irq_flags);
>> +
>> +	return 0;
>> +}
>> +
>=20

Thank you for review :)

--=20
Regards,
Oleksij


--DA3A1Gmip6NmrHOUVDMUoLpOwQv1fmEvu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlawZ9gACgkQHwImuRkmbWnfTAEAhJ5y3KOwr/Fzj3EyzhI+Dc7N
/tXtixgZdJo9zL8hoq8A/0o0fzuPjqlo/AaUQ1KXByvwKoczlzVuIG5E2slnNEeT
=FH5D
-----END PGP SIGNATURE-----

--DA3A1Gmip6NmrHOUVDMUoLpOwQv1fmEvu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
