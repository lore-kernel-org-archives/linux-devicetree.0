From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mfd/axp20x: extend axp20x to support axp288 pmic
Date: Mon, 6 Oct 2014 10:17:19 -0700
Message-ID: <20141006101719.7efb62e8@icelake>
References: <1411644045-21281-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<54268DC0.40406@kernel.org>
	<20141006165209.GC3848@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141006165209.GC3848@lee--X1>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compag>
List-Id: devicetree@vger.kernel.org

On Mon, 6 Oct 2014 17:52:09 +0100
Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Date: Mon, 6 Oct 2014 17:52:09 +0100
> User-Agent: Mutt/1.5.21 (2010-09-15)
> 
> On Sat, 27 Sep 2014, Jonathan Cameron wrote:
> 
> > On 25/09/14 12:20, Jacob Pan wrote:  
> > > X-Powers AXP288 is a customized PMIC for Intel Baytrail-CR
> > > platforms. Similar to AXP202/209, AXP288 comes with USB charger,
> > > more LDO and BUCK channels, and AD converters. It also provides
> > > extended status and interrupt reporting capabilities than the
> > > devices currently supported in axp20x.c.
> > >
> > > In addition to feature extension, this patch also adds ACPI
> > > binding for enumeration.
> > >
> > > This consolidated driver should support more X-Powers' PMICs in
> > > both device tree and ACPI enumerated platforms.
> > >
> > > Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>  
> > Reviewed-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > (I'm assuming Lee will take the whole series when he is happy with
> > it).  
> 
> I only see patch 1?
Hi Lee,
here is #2. will also send you a copy directly.

https://lkml.org/lkml/2014/9/25/538
