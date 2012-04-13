From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 2/4] pinctrl: Add SPEAr pinctrl drivers
Date: Fri, 13 Apr 2012 10:08:39 -0600
Message-ID: <4F884F87.8000205@wwwdotorg.org>
References: <cover.1334207964.git.viresh.kumar@st.com>
 <3d7a76d17b4366e08b45d528a245147095bbcb10.1334207964.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3d7a76d17b4366e08b45d528a245147095bbcb10.1334207964.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: devicetree-discuss@ozlabs.org, arnd@arndb.de, linus.walleij@linaro.org, spear-devel@list.st.com, viresh.linux@gmail.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/11/2012 11:24 PM, Viresh Kumar wrote:
> This adds pinctrl driver for SPEAr platform. It also updates MAINTAINERS file
> for SPEAr pinctrl drivers.

> +int __devinit spear_pinctrl_probe(struct platform_device *pdev,
> +		struct spear_pinctrl_machdata *machdata)
...
> +	pmx->vbase = of_iomap(np, 0);
...
> +}
> +
> +int __devexit spear_pinctrl_remove(struct platform_device *pdev)
> +{
> +	struct spear_pmx *pmx = platform_get_drvdata(pdev);
> +
> +	pinctrl_unregister(pmx->pctl);
> +
> +	return 0;
> +}

of_iomap isn't a devm function, so youo need to unmap in remove(), and
in probe()'s error paths.

Or of course, you could just implement devm_of_iomap(); it's probably
very simple to do.
