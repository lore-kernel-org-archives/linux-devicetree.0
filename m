Return-Path: <SRS0=9kJu=J2=linaro.org=loic.poulain@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1528723089-24904-1-git-send-email-loic.poulain@linaro.org>
References: <1528723089-24904-1-git-send-email-loic.poulain@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 10 Jul 2018 15:10:58 +0200
Message-ID: <CAMZdPi_PRMMm-Ei+dC2WNhV+PgmNP1Y5WiTs5QL0-Rt+j8JTXA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: qcom: db410c: Fix Bluetooth LED trigger
Content-Type: text/plain; charset="UTF-8"
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi David, Andy,

On 11 June 2018 at 15:18, Loic Poulain <loic.poulain@linaro.org> wrote:
> Current LED trigger, 'bt', is not known/used by any existing driver.
> Fix this by renaming it to 'bluetooth-power' trigger which is
> controlled by the Bluetooth subsystem.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Any comments ?
