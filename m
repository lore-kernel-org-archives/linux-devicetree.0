From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv4 0/7] interconnect: Add imx support via devfreq
Date: Mon, 30 Sep 2019 12:31:22 +0000
Message-ID: <VI1PR04MB70230CC67539BC41E08F4956EE820@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
 <VI1PR04MB702373BE28E4404C7F2CE75FEE8C0@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <02d3fe6a-53a6-3290-deab-d79e940978ff@linaro.org>
 <VI1PR04MB7023ADED2210DFCB81E588CFEE870@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <a1f04769-9547-58e6-2bd0-5b6a5864fbf0@linaro.org>
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
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Saravana Kannan <saravanak@google.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 2019-09-26 3:52 AM, Georgi Djakov wrote:
> On 9/25/19 15:52, Leonard Crestez wrote:
>> On 25.09.2019 05:38, Georgi Djakov wrote:
>>> Hi Leonard,
>>>
>>> On 9/16/19 05:34, Leonard Crestez wrote:
>>>> On 23.08.2019 17:37, Leonard Crestez wrote:
>>>>> This series add imx support for interconnect via devfreq: the ICC
>>>>> framework is used to aggregate requests from devices and then those are
>>>>> converted to DEV_PM_QOS_MIN_FREQUENCY requests for devfreq.
>>>>>    
>>>>> Since there is no single devicetree node that can represent the "interconnect"
>>>>> new API is added to allow individual devfreq nodes to act as parsing proxies
>>>>> all mapping to a single soc-level icc provider. This is still RFC
>>>>> because of this
>>>>
>>>> Any comments? I made a lot of changes relative to previous versions,
>>>> most of them solely to avoid adding a virtual node in DT bindings.
>>>>
>>>> The only current interconnect provider implementation is for qcom and it
>>>> uses a firmware node as the provider node (with #interconnect-cells).
>>>> However there is no obvious equivalent of that for imx and many other SOCs.
>>>
>>> Not sure if it will help, but have you seen the qcs404 interconnect driver?
>>> There is also mt8183 interconnect provider driver on LKML.
>>
>> Yes, but only yesterday. The qcs404 driver involves multiple DT devices
>> so it seems closer to imx.
>>
>> As far as I understand from reading qcs404 source:
>>
>> * There is no struct device representing the entire graph.
>> * There are multiple NOCs and each registers itself as a separate
>> interconnect provider.
>> * Each NOC registers multiple icc_nodes of various sorts:
>>     * Device masters and slaves
>>     * Some nodes representing NoC ports?
> 
> Well, all nodes are representing ports.
> 
>>     * Multiple internal nodes
>> * There is single per-SOC master list of QNOCs in the qcs404 driver.
>> * The QNOCs can reference each other between multiple providers.
>> * Each NOC registers an icc_provider and a subset of the graph.
>> * The multiple NoC inside a chip are distinguished by compat strings.
>> This seems strange, aren't they really different instantiations of the
>> same IP with small config changes?
> 
> No, they are different IPs - ahb, axi or custom based.

On IMX some of the buses are just different instantiations.

Would it make sense to standardize an "interconnect-node-id" to identify 
middle nodes? For example if you have nearly identical "audio" "display" 
"vpu" NICs then this property would make it possible to map from a DT 
done to an ICC graph node.

>> This design is still quite odd, what would make sense to me is to
>> register the "interconnect graph" once and then provide multiple
>> "interconnect scalers" which handle the aggregated requests for certain
>> specific nodes.
>>
>>>> On imx there are multiple pieces of scalable fabric which can be defined
>>>> in DT as devfreq devices and it sort of makes sense to add
>>>> #interconnect-cells to those. However when it comes to describing the
>>>> SOC interconnect graph it's much more convenient to have a single
>>>> per-SOC platform driver.
>>>
>>> Is all the NoC configuration done only by ATF? Are there any NoC related memory
>>> mapped registers?
>>
>> Registers are memory-mapped and visible to the A-cores but should only
>> be accessed through secure transactions. This means that configuration
>> needs be done by ATF in EL3 (we don't support running linux in secure
>> world on imx8m). There is no "remote processor" managing this on imx8m.
> 
> Can we create some noc DT node with it's memory mapped address and make
> it an interconnect provider? Sounds to me like a more correct representation
> of the hardware?

This is what I did, it's just that the initial binding is in this series:
https://patchwork.kernel.org/cover/11104113/
https://patchwork.kernel.org/patch/11104137/
https://patchwork.kernel.org/patch/11104141/

The nodes are scaled via devfreq and interconnect comes "on top" to make 
device bandwidth requests.

I think using devfreq is valuable for example:
  * DDRC can support reactive scaling based on performance counters
  * The NOC can run at different voltages so it should have it's own OPP 
table.

> Other option would be to bless some PSCI DT node (for example) to be a
> provider.

I don't think this can be a good fit, I want to support different 
interconnect nodes with different underlying interfaces on the same SOC.

There is no abstraction layer in firmware so abstractions for different 
interconnect midnodes should be in linux instead.

>> On older imx6/7 chips we actually have two out-of-tree implementations
>> of bus freq switching code: An older one in Linux (used when running in
>> secure world) and a different one in optee for running Linux in
>> non-secure world.
>>
>> NoC registers can be used to control some "transaction priority" bits
>> but I don't want to expose that part right now.
> 
> This is very similar to some of the Qcom hardware.

NoC IP is licensed from Arteris which was bought-out by Qcom. 
Documentation is not public though and there are likely many differences 
versus what Qcom has in their own chips.
>> What determines bandwidth versus power consumption is the NoC clk rate
>> and clocks are managed by Linux directly.
> 
> So you will need to describe these clocks in the interconnect provider
> DT node like on qcs404.

I already implemented the nodes as devfreq provider and DDRC even 
includes ondemand reactive scaling support:

https://patchwork.kernel.org/patch/11104139/
https://patchwork.kernel.org/patch/11104145/
https://patchwork.kernel.org/patch/11104143/

I could just pick the "main" NOC and turn than into the "only" 
interconnect provider. Something like this:

if (has_property(noc_device, "#interconnect-cells")) {
     register_soc_icc_driver(noc_device);
}

This would get rid of the icc_proxy stuff but fetching references to 
other scalable nodes would require some other way to identify them.

--
Regards,
Leonard
