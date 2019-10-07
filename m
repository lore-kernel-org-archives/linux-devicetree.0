From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y
Date: Mon, 7 Oct 2019 21:22:56 +0530
Message-ID: <CANAwSgRStPUi=naKOw+E=X-b699DnZ0Q0hYAGrUB8VKtN-fFqQ@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-6-linux.amoon@gmail.com>
 <74ab98c7-0071-60e9-7613-56d15ad8c0ab@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74ab98c7-0071-60e9-7613-56d15ad8c0ab@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, 7 Oct 2019 at 19:55, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 07/10/2019 15:16, Anand Moon wrote:
> > Using microSD card we cannot get the mainline kernel to boot
>
> What's the link with microSD card here ?

Well I thought that the PWM failed stop's booting further on linux kernel.
But looking into kernelcli.org it seem to be working fine, but not at my end.
[0] https://storage.kernelci.org/media/master/v5.4-rc1-82-gc0e284ccfeda/arm64/defconfig/gcc-8/lab-baylibre/boot-meson-g12b-odroid-n2.txt

>
> > using mainline u-boot it fails with below logs.
> > Build PWM_MESSON as build-in solve the issue.
> >
> > [    1.569240] meson-gx-mmc ffe05000.sd: Got CD GPIO
> > [    1.599227] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
> > [    1.600605] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
> > [    1.607166] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
> > [    1.613273] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
> > [    1.619931] hctosys: unable to open rtc device (rtc0)
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Odroid N2 Schematics says "GPIOC_6 should not pulled low if GPIOC is not
> > work as SDCARD"
>
> Sorry, what's the link with the PWM build-in, and your case ?
>

Sorry I linked two issues with this commit message.

> This comment is linked to the comment in the datasheet:
> ""
> If GPIOC is not work as SDIO port, please do not pull CARD_DET(GPIOC_6) low when system booting
> up, to avoid romcode trying to boot from SD CARD.
> ""
> Seems pretty explicit for me.
>

Ok I will recheck this at my end.

> > Is their any other approch to help resolve this issue.
> >
> > Boot log failed with cold boot:
> > [0] https://pastebin.com/cEtWq2iX
> > ---
> >  arch/arm64/configs/defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index c9a867ac32d4..72f6a7dca0d6 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
> >  CONFIG_PWM=y
> >  CONFIG_PWM_BCM2835=m
> >  CONFIG_PWM_CROS_EC=m
> > -CONFIG_PWM_MESON=m
> > +CONFIG_PWM_MESON=y
> >  CONFIG_PWM_RCAR=m
> >  CONFIG_PWM_ROCKCHIP=y
> >  CONFIG_PWM_SAMSUNG=y
> >
>
> For these changes without the microSD fail description in the commit log :
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks. I will rephrase this without linking the microSD card, with
better commit message.

Best Regards
-Anand
