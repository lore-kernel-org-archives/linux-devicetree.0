From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 3 Nov 2011 13:04:18 +0000
Message-ID: <20111103130418.GA5008@totoro>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-3-git-send-email-jamie@jamieiles.com>
	<20110928203905.GB2838@ponder.secretlab.ca>
	<CACRpkdZKns-GraGp-YMD6jzOPETkvEpt9bC8HcYUmf3JUyCV3A@mail.gmail.com>
	<20110929093009.GM17204@pulham.picochip.com>
	<20111102134024.GE19187@n2100.arm.linux.org.uk>
	<20111102140811.GA22491@totoro>
	<CACRpkdY+EBkHfupO5T4SYKPxzX2L2kr8fLVMJK=JctNeYAzn2g@mail.gmail.com>
	<20111103125136.GL12913@n2100.arm.linux.org.uk>
	<CACRpkdZ1qfVduMAmusNoLjDoqy2kDA4crN__iW9qEeXBgVT4cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1qfVduMAmusNoLjDoqy2kDA4crN__iW9qEeXBgVT4cA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, Jamie Iles <jamie@jamieiles.com>, rubini@unipv.it, linux-arm-kernel@lists.infradead.org, rmallon@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2011 at 02:00:15PM +0100, Linus Walleij wrote:
> On Thu, Nov 3, 2011 at 1:51 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> =

> > =A0 =A0 =A0 =A0stat =3D readl_relaxed(vic->base + VIC_IRQ_STATUS);
> > =A0 =A0 =A0 =A0while (stat) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while (stat) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq =3D ffs(stat) - 1;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stat &=3D ~(1 << irq);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_irq(irq);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stat =3D readl_relaxed(vic->base + VIC_I=
RQ_STATUS);
> > =A0 =A0 =A0 =A0}
> >
> > This ensures that we process all interrupts found pending before we
> > re-check for any new interrupts pending. =A0Arguably this is a much
> > fairer implementation (and may mean if things get irrevokably stuck,
> > things like sysrq via the console uart may still work.)
> =

> I really like the looks of this, Jamie can you do it like that?

Yup, I'll respin either tonight or tomorrow night and rebase ontop of =

the asm/exception.h patch.  Do we also want the behaviour so that it =

keeps looping over all VIC's until there are no pending interrupts?  I =

think that's probably worth it.

> Maybe some smallish comment about what's going on can be
> good for future generations reading that code...

OK, will do.

Thanks Linus and Russell!

Jamie
