From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH] ARM: dts: rv1108-evb: enable eMMC support
Date: Sun, 25 Nov 2018 18:53:01 -0200
Message-ID: <CAP9ODKpnv0FmK1no6mpqR=WGUgwvMUpKjVFNkXsEXReqb9OnXg@mail.gmail.com>
References: <20181009213656.27719-1-otavio@ossystems.com.br> <6815120.yyevdQbq0d@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6815120.yyevdQbq0d@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,
On Tue, Oct 16, 2018 at 10:09 AM Heiko Stuebner <heiko@sntech.de> wrote:
> Am Dienstag, 9. Oktober 2018, 23:36:56 CEST schrieb Otavio Salvador:
> > Enable eMMC support for rv1108 evaluation board.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  arch/arm/boot/dts/rv1108-evb.dts |  8 ++++++++
> >  arch/arm/boot/dts/rv1108.dtsi    | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
> > index 70f0106d1252..f3c6f52c49e6 100644
> > --- a/arch/arm/boot/dts/rv1108-evb.dts
> > +++ b/arch/arm/boot/dts/rv1108-evb.dts
> > @@ -226,6 +226,14 @@
> >       status = "okay";
> >  };
> >
> > +&emmc {
> > +     cap-mmc-highspeed;
> > +     supports-emmc;
> > +     non-removable;
> > +     num-slots = <1>;
>
> num-slots should not be present anymore on new additions
>
> Also missing the pinctrl settings you're defining below?
> Aka pinctrl-0 = <&emmc_*>; + pinctrl-names = "default"

Thank you, I am preparing a v2 of this patch together with few more changes.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
