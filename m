From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: rockpro64 dts remove unused node
Date: Fri, 15 Feb 2019 21:46:03 +0100
Message-ID: <7155828.jr86DZMtXN@diego>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com> <4653141.o6ZdamfZ6d@diego> <ac22440d-3b64-1cf2-205c-52ea7c1c23f9@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac22440d-3b64-1cf2-205c-52ea7c1c23f9@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: agajjar <Akash_Gajjar@mentor.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. Februar 2019, 13:08:16 CET schrieb agajjar:
> On 2/15/2019 2:48 PM, Heiko Stübner wrote:
> > Am Mittwoch, 13. Februar 2019, 18:06:38 CET schrieb Akash Gajjar:
> >> lcd panel pinmux and vcc1v8_s3 regulator is redundant and has a no
> >> impact,
> >> so removing it.
> >> 
> >> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> 
> Hi Heiko,
> 
> > vcc1v8_s3 is actually also a emmc supply, so I'd like to keep it around
> > for completenes sake.
> 
> Emmc module is supplied by PMIC vcc3v3_s3 (SWITCH_REG1) and vcc_1v8
> (DCD_REG4).
> 
> So I believe removing vcc1v8_s3 has no impact on emmc supply line.

looking at the rockpro64 schematics page 10, I see vcca1v8_s3 linked
to the emmc_vdd_1v8 input and obviously also as reference for the saradc.

So I think we really could keep it around, so that the power-tree resembles
the schematics more.
