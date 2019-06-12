Return-Path: <SRS0=Jvm5=UL=atomide.com=tony@kernel.org>
Date: Wed, 12 Jun 2019 01:04:21 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Message-ID: <20190612080421.GC5447@atomide.com>
References: <20190611093045.4810-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611093045.4810-1-yegorslists@googlemail.com>
To: yegorslists@googlemail.com
Cc: linux-omap@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

* yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 02:31]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The PHY must add both tx and rx delay and not only on the tx clock.

As we're close to -rc5, I applied this against v5.2-rc1 and merged into
omap-for-v5.3/dt as it seems it's optional or has been broken for a while
with no fixes tag. After it hits the mainline kernel during the merge
window you can request it be applied into the stable trees as needed.

However, if this is urgent, let me know what regression it fixes and
I'll merge it into my fixes branch too.

Regards,

Tony
