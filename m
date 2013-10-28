From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Mon, 28 Oct 2013 16:41:03 -0700
Message-ID: <20131028234103.F2CB1C40283@trevor.secretlab.ca>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org> <1381869563-16083-10-git-send-email-grant.likely@linaro.org> <31D756E7-A7CD-42ED-8D1D-D1B38B85E3A0@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31D756E7-A7CD-42ED-8D1D-D1B38B85E3A0-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 28 Oct 2013 01:54:38 -0500, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
> On Oct 15, 2013, at 3:39 PM, Grant Likely wrote:
> 
> > The standard interrupts property in device tree can only handle
> > interrupts coming from a single interrupt parent. If a device is wired
> > to multiple interrupt controllers, then it needs to be attached to a
> > node with an interrupt-map property to demux the interrupt specifiers
> > which is confusing. It would be a lot easier if there was a form of the
> > interrupts property that allows for a separate interrupt phandle for
> > each interrupt specifier.
> > 
> > This patch does exactly that by creating a new interrupts-extended
> > property which reuses the phandle+arguments pattern used by GPIOs and
> > other core bindings.
> > 
> > Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > ---
> > .../bindings/interrupt-controller/interrupts.txt   | 29 +++++++--
> > arch/arm/boot/dts/testcases/tests-interrupts.dtsi  | 16 +++++
> > arch/arm/boot/dts/versatile-ab.dts                 |  2 +-
> > arch/arm/boot/dts/versatile-pb.dts                 |  2 +-
> > drivers/of/irq.c                                   | 16 +++--
> > drivers/of/selftest.c                              | 70 ++++++++++++++++++++++
> > 6 files changed, 122 insertions(+), 13 deletions(-)
> 
> Acked-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> [ I think the patch should be split up so we aren't touching versatile dts as part of it ]

No problem, I'll do that.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
