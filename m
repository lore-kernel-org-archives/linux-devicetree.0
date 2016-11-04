From: Bastian =?ISO-8859-1?Q?K=F6cher?= <mail@kchr.de>
Subject: Re: [PATCH 3/6] msm8994 clocks: global clock support for msm8994 SOC.
Date: Fri, 04 Nov 2016 10:12:25 +0100
Message-ID: <25490396.6WRoEgapGl@bastiultrabook>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com> <20161103224234.GB30414@remoulade> <20161103234351.GA15102@mini-rhel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161103234351.GA15102@mini-rhel.redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On Donnerstag, 3. November 2016 16:43:52 CET Jeremy McNicoll wrote:
> On Thu, Nov 03, 2016 at 10:42:34PM +0000, Mark Rutland wrote:
> > On Tue, Oct 25, 2016 at 04:16:58AM -0700, Jeremy McNicoll wrote:
> > > +static const struct qcom_cc_desc gcc_msm8994_desc = {
> > > +	.config = &gcc_msm8994_regmap_config,
> > > +	.clks = gcc_msm8994_clocks,
> > > +	.num_clks = ARRAY_SIZE(gcc_msm8994_clocks),
> > > +	.resets = NULL,
> > > +	.num_resets = 0,
> > > +	.gdscs = NULL,
> > > +	.num_gdscs = 0,
> > > +};
> > > +
> > > +static const struct of_device_id gcc_msm8994_match_table[] = {
> > > +	{ .compatible = "qcom,gcc-8994" },
> > > +	{ .compatible = "qcom,gcc-8994v2" },
> > > +	{}
> > > +}
> > > +
> > > +MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
> > > +
> > > +static int gcc_msm8994_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct clk *clk;
> > > +	const char *compat = NULL;
> > > +	int compatlen = 0;
> > > +	bool is_v2 = false;
> > > +
> > > +	clk = devm_clk_register(dev, &xo.hw);
> > > +	if (IS_ERR(clk))
> > > +		return PTR_ERR(clk);
> > > +
> > > +	compat = of_get_property(pdev->dev.of_node, "compatible", &compatlen);
> > > +	if (!compat || (compatlen <= 0))
> > > +		return -EINVAL;
> > 
> > It is almost never correct to use of_get_property(). Please avoid it.
> >
> 
> Hi Bastian, 
> 
> Mark is basically suggesting that instead of using of_get_property() you
> should be using  something like of_device_compatible_match, or 
> of_device_is_compatible.   This should simplify the code a little bit
> too. 
> 
> Unless I am misunderstanding Mark's comment.
> 
> -jeremy

We do not need that anymore, because that was required for the "v2" check. 

Bastian

> 
> 
> > > +
> > > +	is_v2 = !strcmp(compat, "qcom,gcc-8994v2");
> > > +	if (is_v2)
> > > +		msm_gcc_8994v2_fixup();
> > 
> > Either put some data in the of_device_id tables, and use that to determine what
> > to do here, or use of_device_is_compatible() or of_match_node() to check the
> > string.
> > 
> > Thanks,
> > Mark.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
