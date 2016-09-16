From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] phy: msm8996-pcie-phy: Add support to msm8996 pcie
 phy
Date: Fri, 16 Sep 2016 17:49:18 +0100
Message-ID: <e43b7441-6183-e15c-c944-620d3f376320@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-3-git-send-email-srinivas.kandagatla@linaro.org>
 <2afe8523-925f-b538-f217-23ea7a267e11@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2afe8523-925f-b538-f217-23ea7a267e11@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 16/09/16 15:14, Stanimir Varbanov wrote:
>> > +	writel_relaxed(0x0f, base + QSERDES_COM_BG_TRIM);
>> > +	writel_relaxed(0x0f, base + QSERDES_COM_PLL_IVCO);
>> > +	writel_relaxed(0x19, base + QSERDES_COM_CLK_EP_DIV);
>> > +	writel_relaxed(0x10, base + QSERDES_COM_CLK_ENABLE1);
>> > +	writel_relaxed(0x00, base + QSERDES_COM_HSCLK_SEL);
>> > +	writel_relaxed(0x40, base + QSERDES_COM_RESCODE_DIV_NUM);
>> > +	writel_relaxed(0x00, base + PCIE_COM_SW_RESET);
>> > +	writel_relaxed(0x03, base + PCIE_COM_START_CONTROL);
> I'd make an array with register/value pair and write the registers with
> a for () loop. IMO it will be more readable.
>
> Probably 3 arrays - power_on, power_on_common and power_off.
Thats good idea, I will keep that in mind before sending next version 
with common phy driver for USB/PCIE/UFS.

thanks
srini
