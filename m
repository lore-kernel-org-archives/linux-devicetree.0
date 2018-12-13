Return-Path: <SRS0=lm7B=OW=chromium.org=dianders@kernel.org>
MIME-Version: 1.0
References: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
 <8c92dc30-cfbe-00e2-ae70-243455549ecd@codeaurora.org> <CAMZdPi8-9d11FXKJinpJkJyhi8fcysbYVDjG8aDwbY3s=mLarw@mail.gmail.com>
 <aea60b4c-f651-5e5a-c363-f7da9a8ed838@codeaurora.org>
In-Reply-To: <aea60b4c-f651-5e5a-c363-f7da9a8ed838@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Dec 2018 11:14:07 -0800
Message-ID: <CAD=FV=WeS5h6SEe01ey8zEOs=1DqO5-31iZWazARtrp4xM3wkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD
Content-Type: text/plain; charset="UTF-8"
To: jhugo@codeaurora.org
Cc: loic.poulain@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On Thu, Dec 13, 2018 at 6:46 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 12/13/2018 12:55 AM, Loic Poulain wrote:
> > Hi Jeffrey,
> >
> >
> > On Wed, 12 Dec 2018 at 18:23, Jeffrey Hugo <jhugo@codeaurora.org
> > <mailto:jhugo@codeaurora.org>> wrote:
> >
> >     On 12/12/2018 10:13 AM, Loic Poulain wrote:
> >      > In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> >      > VMMC, needs to be increased in order to prevent any voltage drop
> >     issues
> >      > (due to limited current) happening with some SDCARDS or during
> >     specific
> >      > operations (e.g. write).
> >      >
> >      > Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994
> >     regulator node)
> >      > Signed-off-by: Loic Poulain <loic.poulain@linaro.org
> >     <mailto:loic.poulain@linaro.org>>
> >      > ---
> >      >   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
> >      >   1 file changed, 2 insertions(+)
> >      >
> >      > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> >     b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> >      > index 104cad9..c15e2c0 100644
> >      > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> >      > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> >      > @@ -634,6 +634,8 @@
> >      >                               l21 {
> >      >                                       regulator-min-microvolt =
> >     <2950000>;
> >      >                                       regulator-max-microvolt =
> >     <2950000>;
> >      > +                                     regulator-allow-set-load;
> >      > +                                     regulator-system-load =
> >     <200000>;
> >      >                               };
> >      >                               l22 {
> >      >                                       regulator-min-microvolt =
> >     <3300000>;
> >      >
> >
> >     I'm curious, why not update sdhci-msm to set the load on the regulator?
> >
> >
> > Yes you're right, and I saw that there is ongoing work:
> > https://patchwork.kernel.org/patch/10630731/
> >
> > Howerver I thought this change would be a quicker fix and easier to
> > backport in stable trees.
> > I assume all the device-tree vmmc loads will be removed at some point
> > when driven from sdhci.
> >
>
> I hadn't seen that.  Ok, seems good to me.

NOTE: I'm personally not convinced that adding the "set_load" calls
into the SDHCI driver actually makes any sense.  I believe it adds
complexity for no benefit.  The only time you ever need to should ever
be fiddling with "set_load" calls is if the rail you're controlling
has some hope of being able to run at a lower power mode.  If there's
no hope of it being at a lower power mode then the constraints on the
rail should just force it to high power mode and be done with it.  The
patch here (using regulator-system-load) is one way to force it to a
high power mode and seems fine, but there are other ways.  See a
previous discussion [1].

NOTE: IIRC the "ongoing work" patch you pointed at always sets the
load to a fixed level to turn it to "high power mode" when the
regulator is turned on and undoes that set_load when the regulator is
turned off.  That's no longer needed as of commit 5451781dadf8
("regulator: core: Only count load for enabled consumers").  If
someone comes up with a case where it's useful to keep the SD card
rail turned on but in "low power mode" _then_ we should actually
consider adding set_load to the SD card driver.

[1] https://lkml.kernel.org/r/CAD=FV=V4WFYoKLQ72pico4HCGgLDTae7xougivv6VWOSoPhLpg@mail.gmail.com

-Doug
