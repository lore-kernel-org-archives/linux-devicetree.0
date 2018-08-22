From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add USB-related nodes
Date: Wed, 22 Aug 2018 10:37:54 -0700
Message-ID: <CAD=FV=V=Me8g1MN1ZnV2JzHuLLppGr1JwnXZBBPDY1iHVivFFw@mail.gmail.com>
References: <20180810215150.82490-1-dianders@chromium.org> <20180810215150.82490-2-dianders@chromium.org>
 <153478902525.28926.6688429060107225232@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153478902525.28926.6688429060107225232@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Tomasz Figa <tfiga@chromium.org>, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Aug 20, 2018 at 11:17 AM, Stephen Boyd <swboyd@chromium.org> wrote:
>> +               qfprom@784000 {
>
> This doesn't match reg property.
>
>> +                       compatible = "qcom,qfprom";
>> +                       reg = <0x780000 0x8ff>;
>
> Because this should be 0x784000?

Thank you for catching.  This ought to be fixed in v3.

-Doug
