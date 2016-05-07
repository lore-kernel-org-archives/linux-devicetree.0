From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 4/4] mfd: arizona: Add device tree binding
 documentation for new clock driver
Date: Fri, 6 May 2016 17:47:40 -0700
Message-ID: <572D3B2C.8000304@codeaurora.org>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452252582-20834-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 01/08/2016 03:29 AM, Charles Keepax wrote:
> Specify the device tree binding for the input clocks to Arizona devices.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> No changes since v2.
>
> Thanks,
> Charles
>
>  Documentation/devicetree/bindings/mfd/arizona.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index 18be0cb..39f76f8 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -45,6 +45,13 @@ Optional properties:
>  
>    - wlf,reset : GPIO specifier for the GPIO controlling /RESET
>  
> +  - clocks: Should reference the clocks supplied on MCLK1 and MCLK2
> +  - clock-names: Should contains two strings:

Can't this be clock-output-names instead? That's standard and already
accepted per clock-bindings.txt

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

