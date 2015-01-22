From: Jack Pham <jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [Patch v9 3/3] phy: Add Qualcomm DWC3 HS/SS PHY driver
Date: Thu, 22 Jan 2015 10:59:14 -0800
Message-ID: <20150122185914.GA4114@usblab-sd-06.qualcomm.com>
References: <1410550088-8754-1-git-send-email-agross@codeaurora.org>
 <1410550088-8754-4-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410550088-8754-4-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Fri, Sep 12, 2014 at 02:28:08PM -0500, Andy Gross wrote:
> This patch adds a new driver for the Qualcomm USB 3.0 PHY that exists on some
> Qualcomm platforms.  This driver uses the generic PHY framework and will
> interact with the DWC3 controller.
> 
> Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/phy/Kconfig         |   11 +
>  drivers/phy/Makefile        |    1 +
>  drivers/phy/phy-qcom-dwc3.c |  483 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 495 insertions(+)
>  create mode 100644 drivers/phy/phy-qcom-dwc3.c

What happened to this patch? Looks like [1/3] & [2/3] made it in during
the 3.18 merge, but did this one not get picked up by Kishon?

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
