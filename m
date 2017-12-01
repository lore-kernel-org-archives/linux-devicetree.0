From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi:
 document new generic binding
Date: Fri, 1 Dec 2017 10:38:58 +0100
Message-ID: <CACRpkdZccQ98Qbw9BvAQZESc9X4UcY9DPz4LngzrhAHT78nSxA@mail.gmail.com>
References: <20171113012523.2328-1-andre.przywara@arm.com> <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
 <20171124105240.GB3792@ulmo> <20efcf8f-85a5-3cad-a84b-434ee5cad68e@arm.com>
 <20171124133123.GA15999@ulmo> <0c8051e6-5d8c-32d6-97e4-11c2283da5b4@arm.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARBNGGQTIQKGQEC63V4QI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0c8051e6-5d8c-32d6-97e4-11c2283da5b4-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 6:19 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> On 24/11/17 13:31, Thierry Reding wrote:

>> Register values don't belong in a device tree.
>
> I don't think that's true in a general way. This "pinmux" is already an
> accepted property and used for exactly that purpose in other pinctrl
> drivers:
> $ git grep -l '[^,]pinmux = ' arch/arm{,64}/boot/dts
> Plus the fsl,pinmux-ids property, which seems to serve the same purpose.

There are several examples of register values (and register
numbers even!) being encoded in the kernel.

What we need to ask is whether that is good in the general case
or bad. I don't even think that has a clear answer, it's a grey area.

So we need to avoid "arguments from consistency" which reads
something like "you allowed this thing A so now you must allow
this thing B which is similar". It is not a helpful approach to the
problem.

Some drivers encode a bunch of data into the device tree,
pinctrl-single is the most extreme. This conflict between in-DT
and in-driver data storage has been there since pinctrl was created
and was the result of a compromise between OMAPs needs
and everyone else, especially Tegra.

The opinions on this - and it is really opinions, not facts - differ
between people and over time.

Resolving the conflicts is more about classical diplomacy than
science unfortunately. I used to think the christian trinity was
amusing and inconsistent, but nowadays I understand exactly how
the people who came up with the Nicean creed were reasoning.

What is paramount for me as subsystem maintainer is the fact
that this driver has an active maintainer. And maintainers
is what makes things manageable for me. It would be much easier
for you to have your way if you were submitting an entirely
new driver. Like this pinmux property, it was submitted by the
mediatek people because it fits their usecase/hardware especially
well.

Yours,
Linus Walleij
