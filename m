From: Pavan Kondeti <pkondeti@codeaurora.org>
Subject: Re: USB support for device tree
Date: Fri, 04 Nov 2011 23:21:00 +0530
Message-ID: <4EB42604.3030701@codeaurora.org>
References: <4EB3A165.8060300@codeaurora.org> <20111104154356.GA30439@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20111104154356.GA30439@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: devicetree-discuss@lists.ozlabs.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

On 11/4/2011 9:13 PM, Greg KH wrote:
> On Fri, Nov 04, 2011 at 01:55:09PM +0530, Pavan Kondeti wrote:
>> Hi
>>
>> I am working on adding USB device tree support for MSM platform.  One of
>> our chip set has 2 hsusb cores. The first core is configured as otg and
>> the other core is configured in host only mode (EHCI compliant). Are the
>> below device node names Okay? Please suggest.
> 
> Why do you need to name the speed of the device and the host?  That
> doesn't really matter if you plug a low-speed device into that super
> speed host controller, right?
> 

Right :-)

> I'm not familiar with device tree naming conventions, but is this
> something you do for network devices?  If not, I'd not recommend it for
> USB controllers either.
> 

I am also not sure about the label names. The reason I would like to
have them in device tree source file is just for readability. One can
easily correlates the device node properties with the label. Say if I
want to change the IRQ number or some property value of 1st instance
HSUSB device controller (while porting a different board), I look for
hsusb0-device.

Thanks,
Pavan

-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
