From: c-hbandi@codeaurora.org
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn3998
Date: Wed, 13 Mar 2019 12:00:06 +0530
Message-ID: <88a923e02073461abb5f3a7674150615@codeaurora.org>
References: <1552393379-26330-1-git-send-email-c-hbandi@codeaurora.org>
 <1552393379-26330-3-git-send-email-c-hbandi@codeaurora.org>
 <20190312165928.GD200579@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312165928.GD200579@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-bluetooth-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,


On 2019-03-12 22:29, Matthias Kaehlcke wrote:
> +DT folks
> 
> Please add them in future versions (script/scripts/get_maintainer.pl
> <patches> should have listed them)

[Harish] -- Will add them in new version of patches.
> 
> On Tue, Mar 12, 2019 at 05:52:59PM +0530, Harish Bandi wrote:
>> This patch enables regulators for the Qualcomm Bluetooth wcn3998
>> controller.
> 
> No, it doesn't.
> 
> The next version should probably say something like "Add compatible
> string for the Qualcomm WCN3998 Bluetooth controller.
> 
[Harish] -- From new patch onwards will add all patch
version changes and add proper description.

> Is there any particular reason why QCA drivers folks use 'wcn' instead
> of 'WCN'? The QCA documentations calls it WCN399x, so I'd suggest to
> consistently use the uppercase name in comments and documentation (and
> log messages?).
> 
[Harish] -- I think in DT we need to have small case like wcn, i think
that is the reason it started using in code, comments and dt 
documentation.

>> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
>> ---
>> changes in v3:
>> - updated to latest code base.
> 
> This comment is useless, please describe what changed wrt the previous
> version.
[Harish] --  added details in v2, and v3 uploaded just to rebase on tip 
of bluetooth-next
for better understanding of code in review. From new patch onwards will 
add all patch
version changes and add proper description.
> 
>> ---
>>  .../devicetree/bindings/net/qualcomm-bluetooth.txt        | 15 
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt 
>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> index 824c0e2..1221535 100644
>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>> @@ -53,3 +53,18 @@ serial@898000 {
>>  		max-speed = <3200000>;
>>  	};
>>  };
>> +
>> +&blsp1_uart3 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&blsp1_uart3_default>;
>> +	status = "okay";
>> +
>> +	bluetooth: wcn3998-bt {
>> +		compatible = "qcom,wcn3998-bt";
>> +		vddio-supply = <&vreg_l6_1p8>;
>> +		vddxo-supply = <&vreg_l5_1p8>;
>> +		vddrf-supply = <&vreg_s5_1p35>;
>> +		vddch0-supply = <&vdd_ch0_3p3>;
>> +		max-speed = <3200000>;
>> +	};
>> +};
>> \ No newline at end of file
> 
> I think the example isn't really needed since it's essentially the
> same as the one for 'qcom,wcn3990-bt'.
> 
> But the important part is missing: add the new compatible string under
> ´Required properties´. You also want to update the documentation that
> mentiones 'qcom,wcn3990-bt' to 'qcom,wcn399x-bt' (assuming for now
> that other possible WCN399x chips would be similar).
> 
[Harish] -- Will check the DT properties, documentation and update
accordingly in new patch.

> You mentioned in an earlier version of the series that there are
> multiple WCN3998 variants with different requirements for
> voltage/current. This seems to suggests that multiple compatible
> strings are needed to distinguish between them.
> 
[Harish] -- for now we want to add WCN3998 support only, What i mean to 
say in my earlier
explanation that. WCN3990 is base variant and on top of that we have 
variants like WCN3990,
WCN3998 and WCN3998-0,WCN3998-1 like that..
So I think wcn399x would make sense for this series.

> Thanks
> 
> Matthias

Thanks,
Harish
