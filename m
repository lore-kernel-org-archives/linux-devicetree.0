From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: NVMEM address DT post processing [Was: Re: [PATCH net 0/3] add
 property "nvmem_macaddr_swap" to swap macaddr bytes order]
Date: Tue, 14 May 2019 16:13:22 +0100
Message-ID: <0c6cb9d4-2da1-00be-b527-5891b8b030a8@linaro.org>
References: <1557476567-17397-4-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-3-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-2-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-1-git-send-email-fugang.duan@nxp.com>
 <20190510112822.GT81826@meh.true.cz> <20190510113155.mvpuhe4yzxdaanei@flea>
 <20190511144444.GU81826@meh.true.cz>
 <547abcff-103a-13b8-f42a-c0bd1d910bbc@linaro.org>
 <20190513090700.GW81826@meh.true.cz>
 <8cee0086-7459-24c7-82f9-d559527df6e6@linaro.org>
 <20190513111612.GA21475@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190513111612.GA21475@meh.true.cz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Andy Duan <fugang.duan@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 13/05/2019 12:16, Petr Štetiar wrote:
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> [2019-05-13 11:06:48]:
> 
>> On 13/05/2019 10:07, Petr Štetiar wrote:
>>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> [2019-05-13 09:25:55]:
>>>
>>>> My initial idea was to add compatible strings to the cell so that most of
>>>> the encoding information can be derived from it. For example if the encoding
>>>> representing in your example is pretty standard or vendor specific we could
>>>> just do with a simple compatible like below:
>>>
>>> that vendor/compatible list would be quite long[1], there are hundreds of
>>
>> You are right just vendor list could be very long, but I was hoping that the
>> post-processing would fall in some categories which can be used in
>> compatible string.
>>
>> Irrespective of which we need to have some sort of compatible string to
>> enable nvmem core to know that there is some form of post processing to be
>> done on the cells!. Without which there is a danger of continuing to adding
>> new properties to the cell bindings which have no relation to each other.
> 
> makes sense, so something like this would be acceptable?
> 
>   eth1_addr: eth-mac-addr@18a {
>       /* or rather linux,nvmem-post-process ? */
>       compatible = "openwrt,nvmem-post-process";

I don't think this would be a correct compatible string to use here.
Before we decide on naming, I would like to understand bit more on what 
are the other possible forms of storing mac address,
Here is what I found,

Type 1: Octets in ASCII without delimiters. (Swapped/non-Swapped)
Type 2: Octets in ASCII with delimiters like (":", ",", ".", "-"... so 
on) (Swapped/non-Swapped)
Type 3: Is the one which stores mac address in Type1/2 but this has to 
be incremented to be used on other instances of eth.

Did I miss anything?
My suggestion for type1 and type2 would be something like this, as long 
as its okay with DT maintainers

eth1_addr: eth-mac-addr@18a {
	compatible = "ascii-mac-address";
	reg = <0x18a 2>, <0x192 2>, <0x196 2>, <0x200 2>, <0x304 2>, <0x306 2>;
	swap-mac-address;
	delimiter = ":";
};

For type 3:

This sounds like very much vendor specific optimization thing which am 
not 100% sure atm.
If dt maintainers are okay, may be we can add an increment in the 
"ascii-mac-address" binding itself.

Do you think "increment-at " would ever change?

>       reg = <0x189 0x11>;
>       indices = < 0 2
>                   3 2
>                   6 2
>                   9 2
>                  12 2
>                  15 2>;
>       transform = "ascii";
>       increment = <1>;
>       increment-at = <5>;
>       result-swap;

>   };
> 
>   &eth1 {
>       nvmem-cells = <&eth1_addr>;
>       nvmem-cell-names = "mac-address";
>   };
> 
>>> was very compeling as it would kill two birds with one stone (fix outstanding
>>> MTD/NVMEM OF clash as well[2]),
>>
>> Changes to nvmem dt bindings have been already rejected, for this more
>> discussion at: https://lore.kernel.org/patchwork/patch/936312/
> 
> I know, I've re-read this thread several times, but it's still unclear to me,
> how this should be approached in order to be accepted by you and by DT
> maintainers as well.
> 
> Anyway, to sum it up, from your point of view, following is fine?
> 
currently mtd already has support for nvmem but without dt support.

>   flash@0 {
>      partitions {
>          art: partition@ff0000 {
>              nvmem_dev: nvmem-cells {
>                  compatible = "nvmem-cells";
>                  eth1_addr: eth-mac-addr@189 {
>                      compatible = "openwrt,nvmem-post-process";
>                      reg = <0x189 0x6>;
>                      increment = <1>;
>                      increment-at = <5>;
>                      result-swap;
>                  };
>              };
>          };
>      };
>   };

This [1] is what I had suggested at the end, where in its possible to 
add provider node with its own custom bindings. In above example 
nvmem_dev would be a proper nvmem provider.

Thanks,
srini
[1] https://lkml.org/lkml/2018/6/7/972
> 
>   &eth1 {
>      nvmem = <&nvmem_dev>;
>      nvmem-cells = <&eth1_addr>;
>      nvmem-cell-names = "mac-address";
>   };
> 
> -- ynezz
> 
