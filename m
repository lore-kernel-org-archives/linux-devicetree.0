From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCHv5 0/7] Add coresight support for SDM845, MSM8998 and
 MSM8996
Date: Tue, 29 Jan 2019 11:28:36 +0100
Message-ID: <6994f4cc-e1fe-d418-1b6d-8b00bf9fc042@free.fr>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, DT <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 28/01/2019 20:13, Sai Prakash Ranjan wrote:

> This patch series adds support for coresight on SDM845, MSM8998, and MSM8996.
> 
> Patch 2 adds device tree nodes for MSM8998 coresight components.
> 
> Patch 2 depends on MSM8998 rpm clocks and rpmcc nodes:
>  https://lore.kernel.org/lkml/1545099336-5615-1-git-send-email-jhugo@codeaurora.org/
>  https://lore.kernel.org/lkml/8f431bde-0e67-8088-5119-7a951d0ead52@free.fr/
> 
> This patch series has been tested on SDM845 MTP and MSM8996
> based Dragonboard 820c and MSM8998 MTP.
> 
> v5:
>  * Added coresight support for MSM8998.
>  * Added ETM PIDs for SDM845 and MSM8996 as suggested by Suzuki.
>  * Added UCI table for Coresight CPU debug module.

Great! Thanks :-)
