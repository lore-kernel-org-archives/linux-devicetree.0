From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: Re: [PATCH] ARM: dts: socfpga: use stdout-path for chosen node
Date: Wed, 8 Aug 2018 14:02:44 +0200
Message-ID: <CAAh8qsyHxMjwBtBa5pYejkOxwFRbbFbt+myC4ynQQonK8MAo-w@mail.gmail.com>
References: <20180808090944.861-1-simon.k.r.goldschmidt@gmail.com> <f27a5e90-9783-761e-a87b-9b8a2d46d2a4@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f27a5e90-9783-761e-a87b-9b8a2d46d2a4@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 8, 2018 at 1:32 PM Marek Vasut <marex@denx.de> wrote:
>
> On 08/08/2018 11:09 AM, Simon Goldschmidt wrote:
> > Use stdout-path dts property for kernel console.
> >
> > There were two socfpga boards left not using stdout-path:
> > socrates and vining. Make sure they match the other boards.
> >
> > Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> > ---
> >  arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    | 3 ++-
> >  arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts b/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
> > index 53bf99eef66d..6f5255a7d192 100644
> > --- a/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
> > +++ b/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
> > @@ -22,7 +22,8 @@
> >       compatible = "ebv,socrates", "altr,socfpga-cyclone5", "altr,socfpga";
> >
> >       chosen {
> > -             bootargs = "console=ttyS0,115200";
> > +             bootargs = "earlyprintk";
> > +             stdout-path = "serial0:115200n8";
> >       };
> >
> >       memory@0 {
> > diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> > index f50b19447de6..e61efe16e79c 100644
> > --- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> > +++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
> > @@ -54,7 +54,8 @@
> >       compatible = "samtec,vining", "altr,socfpga-cyclone5", "altr,socfpga";
> >
> >       chosen {
> > -             bootargs = "console=ttyS0,115200";
> > +             bootargs = "earlyprintk";
>
> Why this earlyprintk ?

The reason is Dinh added that to all socfpga boards in his commit [1]
and I wanted the remaining two boards to be the same.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts?h=v4.17.13&id=efc1985c8f79ee8259d19a9b6e3df6a07d063669

Best Regards,
Simon

>
> > +             stdout-path = "serial0:115200n8";
> >       };
> >
> >       memory@0 {
> >
>
>
> --
> Best regards,
> Marek Vasut
