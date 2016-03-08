From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Tue, 8 Mar 2016 10:46:28 +0100
Message-ID: <20160308104628.6224bde2@bbrezillon>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
	<20160307225229.GC55664@google.com>
	<56DE9A79.30704@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DE9A79.30704-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Mar 2016 17:25:13 +0800
Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

> Hi Brian=EF=BC=8C
>    Thank you very much for your comments.
>=20
> On 2016/3/8 6:52, Brian Norris wrote:
> [...]
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.tx=
t b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> >> new file mode 100644
> >> index 0000000..7407147
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> >=20
> > This is not a SPI controller (or is it? it looks like a SPI NOR
> > controller that doesn't do generic SPI), so it shouldn't go in the =
spi/
> > directory.
> >=20
> OK. I'll move this file into Documentation/devicetree/bindings/mtd.
>=20
> >> @@ -0,0 +1,25 @@
> >> +HiSilicon SPI-NOR Flash Controller
> >> +
> >> +Required properties:
> >> +- compatible : Should be "hisilicon,hisi-sfc" and one of the foll=
owing strings:
> >> +		"hisilicon,hi3519-sfc"
> >> +- address-cells : number of cells required to define a chip selec=
t
> >> +        address on the SPI bus. Should be set to 1. See spi-bus.t=
xt.
> >=20
> > This is not exactly a typical SPI bus, though I suppose some of tha=
t
> > documentation could apply...
> >=20
>=20
> OK. I'll modify the description.
>=20
> [...]
> >> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, =
u8 *buf,
> >> +		int len)
> >> +{
> >> +	struct hifmc_priv *priv =3D nor->priv;
> >> +	struct hifmc_host *host =3D priv->host;
> >> +	int ret;
> >> +
> >> +	ret =3D hisi_spi_nor_send_cmd(nor, opcode, len);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	memcpy(buf, host->iobase, len);
> >=20
> > sparse doesn't like any of these memcpy()'s, since that's __iomem. =
Are
> > you sure you want a regular memcpy here, and elsewhere?
> >=20
> It's not a must to use memcpy though host->iobase represents a segmen=
t of inner memory
> which stores data from flash device byte by byte.  I will give up usi=
ng memcpy here and
> hisi_spi_nor_write_reg() in next version. Thank you!

Or you can use memcpy_fromio(), which should give you better perfs than
using readX() accessors in a loop.


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
