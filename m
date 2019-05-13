From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: NVMEM address DT post processing [Was: Re: [PATCH net 0/3] add
 property "nvmem_macaddr_swap" to swap macaddr bytes order]
Date: Mon, 13 May 2019 09:25:55 +0100
Message-ID: <547abcff-103a-13b8-f42a-c0bd1d910bbc@linaro.org>
References: <1557476567-17397-4-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-3-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-2-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-1-git-send-email-fugang.duan@nxp.com>
 <20190510112822.GT81826@meh.true.cz> <20190510113155.mvpuhe4yzxdaanei@flea>
 <20190511144444.GU81826@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190511144444.GU81826@meh.true.cz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Andy Duan <fugang.duan@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/05/2019 15:44, Petr Štetiar wrote:
>          };
>   
> +Another example where we've MAC address for eth1 stored in the NOR EEPROM as
> +following sequence of bytes (output of hexdump -C /dev/mtdX):
> +
> + 00000180  66 61 63 5f 6d 61 63 20  3d 20 44 34 3a 45 45 3a  |fac_mac = D4:EE:|
> + 00000190  30 37 3a 33 33 3a 36 43  3a 32 30 0a 42 44 49 4e  |07:33:6C:20.BDIN|
> +
> +Which means, that MAC address is stored in EEPROM as D4:EE:07:33:6C:20, so
> +ASCII delimited by colons, but we can't use this MAC address directly as
> +there's only one MAC address stored in the EEPROM and we need to increment last
> +octet/byte in this address in order to get usable MAC address for eth1 device.
> +
> + eth1_addr: eth-mac-addr@18a {
> +     reg = <0x18a 0x11>;
> +     byte-indices = < 0 2
> +                      3 2
> +                      6 2
> +                      9 2
> +                     12 2
> +                     15 2>;
> +     byte-transform = "ascii";
> +     byte-increment = <1>;
> +     byte-increment-at = <5>;
> +     byte-result-swap;


> + };
> +
> + &eth1 {
> +     nvmem-cells = <&eth1_addr>;
> +     nvmem-cell-names = "mac-address";
> + };
> +
>   = Data consumers =
>   Are device nodes which consume nvmem data cells/providers.

TBH, I have not see the full thread as I don't seem to be added to the 
original thread for some reason!

Looking at the comments from last few emails, I think the overall idea 
of moving the transformations in to nvmem core looks fine with me. I 
remember we discuss this while nvmem was first added and the plan was to 
add some kinda nvmem plugin/transformation interface at cell/provider 
level. And this looks like correct time to introduce this.

My initial idea was to add compatible strings to the cell so that most 
of the encoding information can be derived from it. For example if the 
encoding representing in your example is pretty standard or vendor 
specific we could just do with a simple compatible like below:

eth1_addr: eth-mac-addr@18a {
	compatible = "xxx,nvmem-mac-address";
	reg = <0x18a 0x11>;	
};

&eth1 {
	nvmem-cells = <&eth1_addr>;
	nvmem-cell-names = "mac-address";
}

thanks,
srini
