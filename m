From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH] clk: qcom: rpmcc: Add support to XO buffered clocks
Date: Thu, 15 Mar 2018 16:24:52 +0000
Message-ID: <f2757455-c825-01d6-cf53-8b2504b9b2f8@linaro.org>
References: <20180315143724.13859-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315143724.13859-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: david.brown@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org



On 15/03/18 14:37, srinivas.kandagatla@linaro.org wrote:
>   
>   struct clk_rpm {
>   	const int rpm_clk_id;
> +	const int xo_offset;
> +	u32 xo_buffer_value;
>   	const bool active_only;
Just realized that this would not work when more than one xo are active, 
I will have a closer look and send an new version.

thanks,
srini
