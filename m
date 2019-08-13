From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 2/7] dt-bindings: devfreq: Add bindings for generic imx
 buses
Date: Tue, 13 Aug 2019 14:59:56 +0000
Message-ID: <VI1PR04MB70237460E84C4F8AC9EBE582EED20@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1565633880.git.leonard.crestez@nxp.com>
 <97b0bff95ddb85b06ef3d2f8079faa36562a956d.1565633880.git.leonard.crestez@nxp.com>
 <CAL_JsqJWpQN2oTm8Q2_Gzd0GJ+YZoc9j-zh-U1s4eGhMxDEmEA@mail.gmail.com>
 <VI1PR04MB702300C8C78BC033D16EDB85EED20@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <CAL_Jsq+BDO-J12BddWw-KbhjTx95p58qqpUhhKzUHED6vFK2TA@mail.gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open
 list:THERMAL" <linux-pm@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn
List-Id: devicetree@vger.kernel.org

On 13.08.2019 17:06, Rob Herring wrote:
> On Mon, Aug 12, 2019 at 7:32 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>> On 8/12/2019 10:47 PM, Rob Herring wrote:
>>> On Mon, Aug 12, 2019 at 12:49 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

>>>> Add initial dt bindings for the interconnects inside i.MX chips.
>>>> Multiple external IPs are involved but SOC integration means the
>>>> software controllable interfaces are very similar.
>>>>
>>>> +description: |
>>>> +  The i.MX SoC family has multiple buses for which clock frequency (and sometimes
>>>> +  voltage) can be adjusted.
>>>> +
>>>> +  Some of those buses expose register areas mentioned in the memory maps as GPV
>>>> +  ("Global Programmers View") but not all. Access to this area might be denied for
>>>> +  normal world.
>>>> +
>>>> +  The buses are based on externally licensed IPs such as ARM NIC-301 and Arteris
>>>> +  FlexNOC but DT bindings are specific to the integration of these bus
>>>> +  interconnect IPs into imx SOCs.
>>>
>>> No need to use the interconnect binding?
>>
>> The interconnect is represented by a separate "virtual" node which might
>> not be OK. There was also a recent RFC from samsung which turns devfreq
>> nodes into interconnect providers:
>>
>> Is that preferable?
> 
> Virtual nodes are not OK.

Then I'll try to make the "interconnect" device probe from a soc driver 
and turn devfreq nodes into interconnect providers backed by this same 
singleton device.

Still separate from this series.

>>>> +required:
>>>> +  - compatible
>>>> +  - clocks
>>>
>>> reg?
>>
>> This is deliberately optional: for some NICs the GPV register area is
>> not exposed in the memory map. This is unusual but an accurate
>> description of the hardware.
> 
> Different h/w blocks should have different compatibles. GPV is an Arm
> thing and I'd expect FlexNOC to be different.

The imx reference manuals call them both "GPV" though layout is indeed 
quite different (and for FlexNoC it's not even documented).

The h/w blocks do have different compat strings (imx8m-nic and 
imx8m-noc). They have a single binding document because didn't want to 
create two nearly-identical bindings, I assume it would be fine to split 
later if needed.

--
Regards,
Leonard
