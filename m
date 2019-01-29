From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv5 6/7] coresight: debug: Add Unique Component Identifier
 (UCI) table
Date: Tue, 29 Jan 2019 20:24:34 +0530
Message-ID: <fabcf7ca-96c4-8a54-f6cf-713eb1f0b822@codeaurora.org>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <1019e6fed1ade6a580f01df9b3f70c2a9df5b3be.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <20190129132528.GA16669@leoy-ThinkPad-X240s>
 <20190129133605.GB16669@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129133605.GB16669@leoy-ThinkPad-X240s>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kerne
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 1/29/2019 7:06 PM, Leo Yan wrote:
> 
> I just now found if apply this patch onto coresight next branch [1],
> it will conflict with patch 'coresight: cpu-debug: Support for CA73
> CPUs' [2].  Sorry if introduce regression by this.
> 

This patch depends on UCI support which is being discussed at:

https://lore.kernel.org/lkml/20190121233151.13363-2-mike.leach@linaro.org/

So I think this should not go into coresight-next until the UCI support
is merged into coresight-next as well.

If UCI support is already merged, then I can rebase this patch on top
of coresight-next and resend.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
