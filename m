From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Khadas Edge/Edge-V/Captain boards
Date: Fri, 14 Jun 2019 16:01:05 +0200
Message-ID: <1719008.LxYQEzyXAE@diego>
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com> <4566563.QzcLDyM7tj@phil> <CAP4nuTUQZRG9yV1Bz2hpe10K3CrWhVWf_YYBnMs3O1KyahhrMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP4nuTUQZRG9yV1Bz2hpe10K3CrWhVWf_YYBnMs3O1KyahhrMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Xie <xieqinick@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, nick@khadas.com
List-Id: devicetree@vger.kernel.org

Hi Nick,

Am Freitag, 14. Juni 2019, 15:32:11 CEST schrieb Nick Xie:
> Thanks, I'll check them out.
> 
> But there is a small typo:
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/tree/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi?h=v5.3-armsoc/dts64&id=910249897d13beaa0b46069e27139024cd77e916#n299
> 
> *22 (GPIO1_C6)* should be *RK_PC6* NOT *RK_PD6*.

thanks for double-checking ... I've updated the commit to use the right gpio now.

Heiko

> 
> Heiko Stuebner <heiko@sntech.de> 于2019年6月14日周五 下午7:32写道：
> 
> > Am Montag, 10. Juni 2019, 09:57:53 CEST schrieb xieqinick@gmail.com:
> > > From: Nick Xie <nick@khadas.com>
> > >
> > > Add devicetree support for Khadas Edge/Edge-V/Captain boards.
> > > Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.
> > > Khadas Captain is the carrier board for Khadas Edge.
> > > Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.
> > >
> > > Signed-off-by: Nick Xie <nick@khadas.com>
> >
> > applied for 5.3 after doing some style-fixes to the edge.dtsi
> > (2 missing gpio constants, some newlines and sdio-regulator
> > references were missing "<..>")
> >
> > Please double-check the result
> >
> >
> > Thanks
> > Heiko
> >
> >
> >
