From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv4 0/7] interconnect: Add imx support via devfreq
Date: Mon, 16 Sep 2019 12:34:45 +0000
Message-ID: <VI1PR04MB702373BE28E4404C7F2CE75FEE8C0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
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
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Saravana Kannan <saravanak@google.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 23.08.2019 17:37, Leonard Crestez wrote:
> This series add imx support for interconnect via devfreq: the ICC
> framework is used to aggregate requests from devices and then those are
> converted to DEV_PM_QOS_MIN_FREQUENCY requests for devfreq.
>  
> Since there is no single devicetree node that can represent the "interconnect"
> new API is added to allow individual devfreq nodes to act as parsing proxies
> all mapping to a single soc-level icc provider. This is still RFC
> because of this

Any comments? I made a lot of changes relative to previous versions, 
most of them solely to avoid adding a virtual node in DT bindings.

The only current interconnect provider implementation is for qcom and it 
uses a firmware node as the provider node (with #interconnect-cells). 
However there is no obvious equivalent of that for imx and many other SOCs.

On imx there are multiple pieces of scalable fabric which can be defined 
in DT as devfreq devices and it sort of makes sense to add 
#interconnect-cells to those. However when it comes to describing the 
SOC interconnect graph it's much more convenient to have a single 
per-SOC platform driver.

My solution is to add an "icc_proxy" API so that a single platform-level 
interconnect provider can be referenced through multiple DT nodes. Does 
this make sense?

The implementation is not very pretty, the interconnect platform devices 
ends up enumerating the entire devicetree in order to find proxies.

Right now the interconnect API use a relatively standard split between 
consumer and "provider" but I think it might make sense to have a 
separate abstractions for "graph" and "midnode". A "midnode" could act 
as a DT proxy if there is no single representation of the "interconnect" 
and it could support custom scaling for itself (with the default being 
scaling kbps into MIN_FREQ).

There are also other options:
  * Pick one "main" bus and bless it as the "interconnect provider". I 
want to represent buses as devfreq devices so I would have to call from 
devfreq to ICC for registration somehow.
  * Maybe the "no virtual device" rule could be relaxed for the 
interconnect subsystem?

--
Regards,
Leonard
