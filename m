From: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Mon, 17 Sep 2018 16:47:00 +0000
Message-ID: <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "timur@kernel.org" <timur@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 9/17/2018 10:50 PM, Andrew Lunn wrote:
> On Mon, Sep 17, 2018 at 04:53:29PM +0800, Wang Dongsheng wrote:
>> This property copy from "ibm,emac.txt" to describe a shared MIDO bus.
>> Since emac include MDIO, so If the motherboard has more than one PHY
>> connected to an MDIO bus, this property will point to the MAC device
>> that has the MDIO bus.
>>
>> Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
>> ---
>> V2: s/Since QDF2400 emac/Since emac/
>> ---
>>  Documentation/devicetree/bindings/net/qcom-emac.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom-emac.txt b/Documentation/devicetree/bindings/net/qcom-emac.txt
>> index 346e6c7f47b7..50db71771358 100644
>> --- a/Documentation/devicetree/bindings/net/qcom-emac.txt
>> +++ b/Documentation/devicetree/bindings/net/qcom-emac.txt
>> @@ -24,6 +24,9 @@ Internal PHY node:
>>  The external phy child node:
>>  - reg : The phy address
>>  
>> +Optional properties:
>> +- mdio-device : Shared MIDO bus.
> Hi Dongsheng
>
> I don't see why you need this property. The ethernet interface has a
> phy-handle which points to a PHY. That is all you need to find the PHY.
phy-handle is description PHY address. This property is describing an
MDIO controller.
Each QCOM emac include an MDIO controller, normally each emac only
connect one
PHY device, but when all of the PHY devices mdio lines connect one MDIO
controller
that is included in EMAC, we need to share this MDIO controller for
others EMAC.

Normally:

                                (MDIO)
MAC0 ---------------------------------------PHY0
     |                                                               |
     |                          (DATA)                         |
     ---------------------------------------------


                                (MDIO)
MAC1 ---------------------------------------PHY1
     |                                                               |
     |                          (DATA)                         |
     ---------------------------------------------



Shared MDIO bus: "mdio-device" = &MAC0, MAC1 will get MAC0's MDIO bus
and also get the corresponding PHY device.

                                (DATA)
MAC0 ---------------------------------------PHY0
     |                                                               |
     |                          (MDIO)                         |
     --------------------------------------------
                                                                     |
MAC1                                                        PHY0
     |                                                               |
     |                          (DATA)                         |
     --------------------------------------------

Cheers,
Dongsheng


>         emac0: ethernet@feb20000 {
>                 compatible = "qcom,fsm9900-emac";
>                 reg = <0xfeb20000 0x10000>,
>                       <0xfeb36000 0x1000>;
>                 interrupts = <76>;
>
>                 clocks = <&gcc 0>, <&gcc 1>, <&gcc 3>, <&gcc 4>, <&gcc 5>,
>                         <&gcc 6>, <&gcc 7>;
>                 clock-names = "axi_clk", "cfg_ahb_clk", "high_speed_clk",
>                         "mdio_clk", "tx_clk", "rx_clk", "sys_clk";
>
>                 internal-phy = <&emac_sgmii>;
>
>                 phy-handle = <&phy0>;
>
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 phy0: ethernet-phy@0 {
>                         reg = <0>;
>                 };
>
>                 phy1: ethernet-phy@1 {
>                         reg = <1>;
>                 };
>
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&mdio_pins_a>;
>         };
>
>         emac1: ethernet@38900000 {
>                 compatible = "qcom,fsm9900-emac";
> 		...
> 		...
>
>                 phy-handle = <&phy1>;
> 	};
>
> 	Andrew
>
