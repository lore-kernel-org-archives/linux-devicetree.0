From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 06/15] drivers: clk: st: STiH407: Support for Flexgen Clocks
Date: Mon, 28 Jul 2014 22:31:49 -0700
Message-ID: <20140729053149.4906.84119@quantum>
References: <1405437631-23623-1-git-send-email-gabriel.fernandez@linaro.org>
 <1405437631-23623-7-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1405437631-23623-7-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Olivier Bideau <olivier.bideau@st.com>
List-Id: devicetree@vger.kernel.org

Quoting Gabriel FERNANDEZ (2014-07-15 08:20:22)
> +static const char ** __init flexgen_get_parents(struct device_node *np,
> +                                                      int *num_parents)
> +{
> +       const char **parents;
> +       int nparents, i;
> +
> +       nparents = of_count_phandle_with_args(np, "clocks", "#clock-cells");

FYI, of_clk_get_parent_count provides a nice wrapper around this. Maybe
you can update it some day? Not a blocking issue for this series.

Regards,
Mike
