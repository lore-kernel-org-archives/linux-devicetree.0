From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure the GPU thermal zone
 for mickey
Date: Mon, 20 May 2019 13:21:33 -0700
Message-ID: <CAD=FV=Vr2thgHYTH_khqka27_SdGcSEShpSRp+u2E=O5eyxLMQ@mail.gmail.com>
References: <20190520170132.91571-1-mka@chromium.org> <20190520170132.91571-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520170132.91571-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 20, 2019 at 10:01 AM Matthias Kaehlcke <mka@chromium.org> wrote=
:
>
> mickey crams a lot of hardware into a tiny package, which requires
> more aggressive thermal throttling than for devices with a larger
> footprint. Configure the GPU thermal zone to throttle the GPU
> progressively at temperatures >=3D 60=C2=B0C. Heat dissipated by the
> CPUs also affects the GPU temperature, hence we cap the CPU
> frequency to 1.4 GHz for temperatures above 65=C2=B0C. Further throttling
> of the CPUs may be performed by the CPU thermal zone.
>
> The configuration matches that of the downstram Chrome OS 3.14

s/downstram/downstream


> +       cooling-maps {
> +               /* After 1st level throttle the GPU down to as low as 400=
 MHz */
> +               gpu_warmish_limit_gpu {
> +                       trip =3D <&gpu_alert_warmish>;
> +                       cooling-device =3D <&gpu THERMAL_NO_LIMIT 1>;

As per my comment in patch #1, you are probably ending up throttling
to 500 MHz, not 400 MHz.  Below will all have similar problems unless
we actually delete the 500 MHz operating point.


> +               };
> +
> +               /*
> +                * Slightly after we throttle the GPU, we'll also make su=
re that
> +                * the CPU can't go faster than 1.4 GHz.  Note that we wo=
n't
> +                * throttle the CPU lower than 1.4 GHz due to GPU heat--w=
e'll
> +                * let the CPU do the rest itself.
> +                */
> +               gpu_warm_limit_cpu {
> +                       trip =3D <&gpu_alert_warm>;
> +                       cooling-device =3D <&cpu0 4 4>;

Shouldn't you list cpu1, cpu2, and cpu3 too?  That'd match what
upstream did elsewhere in this file?
