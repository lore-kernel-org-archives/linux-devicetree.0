From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
Date: Mon, 13 May 2019 15:48:22 -0700
Message-ID: <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-3-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509184415.11592-3-robdclark@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> Let's fixup the reserved memory to re-add the things we deleted in
> ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> reserved-mem changes") in a way that plays nicely with the new
> upstream definitions.

The message above makes no sense since that commit you reference isn't
in upstream.

...but in any case, why not squash this in with the previous commit?


> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Remove Stephen's Reviewed-by.  In general reviews that happen in the
Chrome OS gerrit shouldn't be carried over when things are posted
upstream.


> +/* Increase the size from 2MB to 8MB */
> +&rmtfs_mem {
> +       reg = <0 0x88f00000 0 0x800000>;
> +};
> +
> +/ {
> +       reserved-memory {
> +               venus_mem: memory@96000000 {
> +                       reg = <0 0x96000000 0 0x500000>;
> +                       no-map;
> +               };
> +       };
> +};

nit: blank line?

-Doug
