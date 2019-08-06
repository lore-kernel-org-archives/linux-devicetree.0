From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add dts for Leez RK3399 P710 SBC
Date: Tue, 6 Aug 2019 08:48:25 -0600
Message-ID: <CAL_JsqJ6_J1pR-MYK5kmUN5Q+tX32UNFqLW81tmBf=pYxtAmjg@mail.gmail.com>
References: <20190805124037.10597-1-andyshrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805124037.10597-1-andyshrk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andyshrk@gmail.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 6:40 AM Andy Yan <andyshrk@gmail.com> wrote:
>
> P710 is a RK3399 based SBC, designed by Leez [0].
>
> Specification
> - Rockchip RK3399
> - 4/2GB LPDDR4
> - TF sd scard slot
> - eMMC
> - M.2 B-Key for 4G LTE
> - AP6256 for WiFi + BT
> - Gigabit ethernet
> - HDMI out
> - 40 pin header
> - USB 2.0 x 2
> - USB 3.0 x 1
> - USB 3.0 Type-C x 1
> - TYPE-C Power supply
>
> [0]https://leez.lenovo.com

I'm not really convinced Leez is a vendor. Looks like branding to me.
We have enough with company names changing, we don't need changing
brands too. Use 'lenovo'.

Rob
