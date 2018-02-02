From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 19/41] clk: davinci: New driver for TI DA8XX USB PHY
 clocks
Date: Fri, 2 Feb 2018 19:29:58 +0530
Message-ID: <abb566ad-e5fd-a09c-e8b7-695ca7c126fa@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-20-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-20-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
> diff --git a/include/linux/clk/davinci.h b/include/linux/clk/davinci.h
> index 54ea3ff..04b48b3 100644
> --- a/include/linux/clk/davinci.h
> +++ b/include/linux/clk/davinci.h
> @@ -9,6 +9,9 @@
>  
>  #include <linux/types.h>
>  
> +struct clk;
> +struct regmap;

Its probably better to include clk-provider.h and regmap.h?

Thanks,
Sekhar
