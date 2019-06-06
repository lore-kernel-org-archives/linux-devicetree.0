From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] irqchip: al-fic: Introduce Amazon's Annapurna
 Labs Fabric Interrupt Controller Driver
Date: Thu, 06 Jun 2019 17:49:25 +1000
Message-ID: <c558ca3caac6f0c24a13cd5d7599bf4e861bca62.camel@kernel.crashing.org>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
         <1559731921-14023-3-git-send-email-talel@amazon.com>
         <fa6e5a95-d9dd-19f6-43e3-3046e0898bda@arm.com>
         <553d06a4-a6b6-816f-b110-6ef7f300dde4@amazon.com>
         <0915892c-0e53-8f53-e858-b1c3298a4d35@arm.com>
         <54df139cc6cfef9202be6b945c968c3040591607.camel@kernel.crashing.org>
         <86pnnrgpmm.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86pnnrgpmm.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: "Shenhar, Talel" <talel@amazon.com>, nicolas.ferre@microchip.com, jason@lakedaemon.net, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-06-06 at 08:05 +0100, Marc Zyngier wrote:
> 
> > I disagree Marc. This is a rather bad error which indicates that the
> > device-tree is probably incorrect (or the HW was wired in a way that
> > cannot work).
> 
> But surely that's something you'll spot pretty quickly.

Not really. A level/edge mismatch isn't something you can spot that
quickly, but will cause lost interrupts on load. Since the kernel can
spot the error pretty much right away, I think that could even be a
pr_err :)

> Also, you get
> a splat from the irq subsystem already, telling you that things went
> wrong (see __irq_set_trigger). At that stage, you can enable debugging
> and figure it out.

Ah returning an error will cause such splat indeed.

> What I'm trying to avoid is the kernel becoming a (pretty bad)
> validation tool for DTS files.

Haha, yeah, I don't like it going out of its way to validate them but
that sort of very obvious sanity checking makes sense.

> > Basically a given FIC can either be entirely level sensitive or
> > entirely edge sensitive. This catches cases where the DT has routed
> > a mixed of both to the same FIC. Definitely worth barfing loudly
> > about rather than trying to understand subtle odd misbehaviours of
> > the device in the field.
> 
> Then, in the interest of not producing incorrect DTs, could the
> edge/level property be encoded in the FIC description itself, rather
> than in the interrupt specifiers of the individual devices? It would
> sidestep the problem altogether. You can still put the wrong one in
> the FIC node, but it then becomes even more obvious what is going
> on...

This was Talel original approach internally in fact. I told him to put
it in the specifier instead :-) The advantage in doing it that way is
that you get the right flags in the descriptor by default iirc, so the
right value in /proc/interrupts etc... And it will continue working if
a future FIC loses that limitation.

That said, if you feel strongly about it, we can revert to putting a
global property in the FIC node itself. Let us know what you want.

Cheers,
Ben.
