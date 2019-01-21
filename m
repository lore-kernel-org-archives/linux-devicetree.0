From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller
 driver
Date: Mon, 21 Jan 2019 09:21:06 +0100
Message-ID: <20190121092106.2c97ebe2@xps13>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
        <20190120160605.33689354@xps13>
        <3f098e44-9d9b-3d0a-3e19-5913077aeb07@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3f098e44-9d9b-3d0a-3e19-5913077aeb07@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, Liang Yang <liang.yang@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> wrote on Mon, 21 Jan 2019
12:18:18 +0800:

> Hi Miquel,
> 
> On 2019/1/20 23:06, Miquel Raynal wrote:
> > Hi Jianxin,
> > 
> > Jianxin Pan <jianxin.pan@amlogic.com> wrote on Sun, 20 Jan 2019
> > 01:02:35 +0800:
> >   
> >> Add entry for Amlogic NAND controller driver and its bindings[0].
> >>
> >> [0] https://lore.kernel.org/lkml/1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com/
> >>
> >> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> >> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>  
> > 
> > If you are the author of the patch your Signed-off-by should come first.  
> OK.
> > 
> > Also, why is Liang the Maintainer? Why not you?
> >   
> Yangliang is Amlogic maintainer for NAND controller. And all patches about amlogic NAND controller are from him.

Maybe but he never wrote to the ML, the maintainer may be someone else
than the original author, I just want someone to review patches and
help to maintain the driver.

Yangliang are you willing to do that?


Thanks,
Miquèl
