From: =?UTF-8?Q?Rodrigo_Exterck=C3=B6tter_Tj=C3=A4der?=
        <rodrigo@tjader.xyz>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable eMMC.
Date: Fri, 21 Sep 2018 11:54:07 -0300
Message-ID: <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com>
References: <20180919141815.18737-1-rodrigo@tjader.xyz> <20180921142811.h5jraemk565alh3i@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921142811.h5jraemk565alh3i@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 11:28 AM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> Expanding a bit more that commit log would be helpful. What is the
> eMMC connected to that board? Do all versions have it? Which modes are
> supposed to be supported, and which one have been tested?

The terseness of the commit message was already pointed out to me on
#linux-sunxi. I was waiting for more comments before sending a v2.

But you do touch on something I also realized: there are actually
three versions of the A64-OLinuXino. In fact only one of them has the
WiFi board, which is already enabled in the current device tree.
Wouldn't it be better to split it into three separate device trees? I
have made a patch that does that[1], if you think that is a good
approach I can submit that as a patch and then later submit a patch on
top of that to enable the eMMC only on the two boards that have it.

I only have the A64-OLinuXino model that has both eMMC and WiFi. I
have tested all three of the split device trees on it and they worked
as expected.

[1] https://github.com/RodrigoTjader/linux/commit/9f7cb025afbcb4b40d24c038fd976c7090d87d24
