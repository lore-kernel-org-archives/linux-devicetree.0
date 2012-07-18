From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded
 tree
Date: Wed, 18 Jul 2012 12:24:15 +0100
Message-ID: <50069CDF.7000202@linaro.org>
References: <50066739.4010206@linaro.org> <20120718111226.GH22739@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20120718111226.GH22739@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 18/07/12 12:12, Mark Brown wrote:
> On Wed, Jul 18, 2012 at 08:35:21AM +0100, Lee Jones wrote:
>
> Fix your mailer to word wrap within paragraphs.  I've reformatted you=
r
> mail for legibility.

Does it always do that, or was it just this time? It's setup to=20
word-wrap, for instance this paragraph should. I have an add-on, which=20
disables wrapping, but I only enable that when I send individual patche=
s=20
out. I know it used to work, but I have a feeling it's broken.

>> I agree, but in this instance it really does stand to reason.
>
>> 1. No unified bindings currently exist.
>> 2. I don't have time to create them.
>> 3. It will probably take quite a bit of time for someone else to get
>>     round to creating them.
>> 4. The bindings I'm proposing are siloed by vendor and driver, so wi=
ll
>>     cause no harm.
>
> Right, this is just a restatement of the standard vendor line.
>
> If the issue is purely about having generic bindings quite frankly it=
's
> very hard to see how it could take much time or effort to handle the
> generic bits for I2C, it's basically just the maximum bus frequency a=
nd

The frequency is already a generic binding, it's the others which need=20
alignment.

> possibly also the various fast modes (though to a good approximation =
it
> seems reasonable to just infer them from the bus frequency and then s=
ee
> if we need any more).  One thing I frequently find is that people say
> any sort of generic work is hard without explaining why, if there are
> complex issues that's one thing but that's often not the case.

I didn't say it was hard, I was it was time consuming. It would require=
=20
looking at all of the other drivers and picking out bits which are the=20
same. An i2c guy would be better to do it. I didn't even know what the=20
nmk-i2c ones were (slsu, tft, rft, sm) until I was told my the author. =
I=20
fear the other drivers will be just as cryptic.

> BTW, looking at the platform data again it seems like i2c_freq_mode i=
t
> seems very odd that it's driver specific?

I agree.

>> 5. I've already volunteered to move them over to the unified ones on=
ce
>>     created.
>> 6. These allow support for the driver to work with DT, at the moment
>>     it does not.
>
>> Personally, I think there is more to be gained by applying the
>> (working) vendor specific bindings to the vendor specific driver unt=
il
>> some more consolidated ones appear.
>
> Again, vendors always make great promises about how they're going to
> keep everything up to date...

I'm not a vendor. I also keep my promises. :)

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
