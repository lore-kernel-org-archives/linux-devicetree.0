Return-Path: <SRS0=y5gw=UL=googlemail.com=yegorslists@kernel.org>
MIME-Version: 1.0
References: <20190611093045.4810-1-yegorslists@googlemail.com> <20190612080421.GC5447@atomide.com>
In-Reply-To: <20190612080421.GC5447@atomide.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 12 Jun 2019 10:20:27 +0200
Message-ID: <CAGm1_kufcx3siXKc6EtFJhLQ_K+V7MgVtvZuXeN2YikkPcufmg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Content-Type: text/plain; charset="UTF-8"
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, peter.ujfalusi@ti.com
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

On Wed, Jun 12, 2019 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 02:31]:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The PHY must add both tx and rx delay and not only on the tx clock.
>
> As we're close to -rc5, I applied this against v5.2-rc1 and merged into
> omap-for-v5.3/dt as it seems it's optional or has been broken for a while
> with no fixes tag. After it hits the mainline kernel during the merge
> window you can request it be applied into the stable trees as needed.
>
> However, if this is urgent, let me know what regression it fixes and
> I'll merge it into my fixes branch too.

This is the same fix as 759c962d3c9bb1a60e3b4b780daa66ee6d4be13a:

    ARM: dts: am335x-evmsk: Fix PHY mode for ethernet

    The PHY must add both tx and rx delay and not only on the tx clock.
    The board uses AR8031_AL1A PHY where the rx delay is enabled by default,
    the tx dealy is disabled.

    The reason why rgmii-txid worked because the rx delay was not disabled by
    the driver so essentially we ended up with rgmii-id PHY mode.

It seems to be working in 4.19. So I think kernels 5.0, 5.1 are the
first to be affected. Without this patch eth1 is not working on Baltos
devices.

Thanks.

Best regards,
Yegor
