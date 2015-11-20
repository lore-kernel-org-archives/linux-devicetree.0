From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for
 dragonboard OTG port
Date: Fri, 20 Nov 2015 14:36:55 -0800
Message-ID: <564FA087.5050807@sonymobile.com>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
 <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com>
 <20151111031445.GA8826@shlinux2> <56437F50.6050006@sonymobile.com>
 <20151112091349.GA3402@shlinux2> <877flhn9mh.fsf@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <877flhn9mh.fsf@saruman.tx.rr.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Peter Chen <peter.chen@freescale.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, =?UTF-8?Q?Andersson=2c_Bj=c3=b6rn?= <Bjorn.Andersson@sonymobile.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org



On 11/16/2015 09:21 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Peter Chen <peter.chen@freescale.com> writes:
>> On Wed, Nov 11, 2015 at 09:48:00AM -0800, Tim Bird wrote:
>>>
>>>
>>> On 11/10/2015 07:14 PM, Peter Chen wrote:
>>>> On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
>>>>> This fixes a bug where if you disconnect and re-connect the USB cable,
>>>>> the gadget driver stops working.
>>>>>
>>>>> Add support for async_irq to wake up driver from low power mode.
>>>>> Without this, the power management code never calls resume.
>>>>> Also, have the phy driver kick the gadget driver (chipidea otg)
>>>>> by having the chipidea driver register with it, for vbus connect
>>>>> notifications.
>>>>>
>>>>> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
>>>>> ---
>>>>>  drivers/usb/chipidea/udc.c    |  6 ++++++
>>>>>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
>>>>>  include/linux/usb/msm_hsusb.h |  1 +
>>>>>  3 files changed, 23 insertions(+)
> 
> I just wanna know how you guys want this to be handled ? Through my tree
> or chipidea's ? Or do we break the dependencies between the changes ?

I'm fine with splitting it up.  I'm sending a new series with 3 patches
right after this message.  Do both trees go to linux-next?
 -- Tim
