From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH V6 2/6] dt-bindings: qcom: clocks: Add msm8994 clock
 bindings
Date: Thu, 10 Nov 2016 14:51:43 -0800
Message-ID: <a0ac3a64-1cbe-b512-c5d9-40cf3544e58e@redhat.com>
References: <1478292996-29559-1-git-send-email-jeremymc@redhat.com>
 <1478292996-29559-3-git-send-email-jeremymc@redhat.com>
 <20161110223133.GI16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161110223133.GI16026@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, mail@kchr.de, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On 2016-11-10 2:31 PM, Stephen Boyd wrote:
> On 11/04, Jeremy McNicoll wrote:
>> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>> ---
>
> Applied to clk-qcom-8994 in clk tree.
>
>> +
>> +/* Indexes for GDSCs */
>> +#define BIMC_GDSC				0
>> +#define VENUS_GDSC				1
>> +#define MDSS_GDSC				2
>> +#define JPEG_GDSC				3
>> +#define VFE_GDSC				4
>> +#define OXILI_GDSC				5
>> +
>
> But I removed these because it's copy/paste from 8916 and that is
> a different family of chips than 8994 so these GDSCs aren't in
> GCC on 8994.
>

Thanks for taking care of this.

-jeremy
