From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8064: Add missing scm clock
Date: Mon, 2 Jan 2017 10:42:12 -0600
Message-ID: <20170102164212.GD17770@hector.attlocal.net>
References: <20161229120611.7948-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161229120611.7948-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 29, 2016 at 04:06:11AM -0800, Bjorn Andersson wrote:
> As per the device tree binding the apq8064 scm node requires the core
> clock to be specified, so add this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks.  This works quite nicely.  I'll send a fixes pull for this.

Andy
