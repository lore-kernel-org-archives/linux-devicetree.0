From: Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: Add Qualcomm DWC3 glue driver
Date: Fri, 13 Apr 2018 11:23:23 -0700
Message-ID: <20180413182323.GA11810@usblab-sd-06.qualcomm.com>
References: <1523638285-5742-1-git-send-email-mgautam@codeaurora.org>
 <1523638285-5742-3-git-send-email-mgautam@codeaurora.org>
 <20180413173322.GA30306@usblab-sd-06.qualcomm.com>
 <076ce053-c51d-0a53-507a-faa7481e8dcc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <076ce053-c51d-0a53-507a-faa7481e8dcc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 13, 2018 at 11:32:04PM +0530, Manu Gautam wrote:
> On 4/13/2018 11:03 PM, Jack Pham wrote:
> > Are the extcon phandles bound to the glue node? I don't see the
> > description in the bindings doc in PATCH 1/3. And if so, would it be
> > a duplicate of the child node's extcon binding? Then again, the
> > alternative would be to grab it directly from the child (i.e.
> > qcom->dwc3->dev.of_node) which I'm not sure is ok to do or not.
> >
> 
> Yes these are bound to glue node. I missed to add it to documentation, will do
> so.

Ok thanks.

> I kept it separate for couple of reasons - one is to not peek too-much into child
> node. Another reason is that doing so allows to have extcon in "peripheral"
> only mode as well (not just drd mode which is the case with dwc3 core).
> It allows to notify h/w when vbus is not there in device mode which IMO is
> right thing to do.

Ah, makes sense. extcon for the child is only needed for dual-role.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
