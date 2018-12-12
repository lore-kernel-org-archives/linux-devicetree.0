From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v6 00/10] Add power domain driver for corners on
 msm8996/sdm845
Date: Wed, 12 Dec 2018 09:47:13 +0530
Message-ID: <24b358b9-6a62-da48-88af-8b2d2bfc31a9@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
 <154456511414.17204.10860688288502708116@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154456511414.17204.10860688288502708116@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/12/2018 3:21 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2018-12-11 01:49:28)
>> Changes in v6:
>> * OPP binding updates for qcom,level reviewed by Rob
>> * DT bindings for rpmpd and rpmhpd updated to specify the
>> OPP tables as child nodes of the power-controller itself
>> * Removed some module specific remains from the drivers,
>> now that they can only be built-in
>> * Added a simple_opp_to_performance_state() helper
> 
> Is the idea that it can be squashed into the patches that use it by
> reordering the series? But otherwise left at the end of the series to
> make things simpler to merge without it?

Yes, I left them at the end so its easier to merge. The PM domains change
would need to go via Ulf/Viresh while the SoC drivers using them would
go via Andy. So now its only 09/10 that's dependent on 08/10 and not the
entire series.
