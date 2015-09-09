From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: mtk-nor: mtk serial flash controller driver
Date: Wed, 9 Sep 2015 15:00:50 +0200
Message-ID: <20150909150050.44d2b197@ipc1.ka-ro>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
	<1441705796-11365-3-git-send-email-bayi.cheng@mediatek.com>
	<20150909063701.GD18700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150909063701.GD18700-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> > +	writeb(len, mt8173_nor->base + MTK_NOR_CNT_REG);
> > +	return mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_PRG_CMD);
> > +}
> > +
> > +static int mt8173_nor_get_para(struct mt8173_nor *mt8173_nor, u8 *=
buf, int len)
> > +{
> > +	if (len > 1) {
> > +		/* read JEDEC ID need 4 bytes commands */
> > +		mt8173_nor_set_cmd(mt8173_nor, 0, 32, SPINOR_OP_RDID);
> > +		buf[2] =3D readb(mt8173_nor->base + MTK_NOR_SHREG0_REG);
> > +		buf[1] =3D readb(mt8173_nor->base + MTK_NOR_SHREG1_REG);
> > +		buf[0] =3D readb(mt8173_nor->base + MTK_NOR_SHREG2_REG);
> > +	} else {
> > +		if (mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_RDSR_CMD)) {
> > +			dev_err(mt8173_nor->dev, "read status failed!\n");
> > +			return -EINVAL;
> > +		}
> > +		*buf =3D readb(mt8173_nor->base + MTK_NOR_RDSR_REG);
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* cmd1 sent to nor flash, cmd2 write to nor controller */
> > +static int mt8173_nor_set_para(struct mt8173_nor *mt8173_nor, int =
cmd1,
> > +			       int cmd2)
> > +{
> > +	if (mt8173_nor_set_cmd(mt8173_nor, 0, 8, SPINOR_OP_WREN)) {
> > +		dev_err(mt8173_nor->dev,
> > +			"write enable failed in write protect!\n");
> > +		return -EINVAL;
> > +	}
> > +	writeb(cmd1, mt8173_nor->base + MTK_NOR_PRGDATA5_REG);
> > +	writeb(8, mt8173_nor->base + MTK_NOR_CNT_REG);
> > +	if (mt8173_nor_execute_cmd(mt8173_nor, cmd2)) {
> > +		dev_err(mt8173_nor->dev, "execute cmd failed!\n");
>=20
> mt8173_nor_execute_cmd() will already have printed an error message.
>=20
And mt8173_nor_execute_cmd()/mt8173_nor_set_cmd() returned an error
code which should be promoted to the caller rather than
inventing a new one.
The same for other instances of this code fragment.


Lothar Wa=C3=9Fmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
