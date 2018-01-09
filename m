From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sdm845 pinctrl driver
Date: Tue, 9 Jan 2018 15:39:59 +0100
Message-ID: <CACRpkdba2HTeWGAegPv-32PBKh1qZYnF_1ctPaf3p4chSD8yBQ@mail.gmail.com>
References: <20180106015104.19143-1-bjorn.andersson@linaro.org>
 <20180106015104.19143-2-bjorn.andersson@linaro.org> <20180108154403.GO12655@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180108154403.GO12655@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 8, 2018 at 4:44 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 05 Jan 17:51 PST 2018, Bjorn Andersson wrote:
>
>> From: Rajendra Nayak <rnayak@codeaurora.org>
>>
>> This adds the pinctrl definitions for the TLMM of SDM845.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> [bjorn: consolidated functions]
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Linus,
>
> This patch is missing some updates introduced between engineering and
> production hardware, which I missed this while reviewing the patch.
>
> So please don't merge this patch, and forgive me for noise.

OK waiting for respin. Let's see if the DT bindings get some review
in the meantime.

Yours,
Linus Walleij
