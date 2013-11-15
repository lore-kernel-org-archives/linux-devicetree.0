From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 12/15] usb: phy: msm: Add support for secondary PHY
 control
Date: Fri, 15 Nov 2013 16:42:13 +0000
Message-ID: <20131115164212.GI24831@e106331-lin.cambridge.arm.com>
References: <1384267910-32066-1-git-send-email-iivanov@mm-sol.com>
 <1384267910-32066-13-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384267910-32066-13-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "davidb@codeaurora.org" <davidb@codeaurora.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 02:51:47PM +0000, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> 
> Allow support to use 2nd HSPHY with USB2 Core.
> Some platforms may have configuration to allow USB controller
> work with any of the two HSPHYs present. By default driver
> configures USB core to use primary HSPHY. Add support to allow
> user select 2nd HSPHY using DT parameter.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/usb/msm-hsusb.txt          |    6 +++++
>  drivers/usb/phy/phy-msm-usb.c                      |   24 ++++++++++++++++++--
>  include/linux/usb/msm_hsusb.h                      |    1 +
>  include/linux/usb/msm_hsusb_hw.h                   |    1 +
>  4 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> index 3f21204..d105ba9 100644
> --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> @@ -72,6 +72,12 @@ Optional properties:
>  - qcom,phy-init-sequence: PHY configuration sequence. val, reg pairs
>  				terminate with -1
>  
> +- qcom,phy-num:	Select number of pyco-phy to use, can be one of
> +				0 - PHY one, default
> +				1 - Second PHY
> +				Some platforms may have configuration to allow USB
> +				controller work with any of the two HSPHYs present.
> +

Only one can be used at a time?

[...]

> @@ -1395,6 +1412,9 @@ static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)
>  	if (!of_property_read_u32(node, "qcom,otg-control", &val))
>  		pdata->otg_control = val;
>  
> +	if (!of_property_read_u32(node, "qcom,phy-num", &val))
> +		motg->phy_number = val;

No sanity checking? If not all of your tests on the value of
motg->phy_number are the same form, you may get undepected results...

Mark.
