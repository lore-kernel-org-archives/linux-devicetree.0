From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 1/4] usb: chipidea: msm: Add device tree binding
 information
Date: Wed, 4 Dec 2013 21:13:04 +0800
Message-ID: <20131204131303.GB1573@shlinux1.ap.freescale.net>
References: <1384176937-1658-1-git-send-email-iivanov@mm-sol.com>
 <1384176937-1658-2-git-send-email-iivanov@mm-sol.com>
 <20131204054003.GB29552@shlinux1.ap.freescale.net>
 <1386146037.16040.13.camel@iivanov-dev.int.mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386146037.16040.13.camel@iivanov-dev.int.mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, davidb@codeaurora.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 04, 2013 at 10:33:57AM +0200, Ivan T. Ivanov wrote:
> Hi Peter, 
> 
> Thank you for reviewing this patch.
> 
> On Wed, 2013-12-04 at 13:40 +0800, Peter Chen wrote: 
> > On Mon, Nov 11, 2013 at 03:35:34PM +0200, Ivan T. Ivanov wrote:
> > > From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> > > 
> > 
> > Please add something in commit log
> > 
> > > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> > > Cc: devicetree@vger.kernel.org
> > > ---
> > >  .../devicetree/bindings/usb/msm-hsusb.txt          |   16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> > > index 5ea26c6..0a85eba 100644
> > > --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> > > +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> > > @@ -15,3 +15,19 @@ Example EHCI controller device node:
> > >  		usb-phy = <&usb_otg>;
> > >  	};
> > >  
> > > +CI13xxx (Chipidea) USB controllers
> > > +
> > 
> > We have already renamed ci13xxx to ci_hdrc.
> 
> Yes, but the chip is still CI13XXX. Freescale documentations is also 
> referring to actual chip family.

OK, let's keep IP reference at doc. I will change the Freescale doc
name from ci13xxx-imx.txt to ci-hdrc-imx.txt

> 
> > 
> > > +Required properties:
> > > +- compatible: 	should contain "qcom,ci-hdrc"
> > > +- reg: 			offset and length of the register set in the memory map
> > > +- interrupts: 	interrupt-specifier for the controller interrupt.
> > > +- usb-phy:		phandle for the PHY device
> > > +- dr_mode: 		Sould be "peripheral"
> > > +
> > 
> > Please keep alignment for "reg"
> > 
> 
> It looks aligned in editor with smart-tab support.
> 

OK, let's keep it

-- 

Best Regards,
Peter Chen
