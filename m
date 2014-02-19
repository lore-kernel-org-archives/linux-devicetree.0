From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2 1/3] usb: chipidea: msm: Add device tree binding
 information
Date: Wed, 19 Feb 2014 17:43:22 +0200
Message-ID: <1392824602.17130.68.camel@iivanov-dev>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
	 <1392729681-21022-2-git-send-email-iivanov@mm-sol.com>
	 <20140218212659.GL1706@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140218212659.GL1706@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi, 

On Tue, 2014-02-18 at 13:26 -0800, Courtney Cavin wrote: 
> On Tue, Feb 18, 2014 at 02:21:19PM +0100, Ivan T. Ivanov wrote:
> > From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> > 
> > Document device tree binding information as required by
> > the Qualcomm USB controller.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> > ---
> >  .../devicetree/bindings/usb/msm-hsusb.txt          |   17 +++++++++++++++++
> 
> Although you mentioned to Josh that this is intended for "non-standard"
> Chipidea properties, I don't see any other than requiring that 'dr_mode'
> must be "peripheral".  It would seem that this should all be integrated
> into a ci3xxx.txt.

Hm, there is no ci3xxx.txt. The closest match is ci-hdrc-imx.txt.
So it could be ci-hdrc-qcom.txt or my preferred name qcom,ci-hdrc.txt?

> > +CI13xxx (Chipidea) USB controllers
> > +
> > +Required properties:
> > +- compatible:   should contain "qcom,ci-hdrc"
> 
> Is there nothing more specific you could put here?  Maybe a hardware
> revision, or something?
> 

I am not aware of any version numbers here, sorry.


> > +- reg:          offset and length of the register set in the memory map
> > +- interrupts:   interrupt-specifier for the controller interrupt.
> > +- usb-phy:      phandle for the PHY device
> > +- dr_mode:      Sould be "peripheral"
> 
> s/Sould/should/

Thanks, 
Ivan

> 
> -Courtney
