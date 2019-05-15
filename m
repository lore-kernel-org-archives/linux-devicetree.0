From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: raise GPU trip point temperature for
 speedy to 80 degC
Date: Wed, 15 May 2019 14:47:59 -0700
Message-ID: <20190515214759.GF40515@google.com>
References: <20190515153127.24626-1-mka@chromium.org>
 <20190515153127.24626-2-mka@chromium.org>
 <CAD=FV=XgoG5hiT=vAhNtUF4iVj1-Lmj7S5tvk86ehxB1uUZyxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=XgoG5hiT=vAhNtUF4iVj1-Lmj7S5tvk86ehxB1uUZyxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 11:30:12AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, May 15, 2019 at 8:31 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> 
> > Raise the temperature of the GPU thermal trip point for speedy
> > to 80°C. This is the value used by the downstream Chrome OS 3.14
> > kernel, the 'official' kernel for speedy.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > index 2ac8748a3a0c..394a9648faee 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> > @@ -64,6 +64,10 @@
> >         temperature = <70000>;
> >  };
> >
> > +&gpu_alert0 {
> > +       temperature = <80000>;
> > +};
> > +
> >  &edp {
> 
> Similar comments to patch set #1 about sort ordering.

ack

> ...I'll also notice that if we do end up setting the "critical" to 100
> C for most of veyron then I guess we'll have to switch it back to 90 C
> here for speedy to match downstream?

yes

> Maybe that's an argument for doing it in this patchset so we don't
> forget?

sounds good to me

> I'm somewhat amazed that downstream has only 10 C between "alert"
> and 'critical" for GPU for speedy, but I guess it's OK?

In tests on other veyron devices I observed gradual temperature
in response to CPU or GPU load, so unless there's a sudden spike in
the ambient temperature I think the 10°C delta should be fine with the
current polling interval of 100ms.
