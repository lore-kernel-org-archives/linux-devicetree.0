From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 1/2] DT: arm64: msm8916: add all SPI DT nodes
Date: Wed, 18 Mar 2015 14:53:29 +0200
Message-ID: <55097549.3070803@linaro.org>
References: <1426609532-11996-1-git-send-email-stanimir.varbanov@linaro.org> <55096F03.9060101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55096F03.9060101@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/18/2015 02:26 PM, Srinivas Kandagatla wrote:
> 
> 
> On 17/03/15 16:25, Stanimir Varbanov wrote:
>> +
>> +            spi4_sleep: spi4_sleep {
>> +                pinmux {
>> +                    function = "gpio";
>> +                    pins = "gpio12", "gpio13", "gpio14", "gpio15";
>> +   
> ....
> 
>> +
>> +            spi5_sleep: spi4_sleep {
> Will result in Duplicate node name error for "spi4_sleep"

thanks for the catch, it was a typo.

-- 
regards,
Stan
