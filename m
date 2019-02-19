Return-Path: <SRS0=Ydkx=Q2=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
 <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
 <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
 <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
Date: Tue, 19 Feb 2019 03:51:43 +0100
MIME-Version: 1.0
In-Reply-To: <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2/18/19 11:18 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> So what about
>>
>> gpios-states : Initial state of GPIO pins in "gpios" array, set on
>> system start and retained until consumer changes the state. 0: LOW, 1:
>> HIGH. Default is LOW if nothing else is specified.
> 
> No. "retained until consumer changes the state" is promising more then
> is guaranteed.
> 
> From the explanations provided by Mark it is clear that this property
> is an artifact of the implementation in linux. I think we should document
> is as such. How about:
> 
> gpios-states : On operating systems, that don't support reading back gpio
> 	       values in output mode (most notably linux), this array
> 	       provides the state of GPIO pins set when requesting them
> 	       from the gpio controller.

That's good.

> Systems, that are capable of
> 	       preserving state when requesting the lines, are free to
> 	       ignore this property.

Are they ? I think there are systems which depend on preconfiguring the
GPIO according to this property.

> 0: LOW, 1: HIGH. Default is LOW if
> 	       nothing else is specified.
> 
> HTH,
> Harald
> 


-- 
Best regards,
Marek Vasut
