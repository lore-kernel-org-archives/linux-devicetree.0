From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V3 3/3] mfd: stmpe: Update DT support in stmpe driver
Date: Mon, 26 Nov 2012 18:40:15 +0000
Message-ID: <20121126184015.784993E091F@localhost>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <7a48ae364663ab3a336251fada9aee07ccd728b8.1353610437.git.viresh.kumar@linaro.org>
 <20121123094132.EFCB73E07BE@localhost>
 <CAKohpomAM2pw9kgB6khtHzQ2WCXKZ9_pi1_sOH2dQToVS8ep4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKohpomAM2pw9kgB6khtHzQ2WCXKZ9_pi1_sOH2dQToVS8ep4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012 23:03:47 +0530, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 23 November 2012 15:11, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Fri, 23 Nov 2012 00:26:20 +0530, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
> >> + - irq-trigger                       : IRQ trigger to use for the interrupt to the host
> >> + - irq-invert-polarity               : bool, IRQ line is connected with reversed polarity
> >
> > This looks odd. Normally the interrupt polarity should be encoded in the irq
> > specifier flags field.
> 
> Hi Grant and Lee Jones,
> 
> This looks odd because stmpe is odd, i am taking the discussion held
> with Lee jones to this thread.
> 
> So, how interrupt stuff works currently in DT..
> We have a interrupt controller IC:
> 
> 	ic: interrupt-controller@40008000 {
> 		compatible = "foo";
> 		interrupt-controller;
> 		#interrupt-cells = <2>;
>                 ...
> 	};
> 
> And we have a user of this IC:
> 
> 	foo-peripheral@40048000 {
> 		compatible = "foo-peripheral";
> 		interrupt-parent = <&ic>;
> 		interrupts = <39 4>;
> 	};
> 
> Here first field of "interrupts" gives interrupt line number and the second one
> gives polarity, interrupt type etc..
> 
> All is good till now. Now, every interrupt controller supports the first
> field, but the second one depends on its capabilities. An interrupt controller
> might not have registers to configure interrupt polarity, type, etc of
> the interrupt
> it will service and so the second field wouldn't be available for them.
> 
> For now just think stmpe is not a MFD and not a interrupt controller
> either. It is
> just a simple device, dev-foo.
> 
> It will declare values of its interrupts field based on the type of
> interrupt controller
> that will service its interrupt and that can be anything like VIC/GIC/GPIO
> controller.

Ah, so it is configuring the way the device emits interrupts; not how
the interrupt controller processes them. Fair enough.

It would actually be good to ask the interrupt controller driver what
kind of interrupt signal it expects for a given interrupt line. That
should also solve the problem and I think it would be more useful to
other devices. Can you investigate whether or not
irqd_get_trigger_type() returns the information you need?

g.
