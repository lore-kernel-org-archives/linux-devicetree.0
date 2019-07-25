From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: add startup delay to
 rk3288-veyron panel-regulators"
Date: Thu, 25 Jul 2019 16:35:12 -0700
Message-ID: <CAD=FV=XNSc+-a6ytx2fsUnh54g64i6FW+6WsHMFqwEMWbBPZ5Q@mail.gmail.com>
References: <20190620182056.61552-1-dianders@chromium.org> <CAD=FV=Wi21Emjg7CpCJfSRiKr_EisR20UO1tbPjAeJzdJNbSVw@mail.gmail.com>
 <CAD=FV=UhNfhVG422=huthFSptoV4FXED=xPtArO2KkyNb1U3Xw@mail.gmail.com> <3386344.sHu1S4gNag@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3386344.sHu1S4gNag@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jul 25, 2019 at 2:33 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 3. Juli 2019, 06:54:58 CEST schrieb Doug Anderson:
> > Hi,
> >
> > On Thu, Jun 20, 2019 at 1:31 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Jun 20, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > This reverts commit 1f45e8c6d0161f044d679f242fe7514e2625af4a.
> > > >
> > > > This 100 ms mystery delay is not on downstream kernels and no longer
> > > > seems needed on upstream kernels either [1].  Presumably something in the
> > > > meantime has made things better.  A few possibilities for patches that
> > > > have landed in the meantime that could have made this better are
> > > > commit 3157694d8c7f ("pwm-backlight: Add support for PWM delays
> > > > proprieties."), commit 5fb5caee92ba ("pwm-backlight: Enable/disable
> > > > the PWM before/after LCD enable toggle."), and commit 6d5922dd0d60
> > > > ("ARM: dts: rockchip: set PWM delay backlight settings for Veyron")
> > > >
> > > > Let's revert and get our 100 ms back.
> > > >
> > > > [1] https://lkml.kernel.org/r/2226970.BAPq4liE1j@diego
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 1 -
> > > >  arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 1 -
> > > >  arch/arm/boot/dts/rk3288-veyron-minnie.dts | 1 -
> > > >  arch/arm/boot/dts/rk3288-veyron-speedy.dts | 1 -
> > > >  4 files changed, 4 deletions(-)
> > >
> > > Maybe wait before applying.  I've been running reboot tests now with
> > > this patch applied (among others) and with enough reboots I managed to
> > > see:
> > >
> > > [    5.682418] rockchip-dp ff970000.dp: eDP link training failed (-5)
> > >
> > > I'll see if I can confirm that it's this patch and why things are
> > > different compared to downstream.
> >
> > OK, I finally got back to this and confirmed:
> >
> > 1. The above error is actually somewhat harmless.  The eDP failure
> > will be retried automatically despite the scary message.  Specifically
> > see the loop in analogix_dp_bridge_enable().  I confirmed that after
> > seeing the error the screen came up just fine (I looked at the screen
> > in two actual instances but I believe it's pretty much always fine).
> >
> > 2. I haven't seen any evidence that the eDP link training happens any
> > more often with this revert in place.  Specifically, I see the same
> > message in the logs (at what appears to be the same rate) with or
> > without this revert.
> >
> > 3. Probably the link-training failures here are the same ones we
> > debugged for PSR for rk3399-gru-kevin that we fixed by making the eDP
> > PCLK rate exactly 24 MHz.  See <https://crrev.com/c/433393> for
> > details.  On rk3399-gru-kevin it was super important to resolve the
> > root cause of these errors because we had PSR (which meant we were
> > constantly taking to the eDP controller).  On rk3288-veyron devices
> > with no PSR the retry should be a fine solution and it doesn't seem
> > like a good idea to fully rejigger our clock plan to fix the root
> > cause.
> >
> >
> > NOTE: I saw _one_ case on rk3288-veyron-minnie where the screen looked
> > wonky at bootup and I saw the eDP link training error in the logs.
> > That's what originally made me cautious.  I haven't been able to
> > reproduce this, but presumably I just got super unlucky in that one
> > case.  I've left devices rebooting all day at work and haven't seen
> > the wonky screen since then.
> >
> >
> > Summary: I think this revert is just fine.
>
> it looks like by picking Matthias' cleanups of the veyron displays
> first I broke this patch. I guess we just need to remove the
>         startup-delay-us = <100000>;
> from the panel_regulator in the new rk3288-veyron-edp.dtsi ?

Oops, I only checked Matthias's change against the current status of
your for-next tree and forgot about this change.  Yes, the
startup-delay should be removed there.  Do you want to resolve that
when applying the patch or would you prefer a resend?

-Doug
