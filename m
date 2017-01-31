From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND 2/5] dmaengine: Provide a wrapper for memcpy
 operations
Date: Tue, 31 Jan 2017 09:04:14 +0530
Message-ID: <20170131033414.GI19244@localhost>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485535324-28393-3-git-send-email-boris.brezillon@free-electrons.com>
 <20170130165417.GF19244@localhost>
 <20170130184721.072c0de1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170130184721.072c0de1@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Alexandre Courbot <gnurou@gmail.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, dmaengine@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Brian
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 06:47:21PM +0100, Boris Brezillon wrote:
> Hi Vinod,
> 
> On Mon, 30 Jan 2017 22:24:17 +0530
> Vinod Koul <vinod.koul@intel.com> wrote:
> 
> > On Fri, Jan 27, 2017 at 05:42:01PM +0100, Boris Brezillon wrote:
> > > Almost all ->device_prep_dma_xx() methods have a wrapper defined in
> > > dmaengine.h. Add one for  ->device_prep_dma_memcpy().  
> > 
> > Looks good to me.
> > 
> > Acked-by: Vinod Koul <vinod.koul@intel.com>
> > 
> > 
> 
> Maybe you can take this patch directly (the NAND related bits are for
> 4.12).

Good idea, applied now..

-- 
~Vinod
