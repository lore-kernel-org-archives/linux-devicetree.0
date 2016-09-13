From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/2] usb: dwc3: Add ref clock period setting
Date: Tue, 13 Sep 2016 12:06:56 -0700
Message-ID: <ad348c9f-5a2f-63f9-136f-5441eab890fa@synopsys.com>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
 <20160912140940.GA12684@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912140940.GA12684@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, John Youn <John.Youn@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
List-Id: devicetree@vger.kernel.org

On 9/12/2016 7:09 AM, Rob Herring wrote:
> On Thu, Sep 01, 2016 at 02:32:30PM -0700, John Youn wrote:
>> From: Thinh Nguyen <thinhn@synopsys.com>
>>
>> Added ref_clk_per for writing to GUCTL.RefClkPer which
>> sets the period of ref_clk in nano second.
>>
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> Signed-off-by: John Youn <johnyoun@synopsys.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
>>  drivers/usb/dwc3/core.c                        | 21 +++++++++++++++++++++
>>  drivers/usb/dwc3/core.h                        |  5 +++++
>>  drivers/usb/dwc3/dwc3-pci.c                    |  1 +
>>  4 files changed, 29 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index e3e6983..aa54ba7 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -50,6 +50,8 @@ Optional properties:
>>   - snps,hird-threshold: HIRD threshold
>>   - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
>>     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
>> + - snps,ref_clk_per: value for GUTCL.RefClkPer field that sets the period of
>> +			ref_clk in nano seconds.
> 
> Use '-' rather than '_' and add a unit suffix (property-units.txt).
> 

Ok. We'll change it to: snps,ref-clk-period-ns

John
