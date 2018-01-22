From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Qualcomm Fixes for 4.16
Date: Mon, 22 Jan 2018 12:33:11 +0100
Message-ID: <CAK8P3a2M4xqHO3tRokqaudxO8=+ifj6Ve3vW1L_Dv2KCykbUtw@mail.gmail.com>
References: <1516572157-968-1-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1516572157-968-1-git-send-email-andy.gross@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Loys Ollivier <lollivier@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 21, 2018 at 11:02 PM, Andy Gross <andy.gross@linaro.org> wrote:
> Arnd/Olof/Kevin,
>
> Please take this fix for 4.16.  This applies on top of the current next
> (next-20190119).
>
> Thanks,
>
> Andy
>
> The following changes since commit 761914dd2975bc443024f0ec10a66a26b7186ec2:
>
>   Add linux-next specific files for 20180119 (2018-01-19 17:51:17 +1100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git tags/qcom-fixes-for-4.16

I assume you didn't actually mean to send a pull request based on top
of linux-next
but instead had a branch on top of the one you sent previously.

I cherry-picked the one commit you want into the next/drivers branch!

     Arnd
