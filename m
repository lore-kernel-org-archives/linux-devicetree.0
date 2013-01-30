From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Wed, 30 Jan 2013 09:41:35 +0000
Message-ID: <201301300941.35886.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301291621.59425.arnd@arndb.de>
 <CAKohpon30hB9S+MUyXwZpefAGQE4hvF36d-6jXNRk_XoK5dwww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpon30hB9S+MUyXwZpefAGQE4hvF36d-6jXNRk_XoK5dwww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 30 January 2013, Viresh Kumar wrote:
> On 29 January 2013 21:51, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 29 January 2013, Viresh Kumar wrote:
> >> On 29 January 2013 19:01, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> > Ah, good. So I guess the "dma-requests" property should actually
> >> > be "16" then.
> >>
> >> yes, even i was checking on that separately :)
> >
> > Actually, I just discovered something odd in the
> > arch/arm/mach-spear/spear13xx-dma.h file that gets removed
> > in the last patch: there, we define request numbers up to
> > 32, e.g.
> >
> > -       SPEAR1310_DMA_REQ_UART2_RX = 14,
> > -       SPEAR1310_DMA_REQ_UART2_TX = 15,
> > -       SPEAR1310_DMA_REQ_UART5_RX = 16,
> > -       SPEAR1310_DMA_REQ_UART5_TX = 17,
> >
> > What is the meaning of this, if the maximum request number is 15?
> 
> I knew you will come to this :)
> So, the hardware is like: there are 16 request line slots per master, a
> platform can choose to connect same or separate devices to these.
> 
> So, these are really 16 per master.

Ok, I see. Do you know how these are numbered in the data sheet?

If the convention is to have subsequent numbers for these in the
hardware description, we should probably just have that single
request number in the binding, too, and calculate the master number
from that. If it lists pairs of request/master number, we should
use pairs in the binding as well, in the same order.

> > Ok. Would it be enough to have only one master and one request
> > field in the DT dma descriptor then, and have the code figure
> > whether to use it as source or destination, based on the
> > configuration? Which one should come first? Since you have
> > multiple masters per controller, and multiple requests per
> > master, it sounds like the cleanest descriptor form would
> > be
> >
> >         <controller master request>;
> >
> > Or possibly
> >
> >         <controller master request direction>;
> >
> > if the direction needs to be known at the time the channel
> > is requested.
> 
> Its better to keep masters as is. So, that we can use appropriate
> masters for peripheral and memory to make the transfer fast.

So you mean keep the format as

	<controller request src-master dst-master>;

?

	Arnd
