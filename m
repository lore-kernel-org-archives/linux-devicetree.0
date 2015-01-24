From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4] irqchip: gic: Allow interrupt level to be set for
 PPIs.
Date: Sat, 24 Jan 2015 18:15:23 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501241814430.5526@nanos>
References: <1421772779-25764-1-git-send-email-Liviu.Dudau@arm.com> <87mw5bf256.fsf@approximate.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87mw5bf256.fsf@approximate.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jan 2015, Marc Zyngier wrote:

> On Tue, Jan 20 2015 at  4:52:59 pm GMT, Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> > During a recent cleanup of the arm64 DTs it has become clear that
> > the handling of PPIs in xxxx_set_type() is incorrect. The ARM TRMs
> > for GICv2 and later allow for "implementation defined" support for
> > setting the edge or level type of the PPI interrupts and don't restrict
> > the activation level of the signal. Current ARM implementations
> > do restrict the PPI level type to IRQ_TYPE_LEVEL_LOW, but licensees
> > of the IP can decide to shoot themselves in the foot at any time.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 
> For the GIC and GICv3 parts:
> 
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>

So I queue that if there are no further objections from Russell or the
DT folks.

Thanks,

	tglx
