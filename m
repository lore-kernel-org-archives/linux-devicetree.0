From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 4/5] xhci: mediatek: support MTK xHCI host controller
Date: Tue, 20 Oct 2015 14:29:14 +0800
Message-ID: <1445322554.4858.12.camel@mhfsdcap03>
References: <1443495698-32233-1-git-send-email-chunfeng.yun@mediatek.com>
 <1443495698-32233-5-git-send-email-chunfeng.yun@mediatek.com>
 <561FBC40.7020100@linux.intel.com> <1445131519.17024.10.camel@mhfsdcap03>
 <5624D33D.5090807@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5624D33D.5090807-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi,
On Mon, 2015-10-19 at 14:25 +0300, Mathias Nyman wrote:
> >>
> >> So basically we are trying to use as many microframes as possible with as few packets
> >> per microframe as possible.
> >>
> >> Did I understand this correctly?
> > Yes, you are right.
> >
> >> How will devices react if they expect to get 16 packets every 16th microframe,
> >> but they get one packet every microframe instead?
> > I think that the synchronous endpoint must specify its period by
> > bInterval, but can't specify how data should be transfered during the
> > period by the host, and it just only receives data passively. So the
> > device can receive data correctly in the case(bInterval is 5).
> >
> > quote from usb3_r1.0 section4.4.8 Isochronous Transfers:
> > "The host can request data from the device or send data to the device at
> > any time during the service interval for a particular endpoint on that
> > device"
> >
> 
> As I understand the 4.4.8 section it just means the device can't assume a fixed
> time interval between transfers, meaning that the host can use the last microframe
> in one esit and the first microframe in the next esit, but still only use 1 microframe
> per esit.
> 
> Section 8.12.6.1 describes how a 11 packet isoc transfer is allowed to be split
> to 1 burst of 11 packets, 2 burst (8 + 3),  3 burst (4+4+3) 6 bursts (2+2+2+2+2+1) or
> 11 bursts of 1. These are however all within the same microframe. Splitting the
> transfer into several microframes in a esit kind of makes the whole interval concept pointless.
> 
It doesn't say that the packets should be transfered within the same
microframe (bus interval), as I understand it means service interval;

The direct prove resides in figure 8-56/8-57.

Term: 
1. BI, bus interval, a 125 us period that establishes the internal
boundary of service interval, aka uframe;
2. SSI, Support Smart Isochronous;
3. DBI, Data in this Bus Interval is done;
4. NBI, Numbers of Bus Interval;

As the figure shows, the service interval = 8 BI, that host distribute 2
packets @1st uframe, keep U1/U2 state for the next 3uframe, then
transmit 4 packets @4th uframe, and the remaining 3 packet in the last
frame.

Please notice that this just is an example illustrated by spec, but we
can derive the conclusion that the distribution of packet in a service
interval is completely decided by host, and can split isoc transfers
across multiple uframes.

PS: as you can see, MTK implementation of schedule algorithms is an
implementation of Smart Isochronous of which the smart side resides in
software.


> -Mathias
> 
> 
> 
>   
> 
