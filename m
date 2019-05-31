From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 03/17] soc: qcom: ipa: main code
Date: Fri, 31 May 2019 17:25:54 -0500
Message-ID: <8295f702-2c3f-1fa3-0a4e-ebb51d5b03ee@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <20190531035348.7194-4-elder@linaro.org>
 <20190531.145005.798440469894507477.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531.145005.798440469894507477.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org, evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/31/19 4:50 PM, David Miller wrote:
> From: Alex Elder <elder@linaro.org>
> Date: Thu, 30 May 2019 22:53:34 -0500
> 
>> +	void *route_virt;
>  ...
>> +	void *filter_virt;
>  ...
> 
> If these are arrays of u64's, please declare them as "u64 *" instead of
> the opaque "void *".

Good idea.  I hadn't paid attention to that.  These tables are
arrays of 64-bit addresses so it's better to represent them that
way.

Thanks.

					-Alex
