From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v3 00/11] Add support for Orange Pi 3
Date: Fri, 12 Apr 2019 14:10:03 +0200
Message-ID: <20190412121003.yhw7w5qspps5r5nf@core.my.home>
References: <20190411101951.30223-1-megous@megous.com>
 <CAGb2v64HgPePM=rk_kSdS7yFx4S4TR=tpGC2yQ6ruDCvBnosiA@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBHEAYLSQKGQEY7ZSNZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64HgPePM=rk_kSdS7yFx4S4TR=tpGC2yQ6ruDCvBnosiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Franky Lin <franky.lin@broad>
List-Id: devicetree@vger.kernel.org

Hello ChenYu,

On Fri, Apr 12, 2019 at 07:05:05PM +0800, Chen-Yu Tsai wrote:
> On Thu, Apr 11, 2019 at 6:19 PM megous via linux-sunxi
> <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> >
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > This series implements support for Xunlong Orange Pi 3 board.
> >
> > Unfortunately, this board needs some small driver patches, so I have
> > split the boards DT patch into chunks that require patches for drivers
> > in various subsystems.
> >
> > Suggested merging plan/dependencies:
> >
> > - Pinctrl and stmmac patches are needed for ethernet support.
> >   (patches 1-5)
> > - HDMI support was changed, please review. (patches 6-8)
> > - brcmfmac patch 9, fixing firmware file selection, can be merged
> >   now, after review, as it doesn't depend on anything (please
> >   review :))
> > - mmc1 pinconf (patch 10) can probably be merged now, too (it will
> >   certainly be used soon by all the other WiFi featuring boards
> >   based on H6)
> > - WiFi dts patch will have to wait for H6 RTC patches, which in turn
> >   depend on ChenYu's RTC series, to be merged. That will take a
> >   while yet. I'm just keeping it in the series for completness.
> >   (patch 11)
> 
> Unfortunately I will not have time to tackle this for the next release.
> Furthermore, I'd like to do this after the new clk parenting stuff lands.
> Otherwise it's going to be a mess, as the clock tree is a bit convoluted
> compared to previous SoCs.

I've sent out a patch series that addresses part of that for now.

So perhaps we can start with that and incrementally get to a full support,
of H6's complexities around clocks managed by RTC.

thanks,
	o.

> ChenYu
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
