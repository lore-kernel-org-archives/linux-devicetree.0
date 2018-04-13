From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: Add Qualcomm DWC3 glue driver
Date: Fri, 13 Apr 2018 23:32:04 +0530
Message-ID: <076ce053-c51d-0a53-507a-faa7481e8dcc@codeaurora.org>
References: <1523638285-5742-1-git-send-email-mgautam@codeaurora.org>
 <1523638285-5742-3-git-send-email-mgautam@codeaurora.org>
 <20180413173322.GA30306@usblab-sd-06.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180413173322.GA30306@usblab-sd-06.qualcomm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>
Cc: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Jack,


On 4/13/2018 11:03 PM, Jack Pham wrote:
> Hi Manu,
>
> On Fri, Apr 13, 2018 at 10:21:23PM +0530, Manu Gautam wrote:
>> DWC3 controller on Qualcomm SOCs has a Qscratch wrapper.
>> Some of its uses are described below resulting in need to
>> have a separate glue driver instead of using dwc3-of-simple:
>>  - It exposes register interface to override vbus-override
>>    and lane0-pwr-present signals going to hardware. These
>>    must be updated in peripheral mode for DWC3 if vbus lines
>>    are not connected to hardware block. Otherwise RX termination
>>    in SS mode or DP pull-up is not applied by device controller.
>>  - pwr_events_irq_stat support to check if USB2 PHY is in L2 state
>>    before glue driver proceeds with suspend.
>>  - Support for wakeup interrupts lines that are asserted whenever
>>    there is any wakeup event on USB3 or USB2 bus.
>>  - Support to replace pip3 clock going to DWC3 with utmi clock
>>    for hardware configuration where SSPHY is not used with DWC3.
>>
>> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> <snip>
>
>> +static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>> +{
>> +	struct device		*dev = qcom->dev;
>> +	struct extcon_dev	*host_edev;
>> +	int			ret;
>> +
>> +	if (!of_property_read_bool(dev->of_node, "extcon"))
>> +		return 0;
>> +
>> +	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
> Are the extcon phandles bound to the glue node? I don't see the
> description in the bindings doc in PATCH 1/3. And if so, would it be
> a duplicate of the child node's extcon binding? Then again, the
> alternative would be to grab it directly from the child (i.e.
> qcom->dwc3->dev.of_node) which I'm not sure is ok to do or not.
>

Yes these are bound to glue node. I missed to add it to documentation, will do
so.
I kept it separate for couple of reasons - one is to not peek too-much into child
node. Another reason is that doing so allows to have extcon in "peripheral"
only mode as well (not just drd mode which is the case with dwc3 core).
It allows to notify h/w when vbus is not there in device mode which IMO is
right thing to do.



-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
