From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC 6/8] of: add clock providers
Date: Thu, 1 Dec 2011 14:34:48 +0800
Message-ID: <20111201063447.GH711@S2100-06.ap.freescale.net>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-7-git-send-email-grant.likely@secretlab.ca>
 <20111121153716.GA16417@S2100-06.ap.freescale.net>
 <CACxGe6teGPmgOiwSVQ_PebXo=9x8EVwjH2qQYi5LU813BvY3Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6teGPmgOiwSVQ_PebXo=9x8EVwjH2qQYi5LU813BvY3Ow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 30, 2011 at 12:38:19PM -0700, Grant Likely wrote:
> On Mon, Nov 21, 2011 at 8:37 AM, Shawn Guo <shawn.guo@freescale.com> =
wrote:
> > On Tue, Nov 08, 2011 at 06:19:41PM -0700, Grant Likely wrote:
> >> +struct clk *of_clk_get_by_name(struct device_node *np, const char=
 *name)
> >> +{
> >> + =A0 =A0 int index =3D 0;
> >> +
> >> + =A0 =A0 if (name)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 index =3D of_property_match_string(np, "=
clock-input-names", name);
> >
> > If it fails to match name, we may want to force 'index' back to 0.
>=20
> Actually, if it fails to match, the function should fail.

Hmm, that will require the clock-input-name be same as the second
parameter of clk_get() - con_id, which may have been named to some
string not suitable for clock-input-name.  For those case, we will
probably need to change the drivers to rename the con_id?  Or just
force the clock-input-name to be that improper con_id string?

--=20
Regards,
Shawn
