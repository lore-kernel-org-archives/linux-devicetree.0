From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 16:26:59 +0100
Message-ID: <20151021152659.GF3270@x1>
References: <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
 <20151021084633.GB3270@x1>
 <20151021102952.GJ32054@sirena.org.uk>
 <20151021111832.GC3270@x1>
 <20151021121409.GA8232@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151021121409.GA8232@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Oct 2015, Mark Brown wrote:

> On Wed, Oct 21, 2015 at 12:18:32PM +0100, Lee Jones wrote:
> > On Wed, 21 Oct 2015, Mark Brown wrote:
> > > On Wed, Oct 21, 2015 at 09:46:33AM +0100, Lee Jones wrote:
> > > > On Tue, 20 Oct 2015, Andrew F. Davis wrote:
>=20
> > > It is however the normal way we write compatible strings - the cl=
ass
> > > information would normaly go in the node name (ie, i2c@7000c000 o=
r
> > > whatever).
>=20
> > I didn't say it hasn't been done before, just that I didn't like it
> > for the aforementioned reasons.  I can also find 1000's of compatib=
le
> > strings which do append "-<device_type>", so it's not exactly an
> > unheard of practice.
>=20
> It's a pretty substantial change in the way we make compatible string=
s
> that we probably want to discuss more widely if we want to adopt it -
> we've not been using that idiom and it's pretty surprising.  I'm not
> really sure it help much and we do already have the pre-@ noise words
> for this purpose (as well as comments in the DT).

I'm not *that* fussed about it to justify starting-up wider community
discussions.

My only point is that:

  compatible =3D "<vendor>,udw9283";

=2E.. is meaningless gibberish and I think it'd be better to be more
forthcoming which prevents having to dig around in DTS files for the
node name/label for true device/type identification.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
