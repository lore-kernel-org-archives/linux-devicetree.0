Return-Path: <SRS0=3Y2e=J2=linaro.org=niklas.cassel@kernel.org>
Date: Tue, 10 Jul 2018 16:33:08 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] arm: dts: qcom: db410c: Fix Bluetooth LED trigger
Message-ID: <20180710143308.GA13577@centauri.lan>
References: <1528723089-24904-1-git-send-email-loic.poulain@linaro.org>
 <CAMZdPi_PRMMm-Ei+dC2WNhV+PgmNP1Y5WiTs5QL0-Rt+j8JTXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi_PRMMm-Ei+dC2WNhV+PgmNP1Y5WiTs5QL0-Rt+j8JTXA@mail.gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 10, 2018 at 03:10:58PM +0200, Loic Poulain wrote:
> Hi David, Andy,
> 
> On 11 June 2018 at 15:18, Loic Poulain <loic.poulain@linaro.org> wrote:
> > Current LED trigger, 'bt', is not known/used by any existing driver.
> > Fix this by renaming it to 'bluetooth-power' trigger which is
> > controlled by the Bluetooth subsystem.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Any comments ?

Hello Loic,

Perhaps a Fixes-tag would be nice here?

Kind regards,
Niklas

> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
