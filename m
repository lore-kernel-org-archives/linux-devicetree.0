From: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Tue, 18 Sep 2018 08:47:38 +0000
Message-ID: <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "timur@kernel.org" <timur@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2018/9/18 0:54, Florian Fainelli wrote:
> On 09/17/2018 09:47 AM, Wang, Dongsheng wrote:
>> On 9/17/2018 10:50 PM, Andrew Lunn wrote:
>>> On Mon, Sep 17, 2018 at 04:53:29PM +0800, Wang Dongsheng wrote:
>>>> This property copy from "ibm,emac.txt" to describe a shared MIDO bus.
>>>> Since emac include MDIO, so If the motherboard has more than one PHY
>>>> connected to an MDIO bus, this property will point to the MAC device
>>>> that has the MDIO bus.
>>>>
>>>> Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
>>>> ---
>>>> V2: s/Since QDF2400 emac/Since emac/
>>>> ---
>>>>  Documentation/devicetree/bindings/net/qcom-emac.txt | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/qcom-emac.txt b/Documentation/devicetree/bindings/net/qcom-emac.txt
>>>> index 346e6c7f47b7..50db71771358 100644
>>>> --- a/Documentation/devicetree/bindings/net/qcom-emac.txt
>>>> +++ b/Documentation/devicetree/bindings/net/qcom-emac.txt
>>>> @@ -24,6 +24,9 @@ Internal PHY node:
>>>>  The external phy child node:
>>>>  - reg : The phy address
>>>>  
>>>> +Optional properties:
>>>> +- mdio-device : Shared MIDO bus.
>>> Hi Dongsheng
>>>
>>> I don't see why you need this property. The ethernet interface has a
>>> phy-handle which points to a PHY. That is all you need to find the PHY.
>> phy-handle is description PHY address. This property is describing an
>> MDIO controller.
>> Each QCOM emac include an MDIO controller, normally each emac only
>> connect one
>> PHY device, but when all of the PHY devices mdio lines connect one MDIO
>> controller
>> that is included in EMAC, we need to share this MDIO controller for
>> others EMAC.
> If you want to describe the MDIO controller, then you embed a mdio
> subnode into your Ethernet MAC node:
>
>  emac0: ethernet@feb20000 {
> 	mdio {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
>
> 		phy0: ethernet-phy@0 {
> 			reg = <0>;
> 		};
> 	};
> };
>
> And then each Ethernet MAC controller refers to their appropriate PHY
> device tree node using a phy-handle property to point to either their
> own MDIO controller, or another MAC's MDIO controller.
Sorry, I do not understand how phy-handle point to MDIO controller,
because phy-handle is defined to point to a phy.
I suppose you mean:
mdio_node = of_get_parent(phy_node);

emac0: ethernet@feb20000 {
    phy-handle = <&phy0>;

    mdio {
        #address-cells = <1>;
        #size-cells = <0>;

        phy0: ethernet-phy@0 {
            reg = <0>;
        };

        phy1: ethernet-phy@1 {
            reg = <1>;
        };
    };
};

emac1: ethernet@fexxxxxx {
    phy-handle = <&phy1>;
};

emac2: ethernet@fexxxxxx {
    phy-handle = <&phy2>;
    mdio {
        #address-cells = <1>;
        #size-cells = <0>;

        phy2: ethernet-phy@2 {
            reg = <0>;
        };
    };
};

> The IBM Emac is a old (not to say bad) example and it does not use the
> PHY library and the standard Device Tree node property, please don't use
> it as a reference.
Ok, thanks.

Cheers,
Dongsheng
