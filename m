Return-Path: <SRS0=QsKN=QZ=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com> <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at> <75846117-242c-6861-ace5-dccf88711208@gmail.com> <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at> <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com> <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at> <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1245.1550528299.1@stardust.g4.wien.funkfeuer.at>
Date: Mon, 18 Feb 2019 23:18:19 +0100
Message-Id: <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marek Vasut writes:
> So what about
> 
> gpios-states : Initial state of GPIO pins in "gpios" array, set on
> system start and retained until consumer changes the state. 0: LOW, 1:
> HIGH. Default is LOW if nothing else is specified.

No. "retained until consumer changes the state" is promising more then
is guaranteed.

>From the explanations provided by Mark it is clear that this property
is an artifact of the implementation in linux. I think we should document
is as such. How about:

gpios-states : On operating systems, that don't support reading back gpio
	       values in output mode (most notably linux), this array
	       provides the state of GPIO pins set when requesting them
	       from the gpio controller. Systems, that are capable of
	       preserving state when requesting the lines, are free to
	       ignore this property. 0: LOW, 1: HIGH. Default is LOW if
	       nothing else is specified.

HTH,
Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
