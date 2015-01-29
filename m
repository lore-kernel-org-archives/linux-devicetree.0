From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add msm8916 pinctrl driver
Date: Thu, 29 Jan 2015 16:27:03 +0200
Message-ID: <54CA4337.6070500@mm-sol.com>
References: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com> <1421745476-6276-4-git-send-email-svarbanov@mm-sol.com> <20150128231847.GC17315@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128231847.GC17315@qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Joonwoo Park <joonwoop@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 01/29/2015 01:18 AM, Andy Gross wrote:
> On Tue, Jan 20, 2015 at 11:17:56AM +0200, Stanimir Varbanov wrote:
> 
> <snip>
> 
>> +	MSM_MUX_blsp1_spi,
>> +	MSM_MUX_blsp2_spi,
>> +	MSM_MUX_blsp3_spi,
> 
> The above three need to be renamed to blsp_spiX_csX to denote which SPI and chip
> select they modify.

I catch the idea, thanks for the tips. I will address all comments.

-- 
regards,
Stan
