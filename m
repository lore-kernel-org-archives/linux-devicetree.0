From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: RE: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Tue, 30 Aug 2016 14:07:17 +0000
Message-ID: <HE1PR0401MB2636B40376255680B6A58CFB8DE00@HE1PR0401MB2636.eurprd04.prod.outlook.com>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20160829095239.GM30790@tiger> <1472493061.13245.39.camel@buserror.net>
 <20160830120220.GC8363@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160830120220.GC8363@tiger>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Scott Wood <oss@buserror.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bhaskar U <bhaskar.upadhaya@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, Pratiyush Srivastava <pratiyush.srivastava@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Tuesday, August 30, 2016 7:02 AM
> To: Scott Wood <oss@buserror.net>
> Cc: Bhaskar U <bhaskar.upadhaya@nxp.com>; devicetree@vger.kernel.org; Pra=
tiyush Srivastava
> <pratiyush.srivastava@nxp.com>; Stuart Yoder <stuart.yoder@nxp.com>; Prab=
hakar Kushwaha
> <prabhakar.kushwaha@nxp.com>; linux-devel@gforge.freescale.net; linux-arm=
-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
> =

> On Mon, Aug 29, 2016 at 12:51:01PM -0500, Scott Wood wrote:
> > On Mon, 2016-08-29 at 17:52 +0800, Shawn Guo wrote:
> > > On Fri, Aug 26, 2016 at 03:57:21PM +0530, Bhaskar Upadhaya wrote:
> > > >
> > > > +		clockgen: clocking@1ee1000 {
> > > > +			compatible =3D "fsl,ls1012a-clockgen";
> > > The compatible cannot be found in binding docs.
> >
> > From=A0Documentation/devicetree/bindings/clock/qoriq-clock.txt:
> >
> > - compatible: Should contain a chip-specific clock block compatible
> > =A0=A0=A0=A0=A0=A0=A0=A0string and (if applicable) may contain a chassi=
s-version clock
> > =A0=A0=A0=A0=A0=A0=A0=A0compatible string.
> >
> > =A0 =A0 =A0 =A0 Chip-specific strings are of the form "fsl,<chip>-clock=
gen", such as:
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,p2041-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,p3041-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,p4080-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,p5020-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,p5040-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,t4240-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,b4420-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,b4860-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,ls1021a-clockgen"
> > =A0=A0=A0=A0=A0=A0=A0=A0Chassis-version clock strings include:
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,qoriq-clockgen-1.0": for chassis 1.0 clo=
cks
> > =A0=A0=A0=A0=A0=A0=A0=A0* "fsl,qoriq-clockgen-2.0": for chassis 2.0 clo=
cks
> >
> > I really hope we don't have to update every single fsl,<chip>-whatever =
binding
> > every time a new chip comes out. =A0There are already other chips not l=
isted,
> > FWIW (e.g. t1040, t2080, ls1043a, and ls2080a). =A0That's why it says "=
such as".
> =

> If I remember correctly, DT maintainers want every supported compatible
> string explicitly listed in bindings doc.  And they even added a check
> into checkpatch.pl with commit bff5da433525 ("checkpatch: add DT
> compatible string documentation checks").

See Documentation/devicetree/bindings/submitting-patches.txt:

  5) The wildcard "<chip>" may be used in compatible strings, as in
     the following example:

         - compatible: Must contain '"nvidia,<chip>-pcie",
           "nvidia,tegra20-pcie"' where <chip> is tegra30, tegra132, ...

     As in the above example, the known values of "<chip>" should be
     documented if it is used.

It _is_ allowed to use the <chip> wildcard, and so you will not find all
full compatible strings explicitly listed in bindings.  However, the
chips themselves "should" be listed.

Thanks,
Stuart
