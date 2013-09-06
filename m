From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v8 1/3] DMA: Freescale: revise device tree binding
 document
Date: Fri, 6 Sep 2013 10:55:23 -0500
Message-ID: <1378482923.12204.193.camel@snotra.buserror.net>
References: <1377600123-5746-1-git-send-email-hongbo.zhang@freescale.com>
	 <1377600123-5746-2-git-send-email-hongbo.zhang@freescale.com>
	 <20130827112509.GH19893@e106331-lin.cambridge.arm.com>
	 <521DB26F.8010501@freescale.com>
	 <20130828124857.GB10250@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828124857.GB10250@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Hongbo Zhang <hongbo.zhang@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "djbw@fb.com" <djbw@fb.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-08-28 at 13:48 +0100, Mark Rutland wrote:
> On Wed, Aug 28, 2013 at 09:18:55AM +0100, Hongbo Zhang wrote:
> > On 08/27/2013 07:25 PM, Mark Rutland wrote:
> > > On Tue, Aug 27, 2013 at 11:42:01AM +0100, hongbo.zhang@freescale.com wrote:
> > >> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> > >>
> > >> This patch updates the discription of each type of DMA controller and its
> > >> channels, it is preparation for adding another new DMA controller binding, it
> > >> also fixes some defects of indent for text alignment at the same time.
> > >>
> > >> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
> > >> ---
> > >>   .../devicetree/bindings/powerpc/fsl/dma.txt        |   62 +++++++++-----------
> > >>   1 file changed, 27 insertions(+), 35 deletions(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> > >> index 2a4b4bc..ddf17af 100644
> > >> --- a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> > >> +++ b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
> > >> @@ -1,33 +1,29 @@
> > >> -* Freescale 83xx DMA Controller
> > >> +* Freescale DMA Controllers
> > >>   
> > >> -Freescale PowerPC 83xx have on chip general purpose DMA controllers.
> > >> +** Freescale Elo DMA Controller
> > >> +   This is a little-endian DMA controller, used in Freescale mpc83xx series
> > >> +   chips such as mpc8315, mpc8349, mpc8379 etc.
> > >>   
> > >>   Required properties:
> > >>   
> > >> -- compatible        : compatible list, contains 2 entries, first is
> > >> -		 "fsl,CHIP-dma", where CHIP is the processor
> > >> -		 (mpc8349, mpc8360, etc.) and the second is
> > >> -		 "fsl,elo-dma"
> > >> -- reg               : <registers mapping for DMA general status reg>
> > >> -- ranges		: Should be defined as specified in 1) to describe the
> > >> -		  DMA controller channels.
> > >> +- compatible        : must include "fsl,elo-dma"
> > > We should list the other values that may be in the list also, unless
> > > they are really of no consequence, in which case their presence in dt is
> > > questionable.
> > Hmm.  Stephen questioned here too, it seems this is a default rule.
> > Although Scott@freescale had explained our thoughts, I'd like to edit 
> > this item like this:
> > 
> > "must include "fsl,eloplus-dma", and a "fsl,CHIP-dma" is optional, where 
> > CHIP is the processor name"
> > 
> > We don't list all the chip name because we have tens of them and we 
> > cannot list all of them, and it is unnecessary to list them because we 
> > even don't use "fsl,CHIP-dma" in the new driver, add "fsl,CHIP-dma" here 
> > just make it questionable when it presents in example and  old dts files.
> > 
> > I remove the examples in bracket "(mpc8349, mpc8360, etc.)" because we 
> > can see the real example below.
> > I don't say" if "fsl,CHIP-dma" presents, it should be the first one, and 
> > the "fsl,eloplus-dma" should be the second" because it is common rule.
> > the description language should be clear and concise too I think.
> 
> Actually, you've convinced me for the form as you originally converted
> it (must include "fsl,elo-dma"), given that the other strings aren't
> used to give information anywhere and "fsl,CHIP-dma" doesn't fully
> define a valid string.

More generally, bindings should always specify "must include" rather
than "must be" for compatible, since by the nature of compatible you
could have a derivative device with more features that is compatible
with the device described in the binding, and the binding shouldn't
preclude identifying the derivative device.

-Scott
