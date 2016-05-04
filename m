From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 8/9] dt-bindings: msm/dsi: Modify port and PHY bindings
Date: Wed, 4 May 2016 13:39:09 +0530
Message-ID: <5729AE25.2020804@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1462273081-5814-9-git-send-email-architt@codeaurora.org>
 <1462284128.3617.68.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1462284128.3617.68.camel@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robdclark@gmail.com, robh@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/03/2016 07:32 PM, Philipp Zabel wrote:
> Am Dienstag, den 03.05.2016, 16:28 +0530 schrieb Archit Taneja:
>> The DSI node now has two ports that describe the connection between the
>> MDP interface output and the DSI input, and the connection between the DSI
>> output and the connected panel/bridge. Update the properties and the
>> example.
>>
>> Also, use generic PHY bindings instead of the custom one.
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   .../devicetree/bindings/display/msm/dsi.txt        | 53 +++++++++++++++-------
>>   1 file changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> index bf41d7c..0223f06 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> @@ -25,12 +25,18 @@ Required properties:
>>   - vdd-supply: phandle to vdd regulator device node
>>   - vddio-supply: phandle to vdd-io regulator device node
>>   - vdda-supply: phandle to vdda regulator device node
>> -- qcom,dsi-phy: phandle to DSI PHY device node
>> +- phys: phandle to DSI PHY device node
>> +- phy-names: the name of the corresponding PHY device
>
> Should "dsi_phy" be specified here?
>
> Also is there any kind of system to the PHY naming? I've seen more
> bindings use hyphen instead of underscore in the name, for example.
> I have called the MediaTek MIPI_TX PHY "dphy" for no other reason than
> it's a MIPI D-PHY.

I agree with the hyphen part, I'll switch to that.

The DSI PHY block isn't only the D-PHY interface, it also contains a
PLL and some logic to support more complex configurations (for
example, syncing with the PHY connected to another DSI output). That's
the main reason why I left the name as "dsi_phy".

>
>>   - syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
>> +- ports: Contains 2 DSI controller ports as child nodes. Each port contains
>> +  an endpoint subnode as defined in [2] and [3]. port@0 describes the
>> +  connection between the MDP interface output and the DSI input. port@1
>> +  describes the connection between the DSI output and the connected
>> +  panel/bridge.
>>
>>   Optional properties:
>>   - panel@0: Node of panel connected to this DSI controller.
>> -  See files in [2] for each supported panel.
>> +  See files in [4] for each supported panel.
>>   - qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
>>     driving a panel which needs 2 DSI links.
>>   - qcom,master-dsi: Boolean value indicating if the DSI controller is driving
>> @@ -42,15 +48,15 @@ Optional properties:
>>   - pinctrl-names: the pin control state names; should contain "default"
>>   - pinctrl-0: the default pinctrl state (active)
>>   - pinctrl-n: the "sleep" pinctrl state
>> -- port: DSI controller output port, containing one endpoint subnode.
>>
>>     DSI Endpoint properties:
>> -  - remote-endpoint: set to phandle of the connected panel's endpoint.
>> -    See [3] for device graph info.
>> +  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
>> +    input endpoint. For port@1, set to the MDP interface output.
>>     - qcom,data-lane-map: this describes how the logical DSI lanes are mapped
>>       to the physical lanes on the given platform. The value contained in
>>       index n describes what logical data lane is mapped to the physical data
>> -    lane n (DATAn, where n lies between 0 and 3).
>> +    lane n (DATAn, where n lies between 0 and 3). Only for the endpoint in
>> +    port@1.
>
> I approve of the of graph change, but I notice that the
> qcom,data-lane-map is very similar to the data-lanes property documented
> in Documentation/devicetree/bindings/media/video-interfaces.txt for MIPI
> CSI-2. Could that maybe be reused for DSI?

You're right. I missed out on the existing binding when I posted this.
One difference in this binding is that the indices here point to the
physical lanes, and the value contained in the index is the logical
lane (that's how it's described in the register documentation). For
the "data-lanes" property, it's the other way round. It's still
better to use the existing binding. I'll post a separate patch to
update this.


>
>>       For example:
>>
>> @@ -97,8 +103,9 @@ Optional properties:
>>     regulator is wanted.
>>
>>   [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> -[2] Documentation/devicetree/bindings/display/panel/
>> -[3] Documentation/devicetree/bindings/graph.txt
>> +[2] Documentation/devicetree/bindings/graph.txt
>> +[3] Documentation/devicetree/bindings/media/video-interfaces.txt
>> +[4] Documentation/devicetree/bindings/display/panel/
>>
>>   Example:
>>   	dsi0: dsi@fd922800 {
>> @@ -129,7 +136,8 @@ Example:
>>   		vdd-supply = <&pma8084_l22>;
>>   		vddio-supply = <&pma8084_l12>;
>>
>> -		qcom,dsi-phy = <&dsi_phy0>;
>> +		phys = <&dsi_phy0>;
>> +		phy-names ="dsi_phy";
>>
>>   		qcom,dual-dsi-mode;
>>   		qcom,master-dsi;
>> @@ -139,6 +147,26 @@ Example:
>>   		pinctrl-0 = <&mdss_dsi_active>;
>>   		pinctrl-1 = <&mdss_dsi_suspend>;
>>
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				dsi0_in: endpoint {
>> +					remote-endpoint = <&mdp_intf1_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +				dsi0_out: endpoint {
>> +					remote-endpoint = <&panel_in>;
>> +					qcom,data-lane-map = <0 1 2 3>;
>> +				};
>> +			};
>> +		};
>> +
>>   		panel: panel@0 {
>>   			compatible = "sharp,lq101r1sx01";
>>   			reg = <0>;
>
> If the panel is connected via port@1, why is this still needed?

Did you mean that the numbering(reg prop) isn't needed? If so, yeah, I
missed out on that. I'll remove it. Thanks for pointing it out.

Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
