From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V6 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Date: Thu, 14 Feb 2019 16:05:26 +0530
Message-ID: <20190214103526.ly5gvkgg3s32t33k@vireshk-i7>
References: <1550137826-18531-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1550137826-18531-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 14-02-19, 09:55, Anson Huang wrote:
> Add i.MX8QXP CPU opp table to support cpufreq.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V5:
> 	- add clocks for all secondary CPUs too.
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
