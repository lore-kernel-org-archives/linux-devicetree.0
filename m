From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: Best practice device tree design for display subsystems/DRM
Date: Wed, 03 Jul 2013 17:06:01 +0900
Message-ID: <00a001ce77c4$285f4270$791dc750$%dae@samsung.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702184305.GB13924@flint.arm.linux.org.uk>
 <CAMLZHHSU1OVrQrtucTNn4AmTCiNER19njvQdomxTcXAzqxCi4A@mail.gmail.com>
 <20130702190809.GC13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20130702190809.GC13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-language: ko
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
To: 'Russell King' <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: =?ISO-8859-1?Q?'Jean-Fran=E7ois_Moine'?= <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: dri-devel-bounces+inki.dae=3Dsamsung.com-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> [mailto:dri-devel-bounces+inki.dae=3Dsamsung.com-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org] On
> Behalf Of Russell King
> Sent: Wednesday, July 03, 2013 4:08 AM
> To: Daniel Drake
> Cc: Jean-Fran=E7ois Moine; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; dri-
> devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; Sebastian Hesselbarth
> Subject: Re: Best practice device tree design for display subsystems/DRM
> =

> On Tue, Jul 02, 2013 at 12:54:41PM -0600, Daniel Drake wrote:
> > On Tue, Jul 2, 2013 at 12:43 PM, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> wrote:
> > > I will point out that relying on driver probing orders has already
> been
> > > stated by driver model people to be unsafe.  This is why I will not
> > > adopt such a solution for my driver; it is a bad design.
> >
> > Just to clarify, what you're objecting to is effectively the
> > following? Because it is not guaranteed in the future that the probe
> > order will be the same as the platform_driver_register() calls?
> =

> Correct.  Consider what happens if the devices are registered after
> the driver(s) have been registered, which may not be in the correct
> order.
> =


That's true but how drivers could be registered prior to devices? The
devices registering codes are built in kernel image so the drivers cannot be
registered prior to devices as long as we don't modify the devices to be
registered first. Is there any case that driver should be registered first?

Thanks,
Inki Dae

> --
> Russell King
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
