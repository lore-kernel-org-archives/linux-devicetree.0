From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH v2] ARM: dts: rv1108: enable eMMC support
Date: Mon, 26 Nov 2018 09:58:49 -0200
Message-ID: <CAP9ODKoVG0ceSdRdpMz705=a9Wh0vubE6=ja=bwSF35ORzVOwA@mail.gmail.com>
References: <20181125211427.4926-1-otavio@ossystems.com.br> <2374110.cSv9E7W1qs@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2374110.cSv9E7W1qs@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2018 at 7:03 AM Heiko Stuebner <heiko@sntech.de> wrote:
> Am Sonntag, 25. November 2018, 22:14:27 CET schrieb Otavio Salvador:
> > Enable eMMC support for rv1108.dtsi as it can be used across multiple
> > boards.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> applied for 4.21 after reordering the emmc pinctrl nodes a bit
> and modifying the suject + commit message to be a bit more specific
> in that we only add the common pin settings.

Which tree is it applied? I'd like to rebase the patches on top of it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
