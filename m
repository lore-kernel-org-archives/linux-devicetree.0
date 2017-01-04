From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v4 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Wed, 4 Jan 2017 17:00:50 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A660958@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483536954-27203-1-git-send-email-appanad@xilinx.com>
 <1483536954-27203-3-git-send-email-appanad@xilinx.com>
 <20170104152613.hhdptwsyg73ev3dz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104152613.hhdptwsyg73ev3dz@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

	Thanks for the review....

> On Wed, Jan 04, 2017 at 07:05:53PM +0530, Kedareswara rao Appana wrote:
> > When VDMA is configured for more than one frame in the h/w for example
> > h/w is configured for n number of frames and user Submits n number of
> > frames and triggered the DMA using issue_pending API.
> > In the current driver flow we are submitting one frame at a time but
> > we should submit all the n number of frames at one time as the h/w Is
> > configured for n number of frames.
>=20
> Please fix run-on sentences, capitalization, and word wrapping.

Sure will fix in the next version....

[Snip]
-- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> > @@ -66,6 +66,8 @@ Optional child node properties:
> >  Optional child node properties for VDMA:
> >  - xlnx,genlock-mode: Tells Genlock synchronization is
> >  	enabled/disabled in hardware.
> > +- xlnx,fstore-config: Tells Whether Frame Store Configuration is
> > +	enabled/disabled in hardware.
>=20
> What's the default (when not present)? That should be the most common cas=
e.
> Looks like the code treats this as bool, but that's not clear here. The n=
ame is not
> clear what it is doing. Enabling or disabling the feature?

Default value is zero...
When this property is present it tells hardware is configured for frame sto=
re configuration.

Will fix the explanation part in the next version like below.
 xlnx,fstore-config: Tells hardware is configured for frame store configura=
tion.
Is the above explanation clear???

Regards,
Kedar.
