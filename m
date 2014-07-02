From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver
 for hisilicon hip04 Soc
Date: Wed, 02 Jul 2014 10:07:56 +0800
Message-ID: <53B3697C.1090602@gmail.com>
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com> <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com> <6920327.DpBe6vKVPa@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6920327.DpBe6vKVPa@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Jussi Kivilinna <jussi.kivilinna-X3B1VOXEql0@public.gmane.org>, Joern Engel <joern-PCqxUs/MD9bYtjvyW6yDsg@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B406=E6=9C=8830=E6=97=A5 17:00, Arnd Bergmann wrote:
> Overall a very nice driver. I didn't find any real bugs, but a few th=
ings
> that could be changed for readability and micro-optimizations:
>
> On Monday 30 June 2014 16:03:28 Zhou Wang wrote:
>
>> +#define hinfc_read(_host, _reg)	readl(_host->iobase + (_reg))
>> +#define hinfc_write(_host, _value, _reg)\
>> +	writel((_value), _host->iobase + (_reg))
>
> I'd recommend making these inline functions rather than macros.
>

I will change above macros to inline functions, thanks.

>> +struct hinfc_host {
>> +	struct nand_chip	*chip;
>> +	struct mtd_info		*mtd;
>
> I notice that you allocate the nand_chip and mtd_info together
> with the hinfc_host and then assign these pointers. A preferred
> method is normally to just embed the structures in this case:
>
> struct hinfc_host {
> 	struct nand_chip	chip;
> 	struct mtd_info		mtd;
>
> so you avoid the pointer overhead, and can go back from these
> two structures to the hinfc_host using container_of().
>

It is better to embed chip and mtd in host, I will change this, thanks.

>> +	struct device		*dev;
>> +	void __iomem		*iobase;
>> +	struct completion       cmd_complete;
>> +	unsigned int		offset;
>> +	unsigned int		command;
>> +	int			chipselect;
>> +	unsigned int		addr_cycle;
>> +	unsigned int		addr_value[2];
>> +	unsigned int		cache_addr_value[2];
>> +	char			*buffer;
>> +	dma_addr_t		dma_buffer;
>> +	dma_addr_t		dma_oob;
>> +	int			version;
>> +	unsigned int            ecc_bits;
>> +	unsigned int            irq_status; /* interrupt status */
>> +
>> +	int (*send_cmd_pageprog)(struct hinfc_host *host);
>> +	int (*send_cmd_status)(struct hinfc_host *host);
>> +	int (*send_cmd_readstart)(struct hinfc_host *host);
>> +	int (*send_cmd_erase)(struct hinfc_host *host);
>> +	int (*send_cmd_readid)(struct hinfc_host *host);
>> +	int (*send_cmd_reset)(struct hinfc_host *host, int chipselect);
>> +};
>
> Why do you need function pointers here? The current version of the
> driver you posted always assigns these to the same functions, so
> it would be more efficient to just call those directly.
>
> If you plan to add another variant later that uses a different set
> of functions here, you can add the function pointers then, in a
> separate patch. Also, a common style element is to have a separate
> constant structure with the function pointers:
>
> const struct hinfc_host_ops ops =3D {
> 	.send_cmd_pageprog =3D hisi_nfc_send_cmd_pageprog,
> 	...
> };
>
> if you actually end up needing function pointers. That simplifies
> the code a bit and is slightly more robust to attacks overwriting
> the function pointers.
>

I will move above function pointers out of host and directly call the=20
functions, thanks for your good comment.

>> +
>> +void wait_controller_finished(struct hinfc_host *host)
>> +{
>> +	unsigned long timeout =3D jiffies + HINFC504_NFC_TIMEOUT;
>> +	int val;
>> +
>> +	while (time_before(jiffies, timeout)) {
>> +		val =3D hinfc_read(host, HINFC504_STATUS);
>> +		if (host->command =3D=3D NAND_CMD_ERASE2) {
>> +			/* nfc is ready */
>> +			while (!(val & HINFC504_READY))	{
>> +				usleep_range(500, 1000);
>> +				val =3D hinfc_read(host, HINFC504_STATUS);
>> +			}
>> +			return;
>> +		} else {
>> +			if (val & HINFC504_READY)
>> +				return;
>> +		}
>> +	}
>> +
>> +	/* wait cmd timeout */
>> +	dev_err(host->dev, "Wait NAND controller exec cmd timeout.\n");
>> +}
>
> Since the timeout is much bigger than the wait time here, I guess you
> can use a wider range for the usleep_range(), e.g.
>
> 	usleep_range(500, 50000);
>
> which is nicer to other tasks. You will normally be woken up much ear=
lier.
>
> 	Arnd
>
As I know that the operating time of NAND flash erasure is about=20
ms-level, so I set sleep time as usleep_range(500, 1000) here. And the=20
timeout means that relative operations don't finish in this time, so=20
maybe there is something wrong with the operations. In normal situation=
,=20
after detecting the operation finished, the above function will return=20
before timeout arriving.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
