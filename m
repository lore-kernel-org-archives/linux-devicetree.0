From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Add missing unit address to memory node on rk3288-veyron
Date: Sun, 28 Jul 2019 22:55:56 +0200
Message-ID: <8373672.S8ITYX37Bm@phil>
References: <20190727142736.23188-1-krzk@kernel.org> <86910491.m50tbimVMv@phil> <CAJKOXPcHB9969bqw+aqRh1HYHKDazhhpKy_+uKKcA=5Gkg6+EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcHB9969bqw+aqRh1HYHKDazhhpKy_+uKKcA=5Gkg6+EA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 28. Juli 2019, 13:38:43 CEST schrieb Krzysztof Kozlowski:
> On Sat, 27 Jul 2019 at 17:33, Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Hi Krzysztof,
> >
> > Am Samstag, 27. Juli 2019, 16:27:36 CEST schrieb Krzysztof Kozlowski:
> > > Fix DTC warning:
> > >
> > >     arch/arm/boot/dts/rk3288-veyron.dtsi:21.9-24.4:
> > >     Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> >
> > please see the comment directly above the memory node on why that needs
> > to stay that way. So no, we'll keep the veyron memory node as is.
> 
> Damn it, I missed it.

no worries :-)
