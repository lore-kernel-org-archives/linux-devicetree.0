From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 05/14] ARM: at91: add pinctrl support
Date: Sat, 25 Aug 2012 10:38:11 +0200
Message-ID: <20120825083811.GB7629@game.jcrosoft.org>
References: <20120810124820.GA20557@game.jcrosoft.org>
 <1344603731-32667-1-git-send-email-plagnioj@jcrosoft.com>
 <1344603731-32667-5-git-send-email-plagnioj@jcrosoft.com>
 <CACRpkdZ2__V06Eo8JH451Sup5Nw2jJXVOH2FOfZBp5nNYpCtbg@mail.gmail.com>
 <5034FC18.2090400@wwwdotorg.org>
 <CACQ1gAieByr5vMmyyCuGtS8AgnnRZPPhLZY8sKvwvcQYe5ieUA@mail.gmail.com>
 <50366D2B.4010807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <50366D2B.4010807@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Richard Genoud <richard.genoud@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11:49 Thu 23 Aug     , Stephen Warren wrote:
> On 08/23/2012 01:06 AM, Richard Genoud wrote:
> > 2012/8/22 Stephen Warren <swarren@wwwdotorg.org>:
> >>>> +Required properties for iomux controller:
> >>>> +- compatible: "atmel,at91rm9200-pinctrl"
> >>>> +- atmel,mux-mask: array of mask (periph per bank) to describe if a =
pin can be
> >>>> +  configured in this periph mode. All the periph and bank need to b=
e describe.
> >>>
> >>> Can you please be more elaborate on this mux-mask, like what each bit
> >>> means and why the bits are arranged like that and what it means on the
> >>> AT91 platform.... I was first reading the .dts and was like ?woot? so
> >>> I go to the bindings doc and I read this and I'm still like ?woot?..
> >>
> >> Yes, I'm a little confused what this is, and wouldn't have a clue how =
to
> >> fill it in.
> >
> > With a practical example it's easier to understand.
> > Take a SAM9X5 release manual (here is sam9g35):
> > http://www.atmel.com/Images/doc11053.pdf page 11 (=A74.3 package pinout)
> > in the file arch/arm/boot/dts/at91sam9x5.dtsi you've got the the
> > atmel,mux-mask like that:
> >
> > /* periphA  periphB    periphC     */
> > 0xffffffff 0xffe0399f 0xc000001c  /* pioA */
> > 0x0007ffff 0x8000fe3f 0x00000000  /* pioB */
> > 0x80000000 0x07c0ffff 0xb83fffff  /* pioC */
> > 0x003fffff 0x003f8000 0x00000000  /* pioD */
> > =

> > Let's take the PioA - peripheral B: 0xffe0399f
> > From the documentation table 4-3, we can extract the column PIO
> > Periperal B for all signals PA0-PA31:
> ...
> > Each time it's possible to mux a pin to the peripheral B function (ie
> > when there's no "-----") the corresponding bit is set:
> ...
> > =3D> this gives 0x399f
> =

> Ah OK. It would be a good idea to briefly describe this process in the
> binding document I think. I assume this property exists to avoid the
> kernel driver having to contain tables for each Atmel device; the driver
> is generic.
Yeap I did this exactly for this

I do not want to maintain such code for the whole bunch of at91
and this way I add other SoC with just via dtsi without touching c code

I think other driver should do so too

Best Regards,
J.
