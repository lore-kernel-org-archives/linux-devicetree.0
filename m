From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Mon, 15 Apr 2019 16:18:12 +0800
Message-ID: <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
References: <20190412120730.473-1-megous@megous.com>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUX42DSQKGQE4QLTJDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190412120730.473-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
<linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
>
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> I went through the datasheets for H6 and H5, and compared the differences.
> RTCs are largely similar, but not entirely compatible. Incompatibilities
> are in details not yet implemented by the rtc driver though.
>
> I also corrected the clock tree in H6 DTSI.

Please also add DCXO clock input/output and XO clock input to the bindings
and DT, and also fix up the clock tree. You can skip them in the driver for
now, but please add a TODO. As long as you don't change the clock-output-name
of osc24M, everything should work as before.

We just want the DT to describe what is actually there. For the XO input,
you could just directly reference the external crystal node. The gate for
it is likely somewhere in the PRCM block, which we don't have docs for.

> There's a small detail here, that's not described absolutely correctly in
> DTSI, but the difference is not really that material. ext_osc32k is
> originally modelled as a fixed clock that feeds into RTC module, but in
> reality it's the RTC module that implements via its registers enabling and
> disabling of this oscillator/clock.
>
> Though:
> - there's no other possible user of ext_osc32k than RTC module
> - there's no other possible external configuration for the crystal
>   circuit that would need to be handled in the dts per board
>
> So I guess, while the description is not perfect, this patch series still
> improves the current situation. Or maybe I'm misunderstanding something,
> and &ext_osc32k node just describes a fact that there's a crystal on
> the board. Then, everything is perhaps fine. :)

Correct. The external clock nodes are modeling the crystal, not the internal
clock gate / distributor.

Were the vendor to not include the crystal (for whatever reasons), the DT
should be able to describe it via the absence of the clock input, and the
driver should correctly use the internal (inaccurate) oscillator. I realize
the clocks property is required, and the driver doesn't handle this case
either, so we might have to fix that if it were to appear in the wild.

> For now, the enable bit for this oscillator is toggled by the re-parenting
> code automatically, as needed.

That's fine. No need to increase the clock tree depth.

ChenYu

> This patchset is necessary for implementing the WiFi/Bluetooth support
> on boards using H6 SoC.
>
> Please take a look.
>
> Thank you and regards,
>   Ondrej Jirman
>
> Ondrej Jirman (3):
>   dt-bindings: Add compatible for H6 RTC
>   rtc: sun6i: Add support for H6 RTC
>   arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree
>
>  .../devicetree/bindings/rtc/sun6i-rtc.txt     |  1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
>  drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
>  3 files changed, 55 insertions(+), 16 deletions(-)
>
> --
> 2.21.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
