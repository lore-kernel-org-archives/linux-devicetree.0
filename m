From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v5 3/3] dmaengine: xilinx_dma: Fix race condition in the
 driver for multiple descriptor scenario
Date: Thu, 12 Jan 2017 14:19:49 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A6662F1@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-4-git-send-email-appanad@xilinx.com>
 <20170110084917.GA3573@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110084917.GA3573@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...   =20

> On Sat, Jan 07, 2017 at 12:15:30PM +0530, Kedareswara rao Appana wrote:
> > When driver is handling AXI DMA SoftIP When user submits multiple
> > descriptors back to back on the S2MM(recv) side with the current
> > driver flow the last buffer descriptor next bd points to a invalid
> > location resulting the invalid data or errors in the DMA engine.
>=20
> Can you rephrase this, it a bit hard to understand.

When DMA is receiving packets h/w expects the descriptors
Should be in the form of a ring (I mean h/w buffer descriptor
Next descriptor field should always point to valid address
So that when DMA engine go and fetch that next descriptor it always=20
Sees a valid address).

But with the current driver implementation when user queues
Multiple descriptors the last descriptor next descriptor field
Pointing to an invalid location causing data corruption or=20
Errors from the DMA h/w engine...

To avoid this issue creating a Buffer descriptor Chain during=20
Channel allocation and using those buffer descriptors for processing
User requested data.

Please let me know if the above explanation is not clear will explain in de=
tail....

>=20
> >
> > This patch fixes this issue by creating a BD Chain during
>=20
> whats a BD?

Buffer descriptor.

>=20
> > channel allocation itself and use those BD's.
> >
> > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> > ---
> >
> >  drivers/dma/xilinx/xilinx_dma.c | 133
> > +++++++++++++++++++++++++---------------
> >  1 file changed, 83 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/dma/xilinx/xilinx_dma.c
> > b/drivers/dma/xilinx/xilinx_dma.c index 0e9c02e..af2159d 100644
> > --- a/drivers/dma/xilinx/xilinx_dma.c
> > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > @@ -163,6 +163,7 @@
> >  #define XILINX_DMA_BD_SOP		BIT(27)
> >  #define XILINX_DMA_BD_EOP		BIT(26)
> >  #define XILINX_DMA_COALESCE_MAX		255
> > +#define XILINX_DMA_NUM_DESCS		255
>=20
> why 255?

It is not an h/w limitation=20
Allocating 255 descriptors (Each descriptor is capable of sending 7MB data)
So roughly using allocated descriptors DMA engine can transfer 1GB data
And in the driver we are reusing the allocated descriptors when they are fr=
ee.

Regards,
Kedar.
