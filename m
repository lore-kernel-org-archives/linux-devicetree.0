From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATVH v2 0/4] arm64: dts: allwinner: h6: Enable CPU
Date: Fri, 15 Feb 2019 23:35:20 +0800
Message-ID: <CAEExFWs2VuOpZu=Mw221Gp3RDbw=Q24eh8Y=pWdfh-c+mPvwuw@mail.gmail.com>
References: <20190215134937.10259-1-tiny.windzz@gmail.com> <20190215151357.noovkx3r6ia4boag@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215151357.noovkx3r6ia4boag@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, mark.rutland@arm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 11:13 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Fri, Feb 15, 2019 at 08:49:33AM -0500, Yangtao Li wrote:
> > Add the cpufreq support of h6, source of information is as follows.
> >
> > h6 cpu opp info:
> > https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/arch/arm64/boot/dts/sunxi/sun50iw6p1.dtsi
> >
> > axp805 spec:
> > http://linux-sunxi.org/images/b/bc/AXP805_Datasheet_V1.0_en.pdf
>
> Was that tested on the two H6 boards this time?
I tested two boards for about two hours.
>
> Adding a changelog between version is nice as well so that we can see
> what you changed.
Yes, sorry, I forgot.

Yours,
Yangtao
>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
