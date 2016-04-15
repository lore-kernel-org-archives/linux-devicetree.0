From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2 v2] device-tree: nexus7-flo: Remove power gpio key
 entry and use pmic8xxx-pwrkey
Date: Fri, 15 Apr 2016 11:57:12 -0500
Message-ID: <CAL_JsqJfhoZEu+Djch31_KquMQ79Sk4zgHgN1j0QELh=q6v3PA@mail.gmail.com>
References: <1460668031-12384-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460668031-12384-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 4:07 PM, John Stultz <john.stultz@linaro.org> wrote:
> Since the pmic8xxx-pwrkey driver is already supported in the
> qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
> configure proper device shutdown when ps_hold goes low, it is
> better to use that driver then a generic gpio button.
>
> Thus this patch remove the gpio power key entry here, so we
> don't get double input events from having two drivers enabled.
>
> The one gotcha with the pmic8xxx-pwrkey is it has a fairly
> long debounce delay, which we shorten here to make the button
> behave as expected.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
>  - Add wakeup-source entry as suggested by
>    Sudeep Holla <sudeep.holla@arm.com>
>
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
