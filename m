From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 1/4] drivers/perf: imx_ddr: Add ddr performance counter
 support
Date: Wed, 13 Feb 2019 00:03:18 -0200
Message-ID: <CAOMZO5Ad-T5tB=n6AhMG-f3Lp36gqHBVDs+NZiqWvL4VdVgEQw@mail.gmail.com>
References: <1550005119-25750-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550005119-25750-1-git-send-email-Frank.Li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Li <frank.li@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 6:58 PM Frank Li <frank.li@nxp.com> wrote:

> +static int ddr_perf_remove(struct platform_device *pdev)
> +{
> +       struct ddr_pmu *pmu = platform_get_drvdata(pdev);
> +
> +       cpuhp_state_remove_instance_nocalls(pmu->cpuhp_state, &pmu->node);
> +       perf_pmu_unregister(&pmu->pmu);
> +       kfree(pmu);

Since you allocated pmu via devm_kzalloc(), there is no need to call
kfree() here.
