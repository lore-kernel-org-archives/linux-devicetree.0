From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Wed, 30 Jan 2013 10:08:30 +0000
Message-ID: <201301301008.31196.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301300941.35886.arnd@arndb.de>
 <CAOh2x==WZePgfTWwL0vPdE693n44vW05OS=DSqbnDCs2xzHXuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOh2x==WZePgfTWwL0vPdE693n44vW05OS=DSqbnDCs2xzHXuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
> On Wed, Jan 30, 2013 at 3:11 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 30 January 2013, Viresh Kumar wrote:
> >> I knew you will come to this :)
> >> So, the hardware is like: there are 16 request line slots per master, a
> >> platform can choose to connect same or separate devices to these.
> >>
> >> So, these are really 16 per master.
> >
> > Ok, I see. Do you know how these are numbered in the data sheet?
> >
> > If the convention is to have subsequent numbers for these in the
> > hardware description, we should probably just have that single
> > request number in the binding, too, and calculate the master number
> > from that. If it lists pairs of request/master number, we should
> > use pairs in the binding as well, in the same order.
> 
> Actually what would be better to have is:
> - have this range from 0-15 only
> - together with the master we want to use for peripheral
>
> this should be enough.

Ok.
 
> Datasheet of dw_dmac doesn't tell much about it.. just four bits for programming
> it and so values are from 0-15 :)

I meant the spear13xx data sheet, which has to list the request lines
for its integrated components. There may be other SoCs using the
same dw_dmac, but this is the main one that is upstream now, and it's
probably as good as any other one. I just wouldn't want to establish
a binding that doesn't match any of the known implementations in the
way it expresses request lines.

	Arnd
