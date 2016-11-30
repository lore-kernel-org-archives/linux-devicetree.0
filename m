From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Wed, 30 Nov 2016 12:12:55 +0200
Message-ID: <2039137.LtCOH6bs2I@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <20161129213650.uqcgekodq77wlmxs@lukather> <20161130100545.44546ed28896cdb9768f68cd@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBGOM7LAQKGQEN544J4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130100545.44546ed28896cdb9768f68cd-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Fran=C3=A7ois,

On Wednesday 30 Nov 2016 10:05:45 Jean-Francois Moine wrote:
> On Tue, 29 Nov 2016 22:36:50 +0100 Maxime Ripard wrote:
> > On Tue, Nov 29, 2016 at 11:18:35AM +0100, Jean-Francois Moine wrote:
> > > This patchset series adds HDMI video support to the Allwinner
> > > sun8i SoCs which include the display engine 2 (DE2).
> > > The driver contains the code for the A83T and H3 SoCs, and
> > > some H3 boards, but it could be used/extended for other SoCs
> > > (A64, H2, H5) and boards (Banana PIs, Orange PIs).
> >=20
> > Honestly, I'm getting a bit worried by the fact that you ignore
> > reviews.
> >=20
> > On the important reviews that you got that are to be seen as major
> >=20
> > issues that block the inclusion, we have:
> >   - The fact that the HDMI driver is actually just a designware IP,
> >     and while you should use the driver that already exists, you just
> >     duplicated all that code.
>=20
> The DW registers in the A83T and H3 are obfuscated, so, the code in
> bridge/DW cannot be used as it is. There should be either a translation
> table or a function to compute the register addresses.

Jernej mentioned there could be a way to restore the original Synopsys memo=
ry=20
map. If that works then using the dw-hdmi could be an option.

> More, it is not sure that the bridge/DW code would work with Allwinner's
> SoCs.

If it doesn't work and can't be made to work in a non-invasive way they it=
=20
should certainly not be used :-)

> It seems that they got some schematics from DesignWare, but, is it really
> the same hardware?

That's not really relevant, as long as the hardware is compatible, it doesn=
't=20
matter if it's a Synopsys IP or a custom implementation of the HDMI TX with=
 a=20
compatible interface.

> Also, if some changes had to be done in the bridge code, I could not chec=
k
> if this would break or not the other SoCs.

Nothing new here, all drivers that support multiple SoCs have the same=20
problem. That's why we have maintainers, testers and board farms to try and=
=20
catch issues as early as possible.

> Eventually, I went the same way as omap/hdmi5: different driver.

I might try to fix that for OMAP5 at some point, we'll see.

> >   - The fact that you ignored Rob (v6) and I (v5) comment on using OF
> >     graph to model the connection between the display engine and the
> >     TCON. Something that Laurent also pointed out in this version.
>=20
> I simply use the drm function drm_of_component_probe().
> If this one is in the DRM core, why should I not use it?
> If it must not be used, it would be nice to mark it as deprecated and
> to update the code of the drivers which are using it.

I haven't used that function so I can't comment here, except for the fact t=
hat=20
DT bindings are not designed based on a given OS implementation. It should =
be=20
the other way around, the bindings should be designed to clearly describe t=
he=20
hardware in a clean and consistent way that can be used by any host softwar=
e,=20
and the Linux helper functions should then be developed based on those=20
bindings.

> >   - The fact that you ignored that you needed an HDMI connector node
> >     as a child of the HDMI controller. This has been reported by Rob
> >     (v6) and yet again in this version by Laurent.
>=20
> As I don't know what is a DT 'connector', I cannot go further.
> I hope Laurent will give me clearer explanations and a real example.

Done, we can discuss this in that part of the mail thread.

> >   - And finally the fact that we can't have several display engine in
> >     parallel, if needs be. This has happened in the past already on
> >     Allwinner SoCs, so it's definitely something we should consider in
> >     the DT bindings, since we can't break them.
>=20
> IIRC, I proposed my driver before yours, and the DE2 is completely
> different from the other display engines.
> What you are telling is "add more code to already complex code and have
> a big driver for all SoCs in each kernels".
> I think it should be better to have small modules, each one treating
> specific hardware, and to let only the needed code in the kernel memory
> at startup time.
>=20
> > Until those are fixed, I cannot see how this driver can be merged,
> > unfortunately.
>=20
> No problem. I just wanted to help people by giving the job I did on the
> boards I have. My boards are working for almost one year, fine enough
> for I use them as daily desktop computers. I don't want to spend one
> more year for having my code in the Linux kernel: there are so much
> other exciting things to do...

And you're certainly welcome to contribute drivers to the kernel, that's=20
always appreciated. Of course, to ensure a reasonable level of quality and=
=20
consistency between drivers, the review process often requires changes to b=
e=20
made to the code being submitted. When it comes to drivers I mostly pay=20
attention to DT bindings, userspace APIs and modification to common code.=
=20
Driver code itself, as long as it's reasonably clean and doesn't impede=20
development of other drivers or impact system security in an adverse way, i=
s=20
still important but maybe slightly less so. I'll defer to Maxime to come to=
 an=20
agreement on the multiple display engines in parallel problem as I'm not=20
familiar with it for the Allwinner platforms.

--=20
Regards,

Laurent Pinchart

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
