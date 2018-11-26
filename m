From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 07/13] ARM: dts: rv1108: Fix the timer mask
Date: Mon, 26 Nov 2018 11:45:16 -0200
Message-ID: <CAP9ODKoFaUP3JyY=x-6H-b_SZnN3BTtS5dMVsqE2-n96AWp2dQ@mail.gmail.com>
References: <20181125211907.9895-1-otavio@ossystems.com.br>
 <20181125211907.9895-7-otavio@ossystems.com.br> <4443441.F7S2jYBxxL@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4443441.F7S2jYBxxL@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Berton <fabio.berton@ossystems.com.br>, Kernel development list <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2018 at 3:27 AM Heiko Stuebner <heiko@sntech.de> wrote:
> Am Sonntag, 25. November 2018, 22:19:01 CET schrieb Otavio Salvador:
> > As done in the Rockchip vendor tree and also on other
> > "arm,armv7-timer" instances, the correct GIC_CPU_MASK_SIMPLE mask
> > is 4 instead of 1.
>
> Nope. That value represents the number of cores in the system.
> As the rv1108 only has one core, that should likely stay as it is.

I see, I will drop it for v2.

> Also, it seems I only got patches 6-13 what happened to 1-5?

It went to other mailing lists, I think. I will add you on Cc to all for v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
