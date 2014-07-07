From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 2/2] devicetree: Add Zynq GPIO devicetree bindings
 documentation
Date: Mon, 7 Jul 2014 10:35:02 -0700
Message-ID: <30b61880-97a0-4e94-a71e-d738f0416d9d@BN1BFFO11FD056.protection.gbl>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
 <1403091577-10232-2-git-send-email-harinik@xilinx.com>
 <CACRpkdYZ8gQ_-z3Ue3WZZ4FiV8dhw_BZez2-PLpeiBTs-UnNFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYZ8gQ_-z3Ue3WZZ4FiV8dhw_BZez2-PLpeiBTs-UnNFQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Harini Katakam <harinik@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Harini Katakam <harinikatakamlinux@gmail.com>, Harini Katakam <harini.katakam@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-07-07 at 04:53PM +0200, Linus Walleij wrote:
> On Wed, Jun 18, 2014 at 1:39 PM, Harini Katakam <harinik@xilinx.com> =
wrote:
>=20
> > From: Harini Katakam <harini.katakam@xilinx.com>
> >
> > Add gpio-zynq bindings documentation.
> >
> > Signed-off-by: Harini Katakam <harinik@xilinx.com>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> >
> > v2 changes:
> > Improve description.
> (...)
> > +- #gpio-cells          : Should be two. First cell is used to ment=
ion
> > +                         pin number.
>=20
> Don't call this "pin number", call it "GPIO line number".
It's also not mentioning the second cell at all. I'll take the part fro=
m
gpio-msm to document this property and replace 'pin' with 'GPIO line'.

	S=C3=B6ren
