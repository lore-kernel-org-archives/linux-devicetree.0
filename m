From: Youlin Pei <youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 0/3] Add Mediatek CIRQ interrupt controller
Date: Fri, 7 Apr 2017 17:54:44 +0800
Message-ID: <1491558884.24848.3.camel@mtksdaap41>
References: <1491552397-7893-1-git-send-email-youlin.pei@mediatek.com>
         <771954fe-c994-96be-76ab-ece75383d058@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <771954fe-c994-96be-76ab-ece75383d058-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-04-07 at 09:52 +0100, Marc Zyngier wrote:
> On 07/04/17 09:06, Youlin Pei wrote:
> > In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
> > works outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
> > 
> > The CIRQ controller is integrated in between MCUSYS and interrupt sources
> > as the second level interrupt controller. The external interrupts which 
> > outside MCUSYS will feed through CIRQ then bypass to GIC.
> > 
> > In normal mode(where MCUSYS is active), CIRQ is disabled and interrupts
> > will directly issue to MCUSYS. When MCUSYS enters sleep mode, where GIC
> > is power downed. CIRQ will be enabled and monitor all edge trigger
> > interrupts(only edge trigger interrupts will be lost in this scenario).
> > When an edge interrupt is triggered, CIRQ will record the status and
> > generated a pulse signal to GIC when flush command is executed. 
> > 
> > With CIRQ, MCUSYS can be completely turned off to improve the system 
> > power consumption without losing interrupts.
> > 
> > change in v4:
> > 1. add some comment to explain CIRQ suspend callback.
> > 2. rebase on 4.11
> 
> Hi Youlin,
> 
> I'm happy to take the first two patches through the irq tree. How do we
> deal with the third one? It seems to me that it'd be better routed via
> armsoc.
> 
> Let me know what you and Matthias want to do.

Hi Marc,

Thanks for your review. I think that driver and dtsi can merged
separately.

Hi Matthias,
Could you help to review the dtsi patch?
Thanks a lot!

> 
> Thanks,
> 
> 	M.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
