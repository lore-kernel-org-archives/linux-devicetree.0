From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Fri, 26 Jan 2018 16:30:32 +0200
Message-ID: <0c933015-158f-e4fc-a37c-195f7cbc8fad@linaro.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171205154701.27730-1-georgi.djakov@linaro.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: sboyd@codeaurora.org, bjorn.andersson@linaro.org, mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/05/2017 05:46 PM, Georgi Djakov wrote:
> This patchset adds support for the A53 CPU clock on MSM8916 platforms
> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Changes since v10 (https://lkml.org/lkml/2017/12/1/577)
> * Addressed Bjorn's comments on APCS clock driver.
> * Picked Acks from Rob and Bjorn.
> 
[..]
> 
> Georgi Djakov (6):
>   mailbox: qcom: Convert APCS IPC driver to use regmap
>   mailbox: qcom: Create APCS child device for clock controller
>   clk: qcom: Add A53 PLL support
>   clk: qcom: Add regmap mux-div clocks support
>   dt-bindings: mailbox: qcom: Document the APCS clock binding
>   clk: qcom: Add APCS clock controller support
> 

Hi Jassi,

Do you want me to re-send the pending mailbox patches?

Thanks,
Georgi
