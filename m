From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 12:18:32 +0100
Message-ID: <20151021111832.GC3270@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-2-git-send-email-afd@ti.com>
 <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
 <20151021084633.GB3270@x1>
 <20151021102952.GJ32054@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151021102952.GJ32054@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Oct 2015, Mark Brown wrote:

> On Wed, Oct 21, 2015 at 09:46:33AM +0100, Lee Jones wrote:
> > On Tue, 20 Oct 2015, Andrew F. Davis wrote:
>=20
> > > I could change the core to be "tps65086-pmic", then call the regu=
lator
> > > driver "tps65086-regulator" if this works for you, this seems to =
be the
> > > way new drivers name the regulator driver (max77843.c).
>=20
> > Yes, this is what I was thinking of.
>=20
> > ti,tps65086 is uninformative/undescriptive and tells me nothing.
>=20
> It is however the normal way we write compatible strings - the class
> information would normaly go in the node name (ie, i2c@7000c000 or
> whatever).

I didn't say it hasn't been done before, just that I didn't like it
for the aforementioned reasons.  I can also find 1000's of compatible
strings which do append "-<device_type>", so it's not exactly an
unheard of practice.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
