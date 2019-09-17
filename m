From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v2 1/7] clk: imx8m: Set CLK_GET_RATE_NOCACHE on
 dram_alt/apb
Date: Tue, 17 Sep 2019 16:59:07 +0000
Message-ID: <VI1PR04MB7023D4F1F3D02E1C7773A3D1EE8F0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566315740.git.leonard.crestez@nxp.com>
 <90bfeebcb76e76d286ed7f022ea9e0d9a569ebe2.1566315740.git.leonard.crestez@nxp.com>
 <20190916203312.CF8D02067B@mail.kernel.org>
 <VI1PR04MB70239F26BE42AD5E6FC3639DEE8C0@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20190917163215.A838020665@mail.kernel.org>
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
To: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On 2019-09-17 7:32 PM, Stephen Boyd wrote:
> Quoting Leonard Crestez (2019-09-16 16:03:53)
>> On 2019-09-16 11:33 PM, Stephen Boyd wrote:
>>> Quoting Leonard Crestez (2019-08-20 08:45:06)
>>>> Dram frequency changes required modifying these clocks outside the
>>>> control of clk framework. Mark them as CLK_GET_RATE_NOCACHE so that
>>>> rates are always read back from registers.
>>>
>>> Why can't we control the clks from the clk framework? Please add that
>>> information in the commit text here.
>>
>> OK, I will update commit message and comments
>>
>> These clocks are only modified for DRAM frequency switches during which
>> DRAM is briefly inaccessible. The switch is performed with a SMC call to
>> by TF-A which runs from a SRAM area. Upon returning to linux several
>> clocks bits are modified and we need to update them.
>>
>> For rate bits an easy solution is to just mark with
>> CLK_GET_RATE_NOCACHE, muxes are handled explicitly.
> 
> Is there any reason to expose or control these clks from Linux then? It
> might be easier to just make any children clks of the DRAM frequency clk
> "root" clks and then ignore any frequency that they might have.
> Similarly, because the SMC call is used to change the frequency, it may
> be simpler to handle that completely outside of the clk framework (it
> may already be this way in this patch series but I haven't read
> everything here).

The dram alt/apb clocks are real imx8m composite clocks with the same HW 
implementation as used for peripherals. They also have mux parents which 
are under the control of the clock framework so the freq switching code 
takes care to properly enable the new parents before calling SMC.

See imx_ddrc_set_freq: https://patchwork.kernel.org/patch/11104145/

Removing dram alt/apb clocks from the tree would still require keeping 
possible parents enabled somehow. It wouldn't be simpler but a lot uglier.

--
Regards,
Leonard
