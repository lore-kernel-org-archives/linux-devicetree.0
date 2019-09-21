From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [RFCv4 0/7] interconnect: Add imx support via devfreq
Date: Sat, 21 Sep 2019 08:06:57 +0200
Message-ID: <4440b392-d968-4a54-2ea0-ffd5beba02d1@posteo.de>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
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
To: Leonard Crestez <leonard.crestez@nxp.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 23.08.19 16:36, Leonard Crestez wrote:
> This series add imx support for interconnect via devfreq: the ICC
> framework is used to aggregate requests from devices and then those are
> converted to DEV_PM_QOS_MIN_FREQUENCY requests for devfreq.
> 
> The devfreq parts are posted separately, this series only intersects in
> devicetree: https://patchwork.kernel.org/cover/11104113/
> 
> Since there is no single devicetree node that can represent the "interconnect"
> new API is added to allow individual devfreq nodes to act as parsing proxies
> all mapping to a single soc-level icc provider. This is still RFC
> because this
> 
> The rest of the changes are small and deal with review comments.
> 

hi Leonard,

When I run https://github.com/cdleonard/linux/tree/next_imx_busfreq and
https://github.com/cdleonard/arm-trusted-firmware/tree/imx_2.0.y_busfreq
on imx8mq, probe() fails:

[    1.082847] imx-ddrc-devfreq 3d400000.dram-controller: failed to init
firmware freq info: -19
[    1.091434] imx-ddrc-devfreq: probe of 3d400000.dram-controller
rejects match -19

in imx_ddrc_init_freq_info()'s check:

if (priv->freq_count <= 0 || priv->freq_count > IMX_DDRC_MAX_FREQ_COUNT)

That would indicate that I'm missing something in ATF? I'm pretty sure
I'm running your tree though.

Does anything come to your mind what I might be doing wrong? Am I
running your "correct" linux tree? Remember I'm on imx8mq, so I don't
exactly test this RFC of yours.

Also, how are your plans to rebase / update your ATF tree?

And since there's a lot in there: what additions are necessary for this
devfreq to work?

Lastly, how do you test? Is /sys/class/devfreq supposted to get populated?

thanks for your work!

                                    martin
