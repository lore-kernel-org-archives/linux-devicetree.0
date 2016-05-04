From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 9/9] dt-bindings: msm/dsi: Add assigned clocks bindings
Date: Wed, 4 May 2016 23:34:39 +0530
Message-ID: <572A39B7.5020008@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1462273081-5814-10-git-send-email-architt@codeaurora.org>
 <20160504134416.GA1235@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160504134416.GA1235@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 5/4/2016 7:14 PM, Rob Herring wrote:
> On Tue, May 03, 2016 at 04:28:01PM +0530, Archit Taneja wrote:
>> The PLL in the DSI PHY block generates 2 clock outputs (Byte and Pixel
>> clocks) that are fed into the Multimedia Clock Controller (MMCC). The MMCC
>> uses these as source clocks for some of its RCGs to generate clocks that
>> finally feed to the DSI host controller.
>>
>> Use the assigned clocks DT bindings to set up the MMCC RCGs that feed to
>> the DSI host. Use the DSI PHY provided clocks to set up the parents
>> of these assigned clocks.
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi.txt | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> index 0223f06..686f475 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> @@ -22,6 +22,10 @@ Required properties:
>>     * "core_clk"
>>     For DSIv2, we need an additional clock:
>>      * "src_clk"
>> +- assigned-clocks: Parents of "byte_clk" and "pixel_clk" for the given platform.
>> +  See [1] for more details.
>> +- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
>> +  by a DSI PHY block.
>>   - vdd-supply: phandle to vdd regulator device node
>>   - vddio-supply: phandle to vdd-io regulator device node
>>   - vdda-supply: phandle to vdda regulator device node
>> @@ -90,6 +94,8 @@ Required properties:
>>     * "dsi_pll"
>>     * "dsi_phy"
>>     * "dsi_phy_regulator"
>> +- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
>> +  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>
> You can't really add new required properties unless they are for a new
> compatible string.

Does this hold even when currently there isn't any device tree file in
the kernel that has this DT node in it?

I was trying to get all the properties in place before posting out
patches that actually add the nodes into the platform files. Currently,
they exist only DT files in downstream kernels.

Thanks,
Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
