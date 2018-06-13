From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pm8998 and pm8005 to binding
Date: Tue, 12 Jun 2018 18:52:36 -0600
Message-ID: <CAL_Jsq+=JUyc9dzKFDSbQN7_3-M=EMqLoqy44+x9=HHt4VebAA@mail.gmail.com>
References: <20180612230604.137880-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612230604.137880-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 5:06 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> Update the binding for two more PMICs supported by the same driver.
> While we're here, remove the duplicate pmi8994 lines because that
> support got merged twice.
>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
