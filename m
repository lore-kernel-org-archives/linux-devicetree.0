From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: fix rk3288 cpu opp node reference
Date: Tue, 12 Mar 2019 09:52:51 +0100
Message-ID: <3482373.0PG0Fu4BEl@phil>
References: <AM3PR03MB0966C52CCF14FCEDE6615265AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR03MB0966C52CCF14FCEDE6615265AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonas Karlman <jonas@kwiboo.se>
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 24. Februar 2019, 22:51:22 CET schrieb Jonas Karlman:
> The following error can be seen during boot:
> 
>   of: /cpus/cpu@501: Couldn't find opp node
> 
> Change cpu nodes to use operating-points-v2 in order to fix this.
> 
> Fixes: ce76de984649 ("ARM: dts: rockchip: convert rk3288 to operating-points-v2")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

added a Cc-stable tag and applied as fix for 5.1

Thanks for catching this
Heiko
