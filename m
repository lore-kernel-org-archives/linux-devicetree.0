From: "Peter Senna Tschudin" <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= V3 =?utf-8?q?2=2F5=5D?=
 =?utf-8?q?_dts=2Fimx6q-b850v3=3A?= Configure IPU assignment order
Date: Mon, 01 Aug 2016 13:30:57 +0100
Message-ID: <70b6-579f4100-9-6ce4f380@208251793>
References: <1470041647.6640.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
in-reply-to: <1470041647.6640.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: andrey.gusakov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Stone <daniel.stone-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

Thank you for the prompt review.
 
On Monday, August 1, 2016 10:54 CEST, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote: 
 
> Am Sonntag, den 31.07.2016, 21:55 +0200 schrieb Peter Senna Tschudin:
> > As the IPU has combined limitations across multiple crtcs, and as that
> > can't be communicated to userspace at the moment, reorder the crtcs to
> > allow support to two Full-HD monitors by avoiding assigning two
> > monitors to a single IPU.
> > 
> > Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> 
> NACK. This is a userspace issue. Changing the assignment order of the
> CRTCs just shifts the failure to a userspace that want to use CRTC 0 and
> 2 now.

Err, yeah user space issue... But how the kernel is currently telling user space about what exactly went wrong and how user space might fix it? How Weston(our user space) is going to know  that reshuffling crtcs is going to lead to success; how could it? I guess some  platform-specific code in user space is needed for this to work...

> 
> imx-drm just got atomic support and with the atomic check it should be
> possible to inform userspace in a reasonable way about such issues.

Should be possible, but I guess it isn't, and wont be until a considerable effort is put on both kernel and user space. Or am I missing something? What do you propose?

I got inspiration from: arch/arm/boot/dts/imx6q.dtsi
...
        display-subsystem {
                compatible = "fsl,imx-display-subsystem";
                ports = <&ipu1_di0>, <&ipu1_di1>, <&ipu2_di0>, <&ipu2_di1>;
        };
...

This is there for more than 2 years now, and I get that the idea here is not ordering, but just declaring.

However even if this patch is not the perfect solution, it allows us to stay close to upstream now without creating problems(does it create any issue?).

Can you reconsider or propose a concrete solution that is not more complex than our entire driver?

Thanks a lot!

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
