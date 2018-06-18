From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] clk: qcom: Add lpass clock controller
 driver for SDM845
Date: Mon, 18 Jun 2018 17:40:11 +0300
Message-ID: <20180618144011.v5uwk4lkiuynggl3@mwanda>
References: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: Taniya Das <tdas@codeaurora.org>, robh@kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Amit Nischal <anischal@codeaurora.org>, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rohit Kumar <rohitkr@codeaurora.org>, kbuild-all@01.org, Andy Gross <andy.gross@linaro.org>, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Taniya,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Taniya-Das/Add-support-for-LPASS-clock-controller-for-SDM845/20180614-155144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next

smatch warnings:
drivers/clk/qcom/lpasscc-sdm845.c:197 lpass_clocks_sdm845_probe() warn: passing zero to 'PTR_ERR'

# https://github.com/0day-ci/linux/commit/035d2520712de752be68d10a37650b65b6aee154
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 035d2520712de752be68d10a37650b65b6aee154
vim +/PTR_ERR +197 drivers/clk/qcom/lpasscc-sdm845.c

035d2520 Taniya Das 2018-06-14  179  
035d2520 Taniya Das 2018-06-14  180  static int lpass_clocks_sdm845_probe(struct platform_device *pdev,
035d2520 Taniya Das 2018-06-14  181  				     struct device_node *np,
035d2520 Taniya Das 2018-06-14  182  				     const struct qcom_cc_desc *desc)
035d2520 Taniya Das 2018-06-14  183  {
035d2520 Taniya Das 2018-06-14  184  	struct regmap *regmap;
035d2520 Taniya Das 2018-06-14  185  	struct resource res;
035d2520 Taniya Das 2018-06-14  186  	void __iomem *base;
035d2520 Taniya Das 2018-06-14  187  
035d2520 Taniya Das 2018-06-14  188  	if (of_address_to_resource(np, 0, &res))
035d2520 Taniya Das 2018-06-14  189  		return -ENOMEM;
035d2520 Taniya Das 2018-06-14  190  
035d2520 Taniya Das 2018-06-14  191  	base = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
035d2520 Taniya Das 2018-06-14  192  	if (IS_ERR(base))
035d2520 Taniya Das 2018-06-14  193  		return -ENOMEM;
035d2520 Taniya Das 2018-06-14  194  
035d2520 Taniya Das 2018-06-14  195  	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
035d2520 Taniya Das 2018-06-14  196  	if (!regmap)
035d2520 Taniya Das 2018-06-14 @197  		return PTR_ERR(regmap);
                                                       ^^^^^^^^^^^^^^^
035d2520 Taniya Das 2018-06-14  198  
035d2520 Taniya Das 2018-06-14  199  	return qcom_cc_really_probe(pdev, desc, regmap);
035d2520 Taniya Das 2018-06-14  200  }
035d2520 Taniya Das 2018-06-14  201  
