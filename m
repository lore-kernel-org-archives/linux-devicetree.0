From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v3 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Wed, 4 Jan 2017 13:30:00 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A66087E@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483512847-25710-1-git-send-email-appanad@xilinx.com>
 <1483512847-25710-3-git-send-email-appanad@xilinx.com>
 <df3662de-fa3b-b33e-ebf5-88802aea5c49@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <df3662de-fa3b-b33e-ebf5-88802aea5c49@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi=20

	Thanks for the review...
>=20
> Hi Kedar,
>=20
>=20
> On 04-01-2017 06:54, Kedareswara rao Appana wrote:
> > When VDMA is configured for more than one frame in the h/w for example
> > h/w is configured for n number of frames and user Submits n number of
> > frames and triggered the DMA using issue_pending API.
> > In the current driver flow we are submitting one frame at a time but
> > we should submit all the n number of frames at one time as the h/w Is
> > configured for n number of frames.
> >
> > This patch fixes this issue.
> >
> > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
>=20
> Looks fine. I have a couple of minor comments, if you address them you ca=
n add
> "Reviewed-by: Jose Abreu <joabreu@synopsys.com>"
> in next version.

Thanks...
Sure will fix the comments and will add your' s Reviewed-by....

[snip]
> > +	/*
> > +	 * Note: When VDMA is built with default h/w configuration
> > +	 * On the S2MM(recv) side user should submit frames upto
> > +	 * H/W configured. If users submits less than h/w configured
> > +	 * VDMA engine tries to write to a invalid location
> > +	 * Results undefined behaviour/memory corruption.
> > +	 *
> > +	 * If user would like to submit frames less than h/w capable
> > +	 * On S2MM side please enable debug info 13 at the h/w level
> > +	 * It will allows the frame buffers numbers to be modified at runtime=
.
> > +	 */
> > +	if (!chan->has_fstoreconfig && chan->direction =3D=3D DMA_DEV_TO_MEM
> &&
> > +	    chan->desc_pendingcount < chan->num_frms) {
> > +		dev_dbg(chan->dev, "Frame Store Configuration is not enabled
> at the");
> > +		dev_dbg(chan->dev, " H/w level enable Debug info 13 at the
> h/w level");
> > +		dev_dbg(chan->dev, " OR Submit the frames upto h/w
> Capable\n\r");
> > +
> > +		return;
> > +	}
>=20
> Hmm, may dev_warn would be more suitable because with dev_dbg and no
> dynamic debug enabled user will not know what happened. Also, I am aware
> that in direction DMA_MEM_TO_DEV there will be no corruption in PC side b=
ut it
> will be corruption in VDMA side because it will read from invalid memory
> locations. Maybe drop the check for channel direction.

Sure will fix it in the next version....

>=20
> I am also not fancy about dropping prints that are not grep'able (you do =
not
> break line in each print so a user searching for the whole string will no=
t find it).
> Try to do a line break in each print or change the string to be smaller.
>=20

Sure will add a line break in each print in the next version...

Regards,
Kedar.

> Best regards,
> Jose Miguel Abreu
>=20
