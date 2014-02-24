From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: RE: [PATCH RESEND v2 1/3] usb: chipidea: msm: Add device tree
 binding information
Date: Mon, 24 Feb 2014 12:09:22 +0200
Message-ID: <1393236562.6481.5.camel@iivanov-dev>
References: <530512F1.3060304@cogentembedded.com>
	 <1392889988-24312-1-git-send-email-iivanov@mm-sol.com>
	 <94c57dc0d24f45a09985e05591a90bb2@BL2PR03MB226.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <94c57dc0d24f45a09985e05591a90bb2@BL2PR03MB226.namprd03.prod.outlook.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@freescale.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-02-24 at 08:15 +0000, Peter Chen wrote: 
> > +CI13xxx (Chipidea) USB controllers
> > +
> > +Required properties:
> > +- compatible:   should contain "qcom,ci-hdrc"
> > +- reg:          offset and length of the register set in the memory map
> > +- interrupts:   interrupt-specifier for the controller interrupt.
> > +- usb-phy:      phandle for the PHY device
> > +- dr_mode:      Sould be "peripheral"
> > +
> > +	gadget@f9a55000 {
> > +		compatible = "qcom,ci-hdrc";
> > +		reg = <0xf9a55000 0x400>;
> > +		dr_mode = "peripheral";
> > +		interrupts = <0 134 0>;
> > +		usb-phy = <&usb_otg>;
> > +	};
> > +
> 
> usb_otg is not a good name for the node of usb phy.

Well, this is just an example. Is this better <&phy0>?

Regards,
Ivan


> 
> Peter
> 
