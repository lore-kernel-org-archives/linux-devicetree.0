From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 3/3] ARM: e3xx: Add header file for pinctrl constants
Date: Fri, 06 Nov 2015 21:28:53 +0100
Message-ID: <4489852.SMA0lELne9@wuerfel>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com> <4813305.v3X2DlHJmB@wuerfel> <CAAtXAHeQA2-XeK2n+ow8OC_s7_UcSBhxDN1NZyhc9M43F6KHpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHeQA2-XeK2n+ow8OC_s7_UcSBhxDN1NZyhc9M43F6KHpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 06 November 2015 09:55:28 Moritz Fischer wrote:
> On Fri, Nov 6, 2015 at 8:42 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Friday 06 November 2015 08:01:25 Moritz Fischer wrote:
> >> pins = E31X_TX_BANDSEL_2;
> >> output-low;
> >>
> >> in one .dts, while having something like
> >>
> >> pins = E33X_TX_BANDSEL_2
> >> output low;
> >>
> >> in the second dts
> >
> > That doesn't seem helpful though, because the assignment of the
> > pins is not hidden from the source file that should be documenting
> > it: if someone wants to know how the pins are muxed, they now have
> > to cross-reference the dts file with the header. If you just put the
> > pin number directly into the dts, it becomes completely clear
> > what the setting is.
> 
> Just to clarify, you're suggesting using "DB_0" etc in the dts file?
> At that point
> the name becomes kinda useless. I found the PINCTRL_PIN_ANON macro,
> but haven't found any use throughout the tree, is using it discouraged?

I don't know if that is the best approach, but it's better than using
macros here. You should only add a header file with macros if you
absolutely have to define a common namespace between the driver and the
dts files, but you don't do that here: the header file is only used
in one place.

	Arnd
