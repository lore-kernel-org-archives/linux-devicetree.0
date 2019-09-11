From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: opos6ul/opos6uldev: rework device tree
 to support i.MX6ULL
Date: Wed, 11 Sep 2019 10:11:29 +0800
Message-ID: <20190911021127.GB13923@dragon>
References: <20190724120623.2385-1-sebastien.szymanski@armadeus.com>
 <194bd606-e4bf-d8fd-ece2-cbec1f5e025f@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <194bd606-e4bf-d8fd-ece2-cbec1f5e025f@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 09:38:11AM +0200, S=E9bastien Szymanski wrote:
> Hello,
> =

> On 7/24/19 2:06 PM, S=E9bastien Szymanski wrote:
> > Rework the device trees of the OPOS6UL and OPOS6ULDev boards to support
> > the OPOS6UL SoM with an i.MX6ULL SoC.  The device trees are now as
> > following:
> > =

> > - imx6ul-imx6ull-opos6ul.dtsi
> >   common for both i.MX6UL and i.MX6ULL OPOS6UL SoM.
> > - imx6ul-opos6ul.dtsi
> >   for i.MX6UL OPOS6UL SoM. It includes imx6ul.dtsi and
> >   imx6ul-imx6ull-opos6ul.dtsi.
> > - imx6ull-opos6ul.dtsi
> >   for i.MX6ULL OPOS6UL SoM. It includes imx6ull.dtsi and
> >   imx6ul-imx6ull-opos6ul.dtsi.
> > =

> > - imx6ul-imx6ull-opos6uldev.dtsi
> >   OPOS6ULDev base device tree.
> > - imx6ul-opos6uldev.dts
> >   OPOS6ULDev board with an i.MX6UL OPOS6UL SoM. It includes
> >   imx6ul-opos6ul.dtsi and imx6ul-imx6ull-opos6uldevdtsi.
> > - imx6ull-opos6uldev.dts
> >   OPOS6ULDev board with an i.MX6ULL OPOS6UL SoM. It includes
> >   imx6ull-opos6ul.dtsi and imx6ul-imx6ull-opos6uldevdtsi.
> > =

> > Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> > ---
> > =

> > Changes for v2:
> > - explain the file hierarchy in the commit log
> > - use MIT license instead of X11
> > - Change compatible properties to "armadeus,imx6{ul,ull}-opos6ul" and
> >   "armadeus,imx6{ul,ull}-opos6uldev" to follow the bindings of the
> >   Armadeus boards already supported.
> =

> gentle ping...

I missed the patches.  Sorry about that.  Just applied both.

Shawn
