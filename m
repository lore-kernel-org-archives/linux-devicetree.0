From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix Xilinx VDMA
 specification
Date: Fri, 5 Dec 2014 22:17:58 +0530
Message-ID: <20141205164758.GR3411@intel.com>
References: <1415800277-6817-1-git-send-email-afaerber@suse.de>
 <6067bede14b9421fa87db96bdc66dc66@BN1AFFO11FD040.protection.gbl>
 <5463A0F4.6060300@suse.de>
 <bd47278216b64375b32cdc9ed66fe907@BN1BFFO11FD024.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bd47278216b64375b32cdc9ed66fe907@BN1BFFO11FD024.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 10:26:03AM -0800, S=F6ren Brinkmann wrote:
> On Wed, 2014-11-12 at 07:03PM +0100, Andreas F=E4rber wrote:
> > Am 12.11.2014 um 16:57 schrieb S=F6ren Brinkmann:
> > > On Wed, 2014-11-12 at 02:51PM +0100, Andreas F=E4rber wrote:
> > >> The specification requires xlnx,data-width, but example and driv=
er use
> > >> xlnx,datawidth. Change the specification to match the implementa=
tion.
> > >=20
> > > Isn't this the wrong way around? The bindings are considered API,=
 so
> > > shouldn't the driver be fixed to match the spec?
> >=20
> > In theory, patch review should've never let the two differ... ;)
> >=20
> > It's not my driver, so I fixed the perceived inconsistency the leas=
t
> > invasive way; Michal and Srikanth seemed to concur at the time.
> >=20
> > https://patchwork.kernel.org/patch/4620261/
> >=20
> > > Are there already dts files out there using either of these optio=
ns?
> >=20
> > In upstream, no. microblaze and virtex440 use a
> > xlnx,include-datawidth-matching-0 property as precedence for the
> > spelling, whereas there is an fsl,data-width and an unused msix-dat=
a-width.
> >=20
> > Downstream, yes: Beyond my own patch derived from the Parallella tr=
ee,
> > there's some in the ADI tree. None in the Xilinx tree on quick chec=
k.
> >=20
> > I haven't encountered any using the documented xlnx,data-width - bu=
t
> > this patch was authored pre 3.17, haven't ran a full Web search aga=
in.
>=20
> grepping through linux-next shows some usage of xlnx,datawidth, but
> only the single hit in  Documentation for xlnx,data-width.
> Other than VDMA the other hit seems to be just some DT
> documentation which I can't find a driver for...
> Anyhow, this patch is probably the best way of fixing this.
the driver had issues so want applied, I havent seen repot though.=20
Will apply this now

--=20
~Vinod

>=20
> Reviewed-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>=20
> 	Thanks,
> 	S=F6ren

--=20
