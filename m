From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: Add rk3288 vyasa board
Date: Fri, 1 Sep 2017 22:36:08 +0530
Message-ID: <CAD6G_RSR35sX2x8xpdht0XUbnjeEBML9bxwCqtHYC7oM5fazEA@mail.gmail.com>
References: <1503742164-3926-1-git-send-email-jteki@openedev.com> <20170831210421.l2zmpexisagoxdks@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831210421.l2zmpexisagoxdks@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Trimarchi <michael@amarulasolutions.com>, linux-rockchip@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 1, 2017 at 2:34 AM, Rob Herring <robh@kernel.org> wrote:
> On Sat, Aug 26, 2017 at 03:39:24PM +0530, Jagan Teki wrote:
>> From: Jagan Teki <jagan@amarulasolutions.com>
>>
>> This patch adds initial support for rk3288 based
>> Vyasa board, which is made by Amarula Solutions.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>> Changes for v2:
>> - Added entry in Documentation/devicetree/bindings/arm/rockchip.txt
>>
>>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>>  arch/arm/boot/dts/Makefile                         |   3 +-
>>  arch/arm/boot/dts/rk3288-vyasa.dts                 | 312 +++++++++++++++++++++
>>  3 files changed, 318 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/rk3288-vyasa.dts
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> I assume the regulator node names are consistent with other platforms,
> but at some point please fix them to be lowercase and not use '_'. IOW,
> build the dtbs with "W=2" and fix the warnings.

Out-off these [1], only /i2c@ff650000 and  /memory are related to this
dts and these are consistent across rk3288 dts node name, so there is
nothing that I can fix here. If not please let me know if you find
any.

[1] https://paste.ubuntu.com/25445917/

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
