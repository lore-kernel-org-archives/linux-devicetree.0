From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv4 0/7] interconnect: Add imx support via devfreq
Date: Mon, 23 Sep 2019 21:22:45 +0000
Message-ID: <VI1PR04MB7023C5382635F6959EAF9330EE850@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
 <4440b392-d968-4a54-2ea0-ffd5beba02d1@posteo.de>
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
To: Martin Kepplinger <martink@posteo.de>, Jacky Bai <ping.bai@nxp.com>, Anson Huang <anson.huang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Peng Fan <peng.fan@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Sha
List-Id: devicetree@vger.kernel.org

On 21.09.2019 09:07, Martin Kepplinger wrote:
> On 23.08.19 16:36, Leonard Crestez wrote:
>> This series add imx support for interconnect via devfreq: the ICC
>> framework is used to aggregate requests from devices and then those are
>> converted to DEV_PM_QOS_MIN_FREQUENCY requests for devfreq.
>>
>> The devfreq parts are posted separately, this series only intersects in
>> devicetree.
>>
>> Since there is no single devicetree node that can represent the "interconnect"
>> new API is added to allow individual devfreq nodes to act as parsing proxies
>> all mapping to a single soc-level icc provider. This is still RFC
>> because this
>>
>> The rest of the changes are small and deal with review comments.

> on imx8mq, probe() fails:
> 
> [    1.082847] imx-ddrc-devfreq 3d400000.dram-controller: failed to init
> firmware freq info: -19
> [    1.091434] imx-ddrc-devfreq: probe of 3d400000.dram-controller
> rejects match -19
> 
> in imx_ddrc_init_freq_info()'s check:
> 
> if (priv->freq_count <= 0 || priv->freq_count > IMX_DDRC_MAX_FREQ_COUNT)
> 
> That would indicate that I'm missing something in ATF? I'm pretty sure
> I'm running your tree though.

What is your board and uboot version? I tested on imx8mq-evk (SOC Rev 
B1) with NXP uboot. For example this uboot release works:

https://source.codeaurora.org/external/imx/uboot-imx/log/?h=imx_v2019.04_4.19.35_1.0.0

It is uboot which trains DDR for multiple frequencies and then passes 
that info to ATF. I'm not sure about the steps required to enable this 
for 3rd-party boards, should be same as for busfreq from NXP tree.

Getting this to work on a 3rd-party board would be interesting.

> Does anything come to your mind what I might be doing wrong? Am I
> running your "correct" linux tree? Remember I'm on imx8mq, so I don't
> exactly test this RFC of yours.
> 
> Also, how are your plans to rebase / update your ATF tree?

The ATF changes will show up in a future release of NXP ATF branch, when 
that happens I will drop my branch. NXP ATF releases are on CAF:

     https://source.codeaurora.org/external/imx/imx-atf/

> And since there's a lot in there: what additions are necessary for this
> devfreq to work?

devfreq imx support here: https://patchwork.kernel.org/cover/11104113/
Interconnect support also needs PM QoS support for devfreq:

     https://patchwork.kernel.org/cover/11157649/

> Lastly, how do you test? Is /sys/class/devfreq supposted to get populated?

Yes, and only the devfreq patches are required for that.

# cat /sys/class/devfreq/devfreq0/available_frequencies
25000000 100000000 800000000
# cat /sys/class/devfreq/devfreq0/cur_freq
800000000

You should be able to control frequencies manually with the userspace 
governor:
# echo "userspace" > /sys/class/devfreq/devfreq0/governor
# echo "25000000" > /sys/class/devfreq/devfreq0/userspace/set_freq

This series allows devices to request guaranteed bandwidth for 
themselves through the interconnect subsystem, without it DRAM freq will 
still switch but you'll have problems like display corruption as it 
turns on before freq goes up. You can check that probe worked by doing

# cat /sys/kernel/debug/interconnect/interconnect_summary

--
Regards,
Leonard
