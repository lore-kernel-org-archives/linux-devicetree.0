From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: r8a7795: Add DRIF support
Date: Fri, 23 Jun 2017 10:37:25 +0000
Message-ID: <KL1PR0601MB20386D3501FE12F0ECE8A5AEC3D80@KL1PR0601MB2038.apcprd06.prod.outlook.com>
References: <20170623091320.12664-1-ramesh.shanmugasundaram@bp.renesas.com>
 <20170623094104.GA24191@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170623094104.GA24191@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Hi Simon,

> Subject: Re: [PATCH] arm64: dts: r8a7795: Add DRIF support
>=20
> On Fri, Jun 23, 2017 at 10:13:20AM +0100, Ramesh Shanmugasundaram wrote:
> > Adds the DRIF controller nodes for r8a7795.
> >
> > Signed-off-by: Ramesh Shanmugasundaram
> > <ramesh.shanmugasundaram@bp.renesas.com>
> > ---
> > Hi Simon,
> >
> >    This patch is based on renesas-devel-20170622-v4.12-rc6 tag.
> >    It is verified on both H3 ES1.1 and ES2.0 SoC revisions.
> >
> >    The bindings[1] and the driver[2] were pushed into the media_tree.
> >
> >    [1]
> https://git.linuxtv.org/media_tree.git/commit/?id=3D54a707ea011601f06cc5e=
f7f
> e6d0daac71ab0622
> >    [2]
> > https://git.linuxtv.org/media_tree.git/commit/?id=3D7625ee981af166ddb56=
9
> > e2e6c0006e2af471326f
> >
>=20
> Thanks. Has this been tested not to cause regressions when applied on top
> of renesas-devel-20170622-v4.12-rc6 (without the driver
> changes) ?

Yes, I just tested it without the driver changes on top of renesas-devel-20=
170622-v4.12-rc6 and it works fine on both ES1.1 & 2.0s.

Thanks,
Ramesh
