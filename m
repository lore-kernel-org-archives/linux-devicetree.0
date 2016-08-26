From: Milo Kim <woogyom.kim@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-h3: Add UART1 pinctrl
Date: Fri, 26 Aug 2016 17:00:37 +0900
Message-ID: <89195613-d5b6-bfc6-1c8c-0d74d9d02a99@gmail.com>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
 <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
 <20160826071056.GA10545@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160826071056.GA10545@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/26/2016 04:10 PM, Maxime Ripard wrote:
>> +			uart1_pins_a: uart1@0 {
>> > +				allwinner,pins = "PG6", "PG7";
>> > +				allwinner,function = "uart1";
>> > +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> > +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> > +			};
>> > +
> Our policy is that we don't introduce new pinctrl nodes that are not
> used by any board to avoid bloating the DT too much with unused nodes.
>
> If you have a board using it, please submit that change as well.

OK, I agree.

However, this pinmux is only useful in case PA5 is assigned for PWM.
PA5 is commonly used for UART0_RX, so I'd like to add UART1 node into 
*.dts and disable it (status = "disabled"). Does it make sense?

Best regards,
Milo
