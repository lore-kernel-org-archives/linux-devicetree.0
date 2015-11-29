From: Vishnu Patekar <vishnupatekar0510@gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: sunxi: Introduce Allwinner for A83T support
Date: Sun, 29 Nov 2015 20:02:44 +0800
Message-ID: <CAEzqOZuRPcwcv2=Ni82GMyYnTnKHrZWtk3QOZZBQC5KYkd3J8w@mail.gmail.com>
References: <1445557577-27383-1-git-send-email-vishnupatekar0510@gmail.com>
 <1445557577-27383-2-git-send-email-vishnupatekar0510@gmail.com> <CAGb2v645Bwzdc1Uq0sR9SWqQH4htiO6qyPs28Hc5iOiJffXDHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAGb2v645Bwzdc1Uq0sR9SWqQH4htiO6qyPs28Hc5iOiJffXDHQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Linus Walleij <linus.walleij@linaro.org>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,
Sorry for delayed response.

On Fri, Oct 23, 2015 at 9:37 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Fri, Oct 23, 2015 at 7:46 AM, Vishnu Patekar
> <vishnupatekar0510@gmail.com> wrote:
>> Allwinner A83T is octa-core cortex-a7 based SoC.
>> It's clock control unit and prcm, pinmux are different from previous sun8i
>> series.
>> Its processor cores are arragned in two clusters 4 cores each,
>> similar to A80.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>
> Could you also update Documentation/arm/sunxi/README, so it says A83T
> is supported?
I'll update and send next version.
>
> Otherwise,
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
