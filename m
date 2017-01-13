From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v5 1/3] dmaengine: xilinx_dma: Check for channel idle
 state before submitting dma descriptor
Date: Fri, 13 Jan 2017 04:28:11 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A666658@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-2-git-send-email-appanad@xilinx.com>
 <20170110062349.GY3573@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110062349.GY3573@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...
>=20
> On Sat, Jan 07, 2017 at 12:15:28PM +0530, Kedareswara rao Appana wrote:
> > Add channel idle state to ensure that dma descriptor is not
> > submitted when VDMA engine is in progress.
>=20
> any reason why you want to make your own varible and not use the HW to
> query
> as done earlier. It is not clear to me why that is removed from descripti=
on

We need to poll for a bit in the status register to know the dma state.
We are currently doing that in the driver hot path
To avoid this using own variables.

Regards,
Kedar.
