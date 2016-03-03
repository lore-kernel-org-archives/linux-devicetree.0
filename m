From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 14/17] arm: boot: dts: Add PLX Technology OX810SE dtsi
Date: Thu, 03 Mar 2016 13:15:20 +0100
Message-ID: <2983013.zAxmIfv4bz@wuerfel>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com> <1457005210-18485-15-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457005210-18485-15-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Thursday 03 March 2016 12:40:07 Neil Armstrong wrote:
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +	};
>
Please put the aliases in the per-board file and list only the
devices that are actually connected (in case of uart)

> +			uart0: uart@200000 {

Make this serial@200000, to follow the standard naming convention

> +
> +				reset: reset-controller {
> +					compatible = "plxtech,nas782x-reset";
> +					#reset-cells = <1>;
> +				};
> +
> +				stdclk: stdclk {
> +					compatible = "plxtech,ox810se-stdclk", "plxtech,nas782x-stdclk";
> +					#clock-cells = <1>;
> +				};
> +			};

Please change the compatible strings to have no 'x' wildcards in them, but
instead use a specific model.

Regarding the vendor prefixes, my understanding is that "ox810se" was the name
of the chip from Oxford Semiconductor, while nas7820 is a product name from
PLX. I think it would be logical to use "oxford" as the vendor prefix
for anything with a ox810se or ox820 ID in it rather than plxtech.

Note that both of them are now historic, as PLX itself got bought by
Avago and they seem to be discontinuing both the PLX and Oxfor brand
names.

	Arnd
