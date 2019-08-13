From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/4] dt-bingings: PCI: Remove the num-lanes from Required
 properties
Date: Tue, 13 Aug 2019 10:05:42 +0530
Message-ID: <286ea8d2-5467-6cc2-07cb-7707db13ad1a@ti.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
 <20190812042435.25102-2-Zhiqiang.Hou@nxp.com>
 <20190812084517.GW56241@e119886-lin.cambridge.arm.com>
 <DB8PR04MB67476309D3F7E30FE35C47DF84D20@DB8PR04MB6747.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB8PR04MB67476309D3F7E30FE35C47DF84D20@DB8PR04MB6747.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, Andrew Murray <andrew.murray@arm.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Gabriele Paoloni <gabriele.paoloni@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 13/08/19 8:37 AM, Z.q. Hou wrote:
> Hi Andrew,
> 
> Thanks a lot for your comments!
> 
>> -----Original Message-----
>> From: Andrew Murray <andrew.murray@arm.com>
>> Sent: 2019Äê8ÔÂ12ÈÕ 16:45
>> To: Z.q. Hou <zhiqiang.hou@nxp.com>
>> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; gustavo.pimentel@synopsys.com;
>> jingoohan1@gmail.com; bhelgaas@google.com; robh+dt@kernel.org;
>> mark.rutland@arm.com; shawnguo@kernel.org; Leo Li
>> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.com; M.h. Lian
>> <minghuan.lian@nxp.com>; Kishon Vijay Abraham I <kishon@ti.com>;
>> Gabriele Paoloni <gabriele.paoloni@huawei.com>
>> Subject: Re: [PATCH 1/4] dt-bingings: PCI: Remove the num-lanes from
>> Required properties
>>
>> On Mon, Aug 12, 2019 at 04:22:16AM +0000, Z.q. Hou wrote:
>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>
>>> The num-lanes is not a mandatory property, e.g. on FSL Layerscape
>>> SoCs, the PCIe link training is completed automatically base on the
>>> selected SerDes protocol, it doesn't need the num-lanes to set-up the
>>> link width.
>>>
>>> It has been added in the Optional properties. This patch is to remove
>>> it from the Required properties.
>>
>> For clarity, maybe this paragraph can be reworded to:
>>
>> "It is previously in both Required and Optional properties,  let's remove it
>> from the Required properties".
> 
> Agree and will change in v2.
> 
>>
>> I don't understand why this property is previously in both required and
>> optional...
>>
>> It looks like num-lanes was first made optional back in
>> 2015 and removed from the Required section (907fce090253).
>> But then re-added back into the Required section in 2017 with the adition of
>> bindings for EP mode (b12befecd7de).
>>
>> Is num-lanes actually required for EP mode?
> 
> Kishon, please help to answer this query?

It should be optional for EP too.

Thanks
Kishon
