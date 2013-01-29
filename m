From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 16:27:54 +0530
Message-ID: <CAKohpokZfQZ17PmQjS2ntN9js7=SxNkiwWpX2aD8cZcM9L0ydw@mail.gmail.com>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-2-git-send-email-arnd@arndb.de>
 <CAKohpomO6tYNYLdMOaJYgqGecXj5KMQprdb=gExi+QuGrtLTzw@mail.gmail.com>
 <201301291035.30265.arnd@arndb.de>
 <CAKohpo=rD9=dEaPkKYcj55K4_ebdnU7qjv2TZBUwqHAB+Kk+aw@mail.gmail.com>
 <1359456886.31148.37.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359456886.31148.37.camel@smile>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29 January 2013 16:24, Andy Shevchenko
<andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> On Tue, 2013-01-29 at 16:19 +0530, Viresh Kumar wrote:
>> if (DMA_TO_DEV)
>>        // dest is periph
>>        fargs.cfg_hi = be32_to_cpup(dma_spec->args+0) << 11;
>> else if (DEV_TO_DMA)
>>        // src is periph
>>        fargs.cfg_hi = be32_to_cpup(dma_spec->args+0) << 7;
>
> We have macros for such shifts.
>
> drivers/dma/dw_dmac.c:187:   cfghi = DWC_CFGH_DST_PER(...
> drivers/dma/dw_dmac.c:189:   cfghi = DWC_CFGH_SRC_PER(...

I am getting older now, bad memory :)
I grepped into drivers/dma/dw_dmac_regs.h and left include/linux/dw_dmac.h :(
