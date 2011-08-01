From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: mmp: parse irq from DT
Date: Mon, 1 Aug 2011 15:10:36 +0100
Message-ID: <20110801141036.GA21627@ponder.secretlab.ca>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<20110729163616.GJ11164@ponder.secretlab.ca>
	<CAN1soZxX6EBRPvzV_00njioBn1NfiAbLBoD7EYc-wV-uQM_VoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZxX6EBRPvzV_00njioBn1NfiAbLBoD7EYc-wV-uQM_VoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 01, 2011 at 10:47:06AM +0800, Haojian Zhuang wrote:
> On Sat, Jul 30, 2011 at 12:36 AM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >> diff --git a/arch/arm/mach-mmp/common.h b/arch/arm/mach-mmp/common.h
> >> index ec8d65d..1c563c2 100644
> >> --- a/arch/arm/mach-mmp/common.h
> >> +++ b/arch/arm/mach-mmp/common.h
> >> @@ -6,3 +6,4 @@ extern void timer_init(int irq);
> >>
> >> =A0extern void __init icu_init_irq(void);
> >> =A0extern void __init mmp_map_io(void);
> >> +extern void __init mmp_init_intc(void);
> >> diff --git a/arch/arm/mach-mmp/include/mach/irqs.h b/arch/arm/mach-mmp=
/include/mach/irqs.h
> >> index a09d328..65ec176 100644
> >> --- a/arch/arm/mach-mmp/include/mach/irqs.h
> >> +++ b/arch/arm/mach-mmp/include/mach/irqs.h
> >> @@ -224,6 +224,6 @@
> >>
> >> =A0#define IRQ_BOARD_START =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(IRQ_GPIO_START + IRQ_GPIO_NUM)
> >>
> >> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(IRQ_BOARD_START)
> >> +#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A00
> >
> > Why is NR_IRQs getting changed? =A0I think this will break
> > !CONFIG_SPARSE_IRQS, and it shouldn't be necessary for this
> > conversion.
> >
> If CONFIG_SPARSE_IRQ is enabled, arch_probe_nr_irqs() returns NR_IRQS in =
arm.
> It results registering NR_IRQS in early_irq_init(). If NR_IRQS is 200,
> 200 irqs are
> registered in early_irq_init(). It's not my requirement. What I need
> is registering irq
> from DT.
> =

> So I have to define NR_IRQS to 0. And CONFIG_SPARSE_IRQS is always enabled
> in ARCH_MMP. So it's selected in Kconfig by default.

My point is, that applying this patch will break anyone depending on
non-DT mach-mmp support.  I'm completely fine with you doing so, but
you need to be extra careful that it is done in a bisectable way.  At
no point in the commit series should the kernel be unable to build a
working mmp image.

g.
