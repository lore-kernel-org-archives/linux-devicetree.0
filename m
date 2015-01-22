From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v9 3/3] phy: Add Qualcomm DWC3 HS/SS PHY driver
Date: Thu, 22 Jan 2015 15:44:13 -0600
Message-ID: <20150122214413.GA8057@qualcomm.com>
References: <1410550088-8754-1-git-send-email-agross@codeaurora.org>
 <1410550088-8754-4-git-send-email-agross@codeaurora.org>
 <20150122185914.GA4114@usblab-sd-06.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150122185914.GA4114@usblab-sd-06.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>
Cc: Felipe Balbi <balbi@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 22, 2015 at 10:59:14AM -0800, Jack Pham wrote:
> Hi Andy,
> 
> On Fri, Sep 12, 2014 at 02:28:08PM -0500, Andy Gross wrote:
> > This patch adds a new driver for the Qualcomm USB 3.0 PHY that exists on some
> > Qualcomm platforms.  This driver uses the generic PHY framework and will
> > interact with the DWC3 controller.
> > 
> > Signed-off-by: Andy Gross <agross@codeaurora.org>
> > ---
> >  drivers/phy/Kconfig         |   11 +
> >  drivers/phy/Makefile        |    1 +
> >  drivers/phy/phy-qcom-dwc3.c |  483 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 495 insertions(+)
> >  create mode 100644 drivers/phy/phy-qcom-dwc3.c
> 
> What happened to this patch? Looks like [1/3] & [2/3] made it in during
> the 3.18 merge, but did this one not get picked up by Kishon?

Got sidetracked.  I'll rework and resend in.  It'll be a couple days.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
