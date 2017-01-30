From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH RESEND 2/5] dmaengine: Provide a wrapper for memcpy
 operations
Date: Mon, 30 Jan 2017 18:47:21 +0100
Message-ID: <20170130184721.072c0de1@bbrezillon>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
        <1485535324-28393-3-git-send-email-boris.brezillon@free-electrons.com>
        <20170130165417.GF19244@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170130165417.GF19244@localhost>
Sender: linux-gpio-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Mon, 30 Jan 2017 22:24:17 +0530
Vinod Koul <vinod.koul@intel.com> wrote:

> On Fri, Jan 27, 2017 at 05:42:01PM +0100, Boris Brezillon wrote:
> > Almost all ->device_prep_dma_xx() methods have a wrapper defined in
> > dmaengine.h. Add one for  ->device_prep_dma_memcpy().  
> 
> Looks good to me.
> 
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> 
> 

Maybe you can take this patch directly (the NAND related bits are for
4.12).
