From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [RFC PATCH] edac: zynq: Added EDAC support for zynq ddr ecc
 controller
Date: Mon, 10 Mar 2014 15:32:25 -0700
Message-ID: <fa35006e-055d-4ef2-9b65-a0f8cc6a0c8f@AM1EHSMHS016.ehs.local>
References: <4adb2b4b-2ad6-42b9-929e-cc062f817245@TX2EHSMHS021.ehs.local>
 <20140310105655.GH14999@e106331-lin.cambridge.arm.com>
 <531DA900.5060202@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <531DA900.5060202@monstr.eu>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Mark Rutland <mark.rutland@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "kpc528@gmail.com" <kpc528@gmail.com>, "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>punnai
List-Id: devicetree@vger.kernel.org

On Mon, 2014-03-10 at 12:58PM +0100, Michal Simek wrote:
> On 03/10/2014 11:56 AM, Mark Rutland wrote:
> > On Sun, Mar 09, 2014 at 02:57:16AM +0000, Punnaiah Choudary Kalluri=
 wrote:
> >> Added EDAC support for reporting the ecc errors of zynq ddr contro=
ller.
> >> The ddr ecc controller corrects single bit errors and detects doub=
le bit
> >> errors
> >>
> >> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> >> ---
> >>  .../devicetree/bindings/edac/zynq_edac.txt         |   18 +
> >>  drivers/edac/Kconfig                               |    7 +
> >>  drivers/edac/Makefile                              |    1 +
> >>  drivers/edac/zynq_edac.c                           |  613 +++++++=
+++++++++++++
> >>  4 files changed, 639 insertions(+), 0 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/edac/zynq_ed=
ac.txt
> >>  create mode 100644 drivers/edac/zynq_edac.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/edac/zynq_edac.txt =
b/Documentation/devicetree/bindings/edac/zynq_edac.txt
> >> new file mode 100644
> >> index 0000000..c21ff83
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/edac/zynq_edac.txt
> >> @@ -0,0 +1,18 @@
> >> +Zynq EDAC driver, it does reports the DDR ECC single bit errors t=
hat are
> >> +corrected and double bit ecc errors that are detected by the DDR =
ECC controller.
> >> +ECC support for DDR is available in half-bus width(16 bit) config=
uration only.
> >> +
> >> +Required properties:
> >> +- compatible: Should be "xlnx,ps7-ddrc" or "xlnx,ps7-ddrc-1.00.a"
> >=20
> > Is this an or or a xor?
>=20
> Compatible string should be just xlnx,zynq-ddrc-1.00.a.
> Nothing with ps7.

Isn't this vendor IP? IMHO, this should be something completely
different. Or if you want some Zynq-specific compat string it should
refer to an actual version string associated with Zynq. 1.00.a is not,
AFAIK.

	S=C3=B6ren


