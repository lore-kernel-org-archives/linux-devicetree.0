From: Guochun Mao <guochun.mao@mediatek.com>
Subject: Re: [RESEND PATCH 2/4] mtd: spi-nor: mtk-quadspi: use ofpart for
 parsing partitions
Date: Fri, 7 Dec 2018 13:43:59 +0800
Message-ID: <1544161439.8955.3.camel@mhfsdcap03>
References: <235ade9c5cda19fb0c9356913e3f56ad86600f59.1543472168.git.ryder.lee@mediatek.com>
         <6cca6844f426d4ad4e7c878420b363cfb34499aa.1543472168.git.ryder.lee@mediatek.com>
         <20181206153610.26db522c@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206153610.26db522c@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 15:36 +0100, Boris Brezillon wrote:
> On Thu, 29 Nov 2018 14:29:54 +0800
> Ryder Lee <ryder.lee@mediatek.com> wrote:
> 
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > Replace mtd_device_register with mtd_device_parse_register for
> > parsing partitions and add ofpart support.
> 
> What's the problem with the default partition parser table [1]?
> 
> [1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdpart.c#L793

No problem here.
This patch can be dropped.
Please help review others.

Thanks.
