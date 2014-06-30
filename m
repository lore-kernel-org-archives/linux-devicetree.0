From: Caizhiyong <caizhiyong@hisilicon.com>
Subject: RE: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver
 for hisilicon hip04 Soc
Date: Mon, 30 Jun 2014 09:59:00 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F2C15561F@SZXEMA512-MBX.china.huawei.com>
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com>
 <6920327.DpBe6vKVPa@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6920327.DpBe6vKVPa@wuerfel>
Content-Language: zh-CN
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Quyaxin <quyaxin@hisilicon.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>, Pekon Gupta <pekon@ti.com>, "Wanli (welly)" <welly.wan@hisilicon.com>, Zhou Wang <wangzhou.bry@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wangzhou 
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Monday, June 30, 2014 5:01 PM
> To: linux-arm-kernel@lists.infradead.org
> Cc: Zhou Wang; Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar
> Gala; Russell King; David Woodhouse; Brian Norris; Grant Likely; Ezequiel
> Garcia; Pekon Gupta; Artem Bityutskiy; Alexander Shiyan; Ivan Khoronzhuk;
> Jussi Kivilinna; Joern Engel; Randy Dunlap; devicetree@vger.kernel.org;
> linux-mtd@lists.infradead.org; linux-doc@vger.kernel.org;
> linux-kernel@vger.kernel.org; Caizhiyong; Wangzhou (B)
> Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver for
> hisilicon hip04 Soc
> 
> 
> > +	struct device		*dev;
> > +	void __iomem		*iobase;
> > +	struct completion       cmd_complete;
> > +	unsigned int		offset;
> > +	unsigned int		command;
> > +	int			chipselect;
> > +	unsigned int		addr_cycle;
> > +	unsigned int		addr_value[2];
> > +	unsigned int		cache_addr_value[2];
> > +	char			*buffer;
> > +	dma_addr_t		dma_buffer;
> > +	dma_addr_t		dma_oob;
> > +	int			version;
> > +	unsigned int            ecc_bits;
> > +	unsigned int            irq_status; /* interrupt status */
> > +
> > +	int (*send_cmd_pageprog)(struct hinfc_host *host);
> > +	int (*send_cmd_status)(struct hinfc_host *host);
> > +	int (*send_cmd_readstart)(struct hinfc_host *host);
> > +	int (*send_cmd_erase)(struct hinfc_host *host);
> > +	int (*send_cmd_readid)(struct hinfc_host *host);
> > +	int (*send_cmd_reset)(struct hinfc_host *host, int chipselect);
> > +};
> 
> Why do you need function pointers here? The current version of the
> driver you posted always assigns these to the same functions, so
> it would be more efficient to just call those directly.
> 

I agree with you.
This feature was originally designed to support a variety version of NAND controllers.
But in fact, this feature is not used now.
