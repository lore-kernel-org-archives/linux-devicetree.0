From: Rob Clark <robdclark@chromium.org>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
Date: Tue, 14 May 2019 21:09:55 -0700
Message-ID: <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-3-robdclark@gmail.com>
 <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Let's fixup the reserved memory to re-add the things we deleted in
> > ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> > reserved-mem changes") in a way that plays nicely with the new
> > upstream definitions.
>
> The message above makes no sense since that commit you reference isn't
> in upstream.
>
> ...but in any case, why not squash this in with the previous commit?

Yeah, I should have mentioned this was my intention, I just left it
unsquashed since (at the time) it was something I had cherry-picked on
top of current 4.19 cros kernel..

anyways, I pushed an (unsquashed, converted to fixup!'s) update to:

https://github.com/freedreno/kernel-msm/commits/wip/cheza-dtb-upstreaming

which has updates based on you're review comments (at least assuming I
understood them correctly).. plus some unrelated to cheza-dt patches
on top to get things actually working (ie. ignore everything on top of
the fixup!'s)

I didn't see any comments on the 'delete zap-shader' patch, so
hopefully that means what I did there was a sane (or at least not
insane) way to handle android/linux tz vs what we have on cheza?

BR,
-R


>
>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Remove Stephen's Reviewed-by.  In general reviews that happen in the
> Chrome OS gerrit shouldn't be carried over when things are posted
> upstream.
>
>
> > +/* Increase the size from 2MB to 8MB */
> > +&rmtfs_mem {
> > +       reg = <0 0x88f00000 0 0x800000>;
> > +};
> > +
> > +/ {
> > +       reserved-memory {
> > +               venus_mem: memory@96000000 {
> > +                       reg = <0 0x96000000 0 0x500000>;
> > +                       no-map;
> > +               };
> > +       };
> > +};
>
> nit: blank line?
>
> -Doug
