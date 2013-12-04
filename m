From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Thu, 05 Dec 2013 00:45:17 +0100
Message-ID: <2124722.FKim1X37Up@avalon>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
	<2120855.5UlavpPp2J@avalon>
	<20131126085911.GA27752@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1890340931=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20131126085911.GA27752@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1890340931==
Content-Type: multipart/signed; boundary="nextPart2455356.uEjTI91Y1D"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--nextPart2455356.uEjTI91Y1D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Tuesday 26 November 2013 09:59:12 Thierry Reding wrote:
> On Tue, Nov 26, 2013 at 02:54:41AM +0100, Laurent Pinchart wrote:
> > On Friday 22 November 2013 19:41:54 Thierry Reding wrote:
> > > This binding specifies a set of common properties for display panels. It
> > > can be used as a basis by bindings for specific panels.
> > > 
> > > Bindings for three specific panels are provided to show how the simple
> > > panel binding can be used.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > This binding has already been discussed earlier. Both Laurent and Tomi
> > > seemed to be generally fine with this.
> > 
> > That's correct, I'm generally fine with your approach, but there's still
> > one point I'd like to see addressed.
> > 
> > As I mentioned previously, I would like to avoid adding zillions of
> > compatible properties to the driver, when we could use a single property
> > in the DT bindings that would specify the timings instead. This would
> > lower the amount of changes made to the simple panel driver, while
> > keeping DT simple enough (at least in my opinion).
> > 
> > Specifying the full timings in every DT source file would be pretty
> > verbose and could be error-prone. However, using a single property to
> > specify one of the standard display timings, as orinally proposed by Hans
> > de Goede (CC'ed) during a chat at the kernel summit would in my opinion be
> > a good middle-ground solution.
> > 
> > Would you consider adding such a property to the simple panel bindings,
> > and define a common compatible string ? Each panel should of course list
> > its own compatibility string in addition to the common compatible string
> > in case the need for extensions arises in the future.
> 
> My gripe with this is that it duplicates information. By definition a simple
> panel supports a limited number of display modes (typically only a single
> one), so once you know the compatible value (which needs to be there anyway)
> you can derive the mode from it. Adding a property that specifies the
> display mode is redundant.

But that could be said of pretty much every device :-) Let's take an example I 
came across today. The SPI DT bindings have a maximum clock speed property for 
every device. This is usually a property of the hardware, which could have 
been stored in the device drivers.

I don't particularly like expressing detailed device information in DT when 
the information is static for a given device and easily stored in the drivers. 
However, in this case, I believe the overhead of adding one mode property to 
DT is worth it, as there are zillion panel models in the wild. Going back to 
the SPI analogy, let's consider the m25p80 SPI flash memory driver. It 
supports many models, each of them implemented by a large number of 
manufacturers. The driver stores information for each model (such as the flash 
size), but the maximum SPI clock frequency is specified in DT as we don't want 
to have a list of all device models for all manufacturers in the driver 
(granted, one of the reasons to specify the max frequency in DT is that it can 
also be limited by the board, not only by the chip, but I believe my point 
remains valid).

> Dave Airlie proposed something else, namely to keep a list of common
> modes within the driver and have each device reference that mode
> instead. I think that could work similarily well. It still requires the
> driver to be touched for each new panel, but the changes will be very
> small. They'll be more of the "add a new table entry" sort of change
> that we have in drivers like the 8250/16550-compatible serial. Most of
> that could probably be wrapped into a macro to make it concise.

That would be better, but not perfect :-) Given the very large number of panel 
models I would like to have a simple panel driver that doesn't need to be 
patched for every model. The odd cases can of course be handled in C, but the 
common case would really benefit from being handled in DT. Imagine how 
annoying it would be to update the USB mass storage driver with the VID:PID of 
every new USB flash device.

-- 
Regards,

Laurent Pinchart

--nextPart2455356.uEjTI91Y1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJSn76TAAoJEIkPb2GL7hl1dpgIALDYB7sA7zaHjVG7p/P8HBqx
qfqVVLWjTfgcXcH4gv+tsLqjvJGfyrqAAf1Faqa7lWwbCuW5HlwBqkl1klKVdqSy
Ur6kiEsIRgyYx23Yygwi4dWu9ZJrbyWBocZ2hRr+/lQPVDq1l7DEuapTh0VRhxa5
pnVt/Umhf2HQu+Skr/7+OKzc/IepItU+T9IoZ0CnNDkEGifyqZ8DU7HTz+NMA8K1
dODVpu76A5P3PPpQMLNTmZ5dCpT4eQkD4g4gbmgim47zl6jiCuDHjNcdGDR2mvsj
TUyfrl/DiVOdtHGlJld9xM9KNAA+NyuGtUDw8kRcK8AcIcdRW/Dyeo7Nsa0hOls=
=3PDG
-----END PGP SIGNATURE-----

--nextPart2455356.uEjTI91Y1D--


--===============1890340931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1890340931==--
