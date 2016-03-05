From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Fri, 4 Mar 2016 21:35:00 -0300
Message-ID: <CAAEAJfCS1LN4yOYoY1ykJogDhZemdmEb7v32RE-s9vcr7B8DZg@mail.gmail.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456474316-24473-1-git-send-email-xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raoju
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

On 26 February 2016 at 05:11, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> w=
rote:
[..]
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfi=
g
> index 0dc9275..c86d7cf 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -37,6 +37,12 @@ config SPI_FSL_QUADSPI
>           This controller does not support generic SPI. It only suppo=
rts
>           SPI NOR.
>
> +config SPI_HISI_SFC
> +       tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +       depends on ARCH_HISI || COMPILE_TEST

I believe you are missing a "depends on HAS_IOMEM".
The NXP_SPIFI driver below does the right thing in this
regard.

Otherwise, you'll get a build failure on ARCH=3Dum.

drivers/built-in.o: In function `hisi_spi_nor_probe':
hisi-sfc.c:(.text+0x57ca5): undefined reference to `devm_ioremap_resour=
ce'
hisi-sfc.c:(.text+0x57d0e): undefined reference to `dmam_alloc_coherent=
'

Care to send a new one?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
