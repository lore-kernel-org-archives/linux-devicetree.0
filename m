From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: update pinmux setting in rk3399.dtsi
Date: Mon, 24 Sep 2018 14:58:15 +0200
Message-ID: <1621920.B7a7Pky3iO@phil>
References: <Akash_Gajjar@mentor.com> <1537368317-22170-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537368317-22170-1-git-send-email-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Deepak_Das@mentor.com, Pragnesh_Patel@mentor.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Nickey Yang <nickey.yang@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Randy Li <ayaka@soulik.info>, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Akash,

Am Mittwoch, 19. September 2018, 16:45:15 CEST schrieb Akash Gajjar:
> replace pin numbers with equivalent pin macro in rk3399.dtsi
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>

so far my "policy" has been to have new stuff use the constants
but not mass-converting the old entries, due to me being anxious
about accidentially breaking some seldom used settings.

With the newly added linebreaks your change looks pretty much hand-
generated, so I guess there is a bit of probability for typos creeping in
and it of course also only adapts one of the Rockchip socs.

So while I _may_ be persuaded of a scripted conversion [including seeing
the script] doing all Rockchip socs (per architecture) at once, I currently
somehow prefer keeping the status quo ;-)


Heiko
