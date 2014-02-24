From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH RESEND v2 1/3] usb: chipidea: msm: Add device tree
 binding information
Date: Mon, 24 Feb 2014 08:15:43 +0000
Message-ID: <94c57dc0d24f45a09985e05591a90bb2@BL2PR03MB226.namprd03.prod.outlook.com>
References: <530512F1.3060304@cogentembedded.com>
 <1392889988-24312-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392889988-24312-1-git-send-email-iivanov@mm-sol.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

 
> +CI13xxx (Chipidea) USB controllers
> +
> +Required properties:
> +- compatible:   should contain "qcom,ci-hdrc"
> +- reg:          offset and length of the register set in the memory map
> +- interrupts:   interrupt-specifier for the controller interrupt.
> +- usb-phy:      phandle for the PHY device
> +- dr_mode:      Sould be "peripheral"
> +
> +	gadget@f9a55000 {
> +		compatible = "qcom,ci-hdrc";
> +		reg = <0xf9a55000 0x400>;
> +		dr_mode = "peripheral";
> +		interrupts = <0 134 0>;
> +		usb-phy = <&usb_otg>;
> +	};
> +

usb_otg is not a good name for the node of usb phy.

Peter
