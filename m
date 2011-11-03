From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 3 Nov 2011 13:29:08 +0100
Message-ID: <CACRpkdY+EBkHfupO5T4SYKPxzX2L2kr8fLVMJK=JctNeYAzn2g@mail.gmail.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-3-git-send-email-jamie@jamieiles.com>
	<20110928203905.GB2838@ponder.secretlab.ca>
	<CACRpkdZKns-GraGp-YMD6jzOPETkvEpt9bC8HcYUmf3JUyCV3A@mail.gmail.com>
	<20110929093009.GM17204@pulham.picochip.com>
	<20111102134024.GE19187@n2100.arm.linux.org.uk>
	<20111102140811.GA22491@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111102140811.GA22491@totoro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Nov 2, 2011 at 3:08 PM, Jamie Iles <jamie@jamieiles.com> wrote:
> On Wed, Nov 02, 2011 at 01:40:24PM +0000, Russell King - ARM Linux wrote:
>>
>> And if we receive another interrupt after the read of the register, we'll
>> have to exit all the way back (possibly to userspace) before re-entering
>> the IRQ handling paths back to this point to process it.
>
> OK, so how about something like this instead:
>
> static int vic_single_handle_irq(struct vic_device *vic,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pt=
_regs *regs)

Is it single really? This handles all active IRQs on the VIC instance.
Can it be renamed vic_handle_irq()?

> {
> =A0 =A0 =A0 =A0u32 stat, irq;
> =A0 =A0 =A0 =A0int handled =3D 0;
>
> =A0 =A0 =A0 =A0stat =3D readl_relaxed(vic->base + VIC_IRQ_STATUS);
> =A0 =A0 =A0 =A0while (stat) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq =3D ffs(stat) - 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_IRQ(irq_domain_to_irq(&vic->domain,=
 irq), regs);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stat &=3D ~(1 << irq);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handled =3D 1;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return handled;
> }

No, if we receive another IRQ *after* the read of the register was the
question, right?

Just replace

stat &=3D ~(1 << irq);

with a second

stat =3D readl_relaxed(vic->base + VIC_IRQ_STATUS);

It'll work just fine, the IRQ line should be low when you read
it the second time, else it is probably fully proper to call
the IRQ handler again anyway.

Just my =800.01..
Linus Walleij
