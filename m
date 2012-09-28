From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for Tegra
Date: Fri, 28 Sep 2012 07:42:34 +0200
Message-ID: <20120928054234.GA10237@avionic-0098.mockup.avionic-design.de>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
 <1342106718-3058-7-git-send-email-sjg@chromium.org>
 <CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
 <501803F3.6090803@wwwdotorg.org>
 <CAPnjgZ2NAf4PF0_U9hQeJzpdL87ZNq+WpxsbFJQHbh4rY2MoEg@mail.gmail.com>
 <50647594.9060404@wwwdotorg.org>
 <CAPnjgZ2R=G=xmjdoP74JeAknwH9QGx8+mED7TQ8Kd_zEmcVwtQ@mail.gmail.com>
 <5064DF73.8000006@wwwdotorg.org>
 <CAPnjgZ3JuE_jiSRGW6o3eCbp4cLCf1uenKz4kPCpfqLJ3Mdmjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1782199822714645509=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ3JuE_jiSRGW6o3eCbp4cLCf1uenKz4kPCpfqLJ3Mdmjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1782199822714645509==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 04:37:41PM -0700, Simon Glass wrote:
> Hi Stephen,
>=20
> On Thu, Sep 27, 2012 at 4:21 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> w=
rote:
> > On 09/27/2012 02:27 PM, Simon Glass wrote:
> >> On Thu, Sep 27, 2012 at 8:49 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> >>> On 09/27/2012 07:58 AM, Simon Glass wrote:
> > ...
> >>>> Really this is just a way of getting U-Boot and Linux to agree on the
> >>>> address, by having U-Boot know the address that the kernel will happ=
en
> >>>> to use. It isn't very robust, but we have found it useful as a means
> >>>> of avoiding problems in this area.
> >>>
> >>> Right, but again, why can't the display driver simply read the address
> >>> out of the register; why is there a need to duplicate the data?
> >>>
> >>> I guess one possibility is that the register only gives the base addr=
ess
> >>> and not the size/mode of the allocated surface, but I don't recall if
> >>> this proposed binding did that either?
> >>
> >> So here is my explanation:
> >>
> >> 1. U-Boot would normally put the display right near the top of memory.
> >> Instead, it figures out where the kernel will put it (somehow this
> >> seems to often be at a fixed address) and uses that address.
> >>
> >> 2. That means that U-Boot will now have the display exactly where the
> >> kernel wants it.
> >
> > Oh, the DT property is telling U-Boot where to put the surface so that
> > when the kernel determines where to put it, it'll already be there?
> >
> > That seems completely backwards. It's also extremely fragile; what if
> > the kernel suddenly starts allocating at some other random address,
> > which stops matching what U-Boot expects?
>=20
> The screen will flicker, or may fill up with junk as the kernel boots.
> We did have that happen once when the driver changed.
>=20
> >
> > Far better would be for U-Boot to put the surface wherever it wants,
> > then manipulate the DT that's passed to the kernel to:
> >
> > a) Add a /memreserve/ so that memory doesn't get re-used for anything
> > else during boot.
> >
> > b) Add a property to the display node indicating which memreserve
> > represents the frame-buffer location.
>=20
> Yes, I believe the Tegra video driver we used (and I take your point
> that it doesn't exist upstream so there is no point in discussing it
> :-) always had to use the same frame buffer address. The memory was
> statically allocated. Certainly this could be encoded in the fdt.
>=20
> >
> > When the kernel boots, it can:
> >
> > * Copy the content from the U-Boot-allocated buffer to whatever display
> > buffer the kernel allocated before writing the new address to the HW.
> >
> > * Undo the memory reservation triggered by the /memreserve/ to allow the
> > memory to be re-used.
> >
> >> So what do you think? Should we remove this entirely, or is it a usefu=
l hack?
> >
> > Yes, I think in its current form, it isn't useful.
>=20
> Thanks for the thorough response. Let's remove it, particularly as
> there isn't even a kernel driver upstream yet.

We've been discussing some of these issues for quite some time and came
to the conclusion that the Tegra DRM driver should not be using static
allocations like the previous drivers did. One of the reasons is that
the amount of carveout memory needs to be fixed at boot time, which
isn't going to suit a wide range of devices well. Another, perhaps more
important reason is that starting with Tegra30 that's no longer
necessary because of the SMMU.

So in the end it wouldn't be possible to reliably determine the memory
area where the kernel will put the framebuffer. If we want a flicker-
free boot then we need to go with something more elaborate like what
Stephen suggested.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQZTjKAAoJEN0jrNd/PrOhSd0P/3A29MlEZgkLMywZZv8d+s4M
TkqsT2DkYoR5wGzGrp2C3YBJ+zAfl+NVMSQX7XFMxbJAZmVv8LyR1Yu1UwNyE/S9
/R52bYw+rxbttS4DgO4ZGmmmOqT1kWDVmLWHE7URuWgLZuiFvKoah4Mm4SugYEVp
9eyrfeosxnY7NbYGp224ijD2Q9h/4YMVqVXVZcL7TLeeu6HUOtguXR7eAo0CoXqq
tb28SLKq5Qou8UnqWO4lY9yAx9SUWuYFBarxaV3XqWcOh14cmIq0NJ0HM7ul4msv
s8sVLc/oaWEcIZcaitciOF+0Cdr1TbzfcIOyqKmyzvSKGRH7gWe6dxrzOGEYHGns
BVv7x3CVkFC55LTmybYd5anXKwPbFK0hPFGmm7fH7PGLaLRrs5FbdQis7ojFBwDp
nEcGJQbSn5i38fsErE2c5nq7ZHIDCmIsLgWznNDQOCC6vvBQn+vuELayFBt1lt8M
JFwiaYR9XhKpq0N3GkkN+QuOexN3pjgpi4RrGY/tHUWYTeGoOJno6iClvgtYhYsH
+jAsA1wkDXosJhF/ROQplQA3OasEUxBNkwRMy5Qsvq9r/L5kC4sRwnPmocts/rFc
DgfAxIUaWBigsfSGvtbDKv5g1mjZ7sgzu+Qy/uNjHGp1HVCcRn2miIOgm7fxfUJE
h2lyXaXo2dftG7dEaqDG
=W9eS
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============1782199822714645509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1782199822714645509==--
