Return-Path: <SRS0=gY1q=Q2=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com> <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at> <75846117-242c-6861-ace5-dccf88711208@gmail.com> <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at> <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com> <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at> <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com> <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at> <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1385.1550571004.1@stardust.g4.wien.funkfeuer.at>
Date: Tue, 19 Feb 2019 11:10:04 +0100
Message-Id: <E1gw2Ll-0000MN-40@stardust.g4.wien.funkfeuer.at>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marek Vasut writes:
> On 2/18/19 11:18 PM, Harald Geyer wrote:
> > From the explanations provided by Mark it is clear that this property
> > is an artifact of the implementation in linux. I think we should document
> > is as such. How about:
> > 
> > gpios-states : On operating systems, that don't support reading back gpio
> > 	       values in output mode (most notably linux), this array
> > 	       provides the state of GPIO pins set when requesting them
> > 	       from the gpio controller.
> 
> That's good.
> 
> > Systems, that are capable of
> > 	       preserving state when requesting the lines, are free to
> > 	       ignore this property.
> 
> Are they ?

I think so. Also this seems to be what Mark wrote yesterday:

| With the GPIO API as it stands it is unfortunately not possible to
| preserve the state, if the API were fixed we'd preserve state.

> I think there are systems which depend on preconfiguring the
> GPIO according to this property.

These systems need to preconfigure the GPIOs in firmware anyway, so
they should be fine so long as the driver preserves state.

Since the original wording doesn't give any guarantees, I think the
new wording doesn't change anything. It just makes it clearer, that
there are no guarantees and that some drivers will happily overwrite
state when this property is absent.

Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
