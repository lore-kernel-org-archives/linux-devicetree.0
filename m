From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Fri, 6 Dec 2013 14:58:00 +0100
Message-ID: <20131206135759.GD30960@ulmo.nvidia.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
	<2120855.5UlavpPp2J@avalon>
	<20131126085911.GA27752@ulmo.nvidia.com>
	<2124722.FKim1X37Up@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1235543125=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2124722.FKim1X37Up@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1235543125==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 12:45:17AM +0100, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> On Tuesday 26 November 2013 09:59:12 Thierry Reding wrote:
> > On Tue, Nov 26, 2013 at 02:54:41AM +0100, Laurent Pinchart wrote:
> > > On Friday 22 November 2013 19:41:54 Thierry Reding wrote:
> > > > This binding specifies a set of common properties for display panel=
s. It
> > > > can be used as a basis by bindings for specific panels.
> > > >=20
> > > > Bindings for three specific panels are provided to show how the sim=
ple
> > > > panel binding can be used.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > This binding has already been discussed earlier. Both Laurent and T=
omi
> > > > seemed to be generally fine with this.
> > >=20
> > > That's correct, I'm generally fine with your approach, but there's st=
ill
> > > one point I'd like to see addressed.
> > >=20
> > > As I mentioned previously, I would like to avoid adding zillions of
> > > compatible properties to the driver, when we could use a single prope=
rty
> > > in the DT bindings that would specify the timings instead. This would
> > > lower the amount of changes made to the simple panel driver, while
> > > keeping DT simple enough (at least in my opinion).
> > >=20
> > > Specifying the full timings in every DT source file would be pretty
> > > verbose and could be error-prone. However, using a single property to
> > > specify one of the standard display timings, as orinally proposed by =
Hans
> > > de Goede (CC'ed) during a chat at the kernel summit would in my opini=
on be
> > > a good middle-ground solution.
> > >=20
> > > Would you consider adding such a property to the simple panel binding=
s,
> > > and define a common compatible string ? Each panel should of course l=
ist
> > > its own compatibility string in addition to the common compatible str=
ing
> > > in case the need for extensions arises in the future.
> >=20
> > My gripe with this is that it duplicates information. By definition a s=
imple
> > panel supports a limited number of display modes (typically only a sing=
le
> > one), so once you know the compatible value (which needs to be there an=
yway)
> > you can derive the mode from it. Adding a property that specifies the
> > display mode is redundant.
>=20
> But that could be said of pretty much every device :-) Let's take an exam=
ple I=20
> came across today. The SPI DT bindings have a maximum clock speed propert=
y for=20
> every device. This is usually a property of the hardware, which could hav=
e=20
> been stored in the device drivers.

No it isn't. It's a board-specific property. It depends on all sorts of
factors such as how long the connections are between SPI master and
slave as well as what other electrical components happen to be in that
path.

> I don't particularly like expressing detailed device information in DT wh=
en=20
> the information is static for a given device and easily stored in the dri=
vers.=20
> However, in this case, I believe the overhead of adding one mode property=
 to=20
> DT is worth it, as there are zillion panel models in the wild. Going back=
 to=20
> the SPI analogy, let's consider the m25p80 SPI flash memory driver. It=20
> supports many models, each of them implemented by a large number of=20
> manufacturers. The driver stores information for each model (such as the =
flash=20
> size), but the maximum SPI clock frequency is specified in DT as we don't=
 want=20
> to have a list of all device models for all manufacturers in the driver=
=20
> (granted, one of the reasons to specify the max frequency in DT is that i=
t can=20
> also be limited by the board, not only by the chip, but I believe my poin=
t=20
> remains valid).

On the contrary, it completely invalidates your point.

And in fact m25p80 is another perfect example to prove my point. Having
display modes encoded within the panel driver and selected depending on
the compatible string isn't anything other than the m25p_ids table.

When you want to support a new type of device, you need to add a new
entry into the m25p_ids table, just like you would add a new display
mode to the panel driver.

> > Dave Airlie proposed something else, namely to keep a list of common
> > modes within the driver and have each device reference that mode
> > instead. I think that could work similarily well. It still requires the
> > driver to be touched for each new panel, but the changes will be very
> > small. They'll be more of the "add a new table entry" sort of change
> > that we have in drivers like the 8250/16550-compatible serial. Most of
> > that could probably be wrapped into a macro to make it concise.
>=20
> That would be better, but not perfect :-) Given the very large number of =
panel
> models I would like to have a simple panel driver that doesn't need to be
> patched for every model. The odd cases can of course be handled in C, but=
 the
> common case would really benefit from being handled in DT.

I really don't think the number of panels supported in mainline will be
overly big. Even if, I will gladly take patches that add them to the
driver. And it isn't even a lot of work, you really just need to copy
this stuff from the datasheet. And the larger the number of panels the
kernel supports, the easier it will get to add new support because you
may either just be able to reuse the compatible string because somebody
else already added support for it, or you may be able to reuse an
existing mode because your panel happens to match that mode.

> Imagine how annoying it would be to update the USB mass storage driver
> with the VID:PID of every new USB flash device.

The electrical interface of USB is well defined and it is further well
specified what USB mass storage means. In addition, USB has very good
support for probing capabilities and characteristics. The equivalent for
panels would be something like EDID. If the panel provided EDID, then of
course you don't need to specify the mode, neither in DT nor in the
driver.

Yet, even with the availability of specifications and standard USB
classes, USB is still one of the areas where doing this is most common:

	$ git grep -n 'USB_DEVICE_.*(' -- drivers/ | wc -l
	829

And then there's things like drivers/hid/usbhid/hid-quirks.c and other
such things.

Thierry

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSodfnAAoJEN0jrNd/PrOhAQEQAJ+yMbviVbT4Vsay+cLWp6nJ
VKAhNZoahE8jFWHP4m03Iqm9eqhgtWtqMS6tpZyfsfjGvm5rpRdQJdYvQNzPxYlW
czlw5+XtiCtIEAsgGxriTUgNPJ6rZW3FP/oEq2UzCBHX3YTxOW3uLQ6ufqccjYt3
4b2RGIyF42pc48HsAkbz/49wAma2XNNDUP1pLkTNVmX/rjtj6VI6qBWSTuqWsMLD
nIJoDPWT565SjU10zQX4akupD6ZpZizq4nnDifGJyf2DjobRX+9UPTUdslEZKjVt
3lDY3oWhkGbc3UGAKi/apQgRTbWsaeDvCy5SNya8HIAayvSnPTwoVvtk10ZJGSa0
NF7Dmj8T8P1OvZGw8DWkS96v7N98gEGUhPM2GKbu45uhLUeTeIJ/8DSlMwB2o3ku
PZNmzwu3kDhDwNp/RgZp3AxO9Tbrra/chU1XkKI20xdqgNv0eieYhT0ynjWmcwmm
AsTXExUAMl6DghjHaMvt4B0XV0IAo8zkGUUJ6E6XtVIS32/wR2M2GIMFWu4uZ6Q3
VtiaFxekApWFUD8bkMR7BMZHSKPgYWRW4rU2+aMWTPg0E4EKLnlLiOL9qHIvi1SR
wUPghuXQDLAF4mXDxyuPhAbqqwkk1/KSGCviJ76mPaehIN3M7sfyuoW8249xCBuh
TaJ3IaQugoVS0D74FkYX
=KWrK
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--

--===============1235543125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1235543125==--
