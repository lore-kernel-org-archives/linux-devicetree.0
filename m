From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 3 Nov 2011 13:31:02 +0000
Message-ID: <20111103133102.GM12913@n2100.arm.linux.org.uk>
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
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1qfVduMAmusNoLjDoqy2kDA4crN__iW9qEeXBgVT4cA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2011 at 02:00:15PM +0100, Linus Walleij wrote:
> On Thu, Nov 3, 2011 at 1:51 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
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
> =

> Maybe some smallish comment about what's going on can be
> good for future generations reading that code...

Bear in mind that it gets a little more complex when you have more
than one VIC, because the outer loop should be across all VICs.
