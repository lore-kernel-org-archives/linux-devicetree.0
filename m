From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 2/7] dt-bindings: devfreq: Add bindings for generic imx
 buses
Date: Tue, 13 Aug 2019 01:32:36 +0000
Message-ID: <VI1PR04MB702300C8C78BC033D16EDB85EED20@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1565633880.git.leonard.crestez@nxp.com>
 <97b0bff95ddb85b06ef3d2f8079faa36562a956d.1565633880.git.leonard.crestez@nxp.com>
 <CAL_JsqJWpQN2oTm8Q2_Gzd0GJ+YZoc9j-zh-U1s4eGhMxDEmEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open
 list:THERMAL" <linux-pm@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>Sascha Hauer <ke>
List-Id: devicetree@vger.kernel.org

On 8/12/2019 10:47 PM, Rob Herring wrote:
> On Mon, Aug 12, 2019 at 12:49 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

>> Add initial dt bindings for the interconnects inside i.MX chips.
>> Multiple external IPs are involved but SOC integration means the
>> software controllable interfaces are very similar.
>>
>> +description: |
>> +  The i.MX SoC family has multiple buses for which clock frequency (and sometimes
>> +  voltage) can be adjusted.
>> +
>> +  Some of those buses expose register areas mentioned in the memory maps as GPV
>> +  ("Global Programmers View") but not all. Access to this area might be denied for
>> +  normal world.
>> +
>> +  The buses are based on externally licensed IPs such as ARM NIC-301 and Arteris
>> +  FlexNOC but DT bindings are specific to the integration of these bus
>> +  interconnect IPs into imx SOCs.
> 
> No need to use the interconnect binding?

Separate RFC: https://patchwork.kernel.org/patch/11078673/

The interconnect is represented by a separate "virtual" node which might 
not be OK. There was also a recent RFC from samsung which turns devfreq 
nodes into interconnect providers:
     https://patchwork.kernel.org/cover/11054417/

Is that preferable?

>> +required:
>> +  - compatible
>> +  - clocks
> 
> reg?

This is deliberately optional: for some NICs the GPV register area is 
not exposed in the memory map. This is unusual but an accurate 
description of the hardware.

The current driver doesn't even attempt to map registers, it only 
adjusts the clock.

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mm-clock.h>
>> +    noc: noc@32700000 {
>> +            compatible = "fsl,imx8mm-noc", "fsl,imx8m-noc";
> 
> Doesn't match the schema. (Well, it does with 'contains', but
> fsl,imx8mm-noc is not documented.)

I'm confused about how per-SOC compatible strings works with validation. 
There is a rule that every SOC dtsi needs to add soc prefix to all 
device nodes but of_device_id in driver code doesn't need to be updated.

Without using "contains" on the "compatible" property then all 
SOC-specific compatible strings would need to be mentioned in every yaml 
files. Unless I'm missing something this means updating update every 
binding file for each new SOC?

I guess it can be useful because it also validates the compatible 
sequence itself.

For this current example something like this seems to work:

   compatible:
     oneOf:
       - items:
         - enum:
           - fsl,imx8mm-nic
           - fsl,imx8mq-nic
         - const: fsl,imx8m-nic
       - items:
         - enum:
           - fsl,imx8mm-noc
           - fsl,imx8mq-noc
         - const: fsl,imx8m-noc

--
Regards,
Leonard
