From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl: qcom: increase variable size for register offsets
Date: Fri, 30 Jan 2015 14:33:08 +0100
Message-ID: <CACRpkda-y8WpOmnFn0rgjJTo2VeX1nXX+ViRyO0G-q75zcvnEw@mail.gmail.com>
References: <1422612241-12944-1-git-send-email-svarbanov@mm-sol.com>
	<1422612241-12944-2-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422612241-12944-2-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Joonwoo Park <joonwoop@codeaurora.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 30, 2015 at 11:03 AM, Stanimir Varbanov
<svarbanov@mm-sol.com> wrote:

> From: Joonwoo Park <joonwoop@codeaurora.org>
>
> On newer TLMM hardware blocks the registers are spread and
> we need an offsets upper than 16 bits to address them. Increase
> the register offset variables to 32 bits size.
>
> Signed-off-by: Joonwoo Park <joonwoop@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Patch applied.

Yours,
Linus Walleij
