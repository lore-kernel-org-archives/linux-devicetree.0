From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Date: Thu, 29 Aug 2019 09:03:48 +0200
Message-ID: <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190223165218.GB572@tuxbook-pro>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mark.rutland@arm.com, robh@kernel.org, jackp@codeaurora.org, kishon@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, khasim.mohammed@linaro.org, linux-kernel@vger.kernel.org, swboyd@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/23/19 17:52, Bjorn Andersson wrote:
> On Thu 07 Feb 03:17 PST 2019, Jorge Ramirez-Ortiz wrote:
> 
>> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
>> controller embedded in QCS404.
>>
>> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
>> definitions.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  .../bindings/phy/qcom,snps-usb-ssphy.txt      | 79 +++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>> new file mode 100644
>> index 000000000000..354e6f9cef62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>> @@ -0,0 +1,79 @@
>> +Qualcomm Synopsys 1.0.0 SS phy controller
>> +===========================================
>> +
>> +Qualcomm 1.0.0 SS phy controller supports SuperSpeed USB connectivity on
>> +some Qualcomm platforms.
>> +
>> +Required properties:
>> +
>> +- compatible:
>> +    Value type: <string>
>> +    Definition: Should contain "qcom,snps-usb-ssphy".
> 
> Per Rob's request make this:
> 
> Should contain "qcom,qcs404-snps-usb-ssphy" and "qcom,snps-usb-ssphy"

ok

> 
> You can then leave the driver matching on qcom,snps-usb-ssphy for now
> and if we ever find this to be incompatible with other platforms we can
> make the driver match on the platform-specific compatible.

ok

> 
>> +
>> +- reg:
>> +    Value type: <prop-encoded-array>
>> +    Definition: USB PHY base address and length of the register map.
>> +
>> +- #phy-cells:
>> +    Value type: <u32>
>> +    Definition: Should be 0. See phy/phy-bindings.txt for details.
>> +
>> +- clocks:
>> +    Value type: <prop-encoded-array>
>> +    Definition: See clock-bindings.txt section "consumers". List of
>> +		 three clock specifiers for reference, phy core and
>> +		 pipe clocks.
>> +
>> +- clock-names:
>> +    Value type: <string>
>> +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
>> +		 property. Must contain "ref", "phy" and "pipe".
>> +
>> +- vdd-supply:
>> +    Value type: <phandle>
>> +    Definition: phandle to the regulator VDD supply node.
>> +
>> +- vdda1p8-supply:
>> +    Value type: <phandle>
>> +    Definition: phandle to the regulator 1.8V supply node.
>> +
>> +Optional properties:
>> +
>> +- resets:
>> +    Value type: <prop-encoded-array>
>> +    Definition: See reset.txt section "consumers". Specifiers for COM and
>> +		 PHY resets.
>> +
>> +- reset-names:
>> +    Value type: <string>
>> +    Definition: Names of the resets in 1-1 correspondence with the "resets"
>> +		 property. Must contain "com" and "phy" if the property is
>> +		 specified.
>> +
>> +Required child nodes:
>> +
>> +- usb connector node as defined in bindings/connector/usb-connector.txt
>> +  containing the property vbus-supply.
>> +
>> +Example:
>> +
>> +usb3_phy: usb3-phy@78000 {
>> +	compatible = "qcom,snps-usb-ssphy";
>> +	reg = <0x78000 0x400>;
>> +	#phy-cells = <0>;
>> +	clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
>> +		 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
>> +		 <&gcc GCC_USB3_PHY_PIPE_CLK>;
>> +	clock-names = "ref", "phy", "pipe";
>> +	resets = <&gcc GCC_USB3_PHY_BCR>,
>> +		 <&gcc GCC_USB3PHY_PHY_BCR>;
>> +	reset-names = "com", "phy";
>> +	vdd-supply = <&vreg_l3_1p05>;
>> +	vdda1p8-supply = <&vreg_l5_1p8>;
>> +	usb3_c_connector: usb3-c-connector {
> 
> The USB-C connector is attached both to the HS and SS PHYs, so I think
> you should represent this external to this node and use of_graph to
> query it.

but AFAICS we wont be able to retrieve the vbux-supply from an external
node (that interface does not exist).

rob, do you have a suggestion?

> 
> So the connector should look similar to example 2 in
> connector/usb-connector.txt.
> 
> Regards,
> Bjorn
> 
>> +		compatible = "usb-c-connector";
>> +		label = "USB-C";
>> +		type = "micro";
>> +		vbus-supply = <&usb3_vbus_reg>;
>> +	};
>> +};
>> -- 
>> 2.20.1
>>
> 
