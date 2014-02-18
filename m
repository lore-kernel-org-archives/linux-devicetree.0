From: Courtney Cavin <courtney.cavin@sonymobile.com>
Subject: Re: [PATCH v2 1/3] usb: chipidea: msm: Add device tree binding
 information
Date: Tue, 18 Feb 2014 13:26:59 -0800
Message-ID: <20140218212659.GL1706@sonymobile.com>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
 <1392729681-21022-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392729681-21022-2-git-send-email-iivanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 02:21:19PM +0100, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> 
> Document device tree binding information as required by
> the Qualcomm USB controller.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> ---
>  .../devicetree/bindings/usb/msm-hsusb.txt          |   17 +++++++++++++++++

Although you mentioned to Josh that this is intended for "non-standard"
Chipidea properties, I don't see any other than requiring that 'dr_mode'
must be "peripheral".  It would seem that this should all be integrated
into a ci3xxx.txt.

>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> index 5ea26c6..d4e7e41 100644
> --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> @@ -15,3 +15,20 @@ Example EHCI controller device node:
>  		usb-phy = <&usb_otg>;
>  	};
>  
> +CI13xxx (Chipidea) USB controllers
> +
> +Required properties:
> +- compatible:   should contain "qcom,ci-hdrc"

Is there nothing more specific you could put here?  Maybe a hardware
revision, or something?

> +- reg:          offset and length of the register set in the memory map
> +- interrupts:   interrupt-specifier for the controller interrupt.
> +- usb-phy:      phandle for the PHY device
> +- dr_mode:      Sould be "peripheral"

s/Sould/should/

-Courtney
