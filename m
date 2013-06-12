From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: shmobile: irqpin: add a DT property to enable
 masking on parent
Date: Wed, 12 Jun 2013 17:38:50 +0900
Message-ID: <20130612083850.GF6006@verge.net.au>
References: <Pine.LNX.4.64.1305241109530.1090@axis700.grange>
 <CANqRtoTqHiRixV571CrMkc=ijWcrfZFzaSrfjN1SKRNTgTTcZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoTqHiRixV571CrMkc=ijWcrfZFzaSrfjN1SKRNTgTTcZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2013 at 06:37:24PM +0900, Magnus Damm wrote:
> On Fri, May 24, 2013 at 6:13 PM, Guennadi Liakhovetski
> <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org> wrote:
> > To disable spurious interrupts, that get triggered on certain hardware, the
> > irqpin driver masks them on the parent interrupt controller. To specify
> > such broken devices a .control_parent parameter can be provided in the
> > platform data. In the DT case we need a property, to do the same.
> >
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
> > ---
> >
> > These two patches simply split the earlier "ARM: shmobile: irqpin: fix
> > handling of spurious interrupts in DT case" patch into two parts.
> > Otherwise no change.
> 
> I'm fine with this portion of the patch series. Thanks for your help!
>
> Acked-by: Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>

I believe that this patch depends on
"irqchip: renesas-intc-irqpin: DT binding for sense bitfield width"
which Arnd has requested some modifications to.

"I think you should add documentation here about how the two interrupt
cells are to be interpreted, to allow people to fill the values from a data
sheet or board schematic."
http://www.spinics.net/lists/linux-sh/msg20202.html

Please post a fresh series that:

1. Includes a fresh version of "irqchip: renesas-intc-irqpin: DT binding
   for sense bitfield width" with Arnd's concerns addressed.

2. Includes this patch with Magnus's Ack.

Please be sure to CC Arnd on the new series.
