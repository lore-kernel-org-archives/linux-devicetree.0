From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Add cpu id to rk3288 efuse node
Date: Sun, 29 Sep 2019 16:24:47 +0200
Message-ID: <9574075.6R2mNjq6rT@phil>
References: <20190919142611.1.I309434f00a2a9be71e4437991fe08abc12f06e2e@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142611.1.I309434f00a2a9be71e4437991fe08abc12f06e2e@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: mka@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 19. September 2019, 23:26:41 CEST schrieb Douglas Anderson:
> This just adds in another field of what's stored in the e-fuse on
> rk3288.  Though I can't personally promise that every rk3288 out there
> has the CPU ID stored in the eFuse at this location, there is some
> evidence that it is correct:
> - This matches what was in the Chrome OS 3.14 branch (see
>   EFUSE_CHIP_UID_OFFSET and EFUSE_CHIP_UID_LEN) for rk3288.
> - The upstream rk3399 dts file has this same data at the same offset
>   and with the same length, indiciating that this is likely common for
>   several modern Rockchip SoCs.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.5

Thanks
Heiko
