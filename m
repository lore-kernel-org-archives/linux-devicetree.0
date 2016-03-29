From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH v6 0/3] Add more clock compatible features and support the
 RK3399 clock
Date: Tue, 29 Mar 2016 09:17:04 +0800
Message-ID: <56F9D790.1080608@rock-chips.com>
References: <1459158697-8218-1-git-send-email-zhengxing@rock-chips.com>
 <4649399.g7v7zsVJik@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4649399.g7v7zsVJik@diego>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B403=E6=9C=8828=E6=97=A5 20:59, Heiko St=C3=BCbner wrote:
> Am Montag, 28. M=C3=A4rz 2016, 17:51:34 schrieb Xing Zheng:
>>    The patch series add support more mux parameters and multiple
>> clock providers for the rockchip features of the clock framework,
>> and support the clock controller for the RK3399.
> applied all 3 for 4.7 with one change:
>
> I've dropped the grf paragraph from the binding doc (as it is not use=
d
> anymore) and also dropped the gmac_phy_rx_clk input clock.
>
> We can add these back once they are getting used in the future.
>
>
> Heiko
>
OK, thanks Heiko. :-)

--=20
- Xing Zheng


