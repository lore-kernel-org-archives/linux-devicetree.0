From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Wed, 9 Jan 2019 14:54:06 +0530
Message-ID: <20190109092406.clpx57gmmtrj2vf4@vireshk-i7>
References: <20190109090420.8100-1-rnayak@codeaurora.org>
 <20190109090420.8100-2-rnayak@codeaurora.org>
 <20190109090912.ciq4uzo5sjghyms2@vireshk-i7>
 <d48db4fd-0b6b-8963-048d-3304b850e28c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d48db4fd-0b6b-8963-048d-3304b850e28c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 09-01-19, 14:50, Rajendra Nayak wrote:
> Sure, does this seem fine?
> 
> - opp-level: A value representing the performance level of the device,
>   expressed as a 32-bit big-endian integer.

Not sure if you need to specify endian-ness here.

> I assume the changelog mentioning the motivation behind adding this is fine?

Yeah, that would be fine. Just mention that one of the users of such a
property is qcom/mtk ......

-- 
viresh
