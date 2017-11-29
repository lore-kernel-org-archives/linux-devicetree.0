From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 13:48:28 -0800
Message-ID: <3b5c4519-69ec-b73a-70ac-a4ccdaee1501@gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch>
 <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Yeryomin <roman-9zmcapQ0v8Q@public.gmane.org>, Colin Leitner <colin.leitner-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/29/2017 01:28 PM, Linus Walleij wrote:
> On Wed, Nov 29, 2017 at 4:56 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>>> I have the phy-handle in the ethernet controller. This RTL8366RB
>>> thing is just one big PHY as far as I know.
>>
>> We don't model switches as PHYs. They are their own device type.  And
>> the internal or external PHYs are just normal PHYs in the linux
>> model. Meaning their interrupt properties goes in the PHY node in
>> device tree, as documented in the phy.txt binding documentation.
> 
> I do model the PHYs on the switch as PHYs.
> They are using the driver in drivers/phy/realtek.c.

That's good.

> 
> The interrupts are assigned to the PHYs not to the Switch.
> Just that the PHYs are on the MDIO bus inside the switch, of
> course.
> 
> The switch however provides an irqchip to demux the interrupts.
> 
> I think there is some misunderstanding in what I'm trying to do..
> 
> I have tried learning the DSA ideas by reading e.g. your paper:
> https://www.netdevconf.org/2.1/papers/distributed-switch-architecture.pdf
> 
> So I try my best to conform with these ideas.
> 
> I however have a hard time testing things since I don't really have a
> system to compare to. What would be useful is to know how
> commands like "ip" and "ifconfig" are used on a typical
> say home router.

There is a mock-up driver: drivers/net/dsa/dsa_loop.c which does not
pass any packets, but at least allows you to exercise user-space tools
and so on.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
