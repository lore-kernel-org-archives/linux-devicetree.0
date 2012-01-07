From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] of: Change logic to overwrite cmd_line with
 CONFIG_CMDLINE
Date: Fri, 6 Jan 2012 16:48:14 -0800
Message-ID: <CAD=FV=UVo-vCe-s9tdXq_Od3jJnJ58Nx=4f-S3XfWBfDhxoXMg@mail.gmail.com>
References: <1316494215.7975.29.camel@pasglop>
 <20110920045510.GA31886@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110920045510.GA31886-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I know this is a long-dead thread, but I was a little curious about
the motivation here.

I'm looking at trying to support CONFIG_CMDLINE_EXTEND (an ARM
Kconfig) in this function and don't know in which cases I should look
at the CONFIG_CMDLINE and in which cases I should use whatever
happened to be in data before the function was called.

Here's the=A0definition in the KConfig:
<http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dblob;f=
=3Darch/arm/Kconfig;h=3D24626b0419ee97e963e68329a8eb6769360b46ea;hb=3DHEAD#=
l1984>

Which case do you have=A0CONFIG_CMDLINE defined but not CMDLINE_FORCE?
In those cases, do you happen to have=A0CONFIG_CMDLINE_EXTEND or
CMDLINE_FROM_BOOTLOADER defined?

Thanks much!

-Doug

---

On Mon, Sep 19, 2011 at 9:55 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>
> On Tue, Sep 20, 2011 at 02:50:15PM +1000, Benjamin Herrenschmidt wrote:
> > We used to overwrite with CONFIG_CMDLINE if we found a chosen
> > node but failed to get bootargs out of it or they were empty,
> > unless CONFIG_CMDLINE_FORCE is set.
> >
> > Instead change that to overwrite if "data" is non empty after
> > the bootargs check. It allows arch code to have other mechanisms
> > to retrieve the command line prior to parsing the device-tree.
> >
> > Note: CONFIG_CMDLINE_FORCE case should ideally be handled elsewhere
> > as it won't work as it-is if the device-tree has no /chosen node
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > CC: devicetree-discuss-w3QoH2/gNlk/bJ5BZ2RsiQ@public.gmane.org
> > CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Looks okay to me.
>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> > ---
> > =A0drivers/of/fdt.c | =A0 =A07 ++++++-
> > =A01 files changed, 6 insertions(+), 1 deletions(-)
> >
> > v2. Use "data" instead of "cmd_line" so it works on archs like
> > mips who don't pass cmd_line to that function to start with, also
> > add a comment explaining the mechanism.
> >
> > (resent with right list address as well while at it)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 65200af..323b722 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -681,9 +681,14 @@ int __init early_init_dt_scan_chosen(unsigned long=
 node, const char *uname,
> > =A0 =A0 =A0 if (p !=3D NULL && l > 0)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(data, p, min((int)l, COMMAND_LINE_S=
IZE));
> >
> > + =A0 =A0 /*
> > + =A0 =A0 =A0* CONFIG_CMDLINE is meant to be a default in case nothing =
else
> > + =A0 =A0 =A0* managed to set the command line, unless CONFIG_CMDLINE_F=
ORCE
> > + =A0 =A0 =A0* is set in which case we override whatever was found earl=
ier.
> > + =A0 =A0 =A0*/
> > =A0#ifdef CONFIG_CMDLINE
> > =A0#ifndef CONFIG_CMDLINE_FORCE
> > - =A0 =A0 if (p =3D=3D NULL || l =3D=3D 0 || (l =3D=3D 1 && (*p) =3D=3D=
 0))
> > + =A0 =A0 if (!data[0])
> > =A0#endif
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_=
SIZE);
> > =A0#endif /* CONFIG_CMDLINE */
> > --
> > 1.7.4.1
> >
> >
> >
> >
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
