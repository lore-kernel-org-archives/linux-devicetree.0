From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 1/3] of: Support parsing phandle argument lists
 through a nexus node
Date: Thu, 9 Feb 2017 15:35:26 +0000
Message-ID: <20170209153526.GF27312@n2100.armlinux.org.uk>
References: <20170123204851.12808-1-stephen.boyd@linaro.org>
 <20170123204851.12808-2-stephen.boyd@linaro.org>
 <5886F5ED.3030509@gmail.com>
 <CAL_JsqKS3Q2mg0aSubB3TV6LPQjCx+hqBu4TqbsqyfBvWrwctg@mail.gmail.com>
 <CAL_JsqKbkynNmCrXbi=VJ5wqYtRrYbC+00qSm_uyZFBLFOUz0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKbkynNmCrXbi=VJ5wqYtRrYbC+00qSm_uyZFBLFOUz0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 09:17:58AM -0600, Rob Herring wrote:
> Frank, any more comments on this? If not, I plan to apply this series.

Well, I find that a little annoying, because DT has the requirement
that new bindings are properly documented in Documentation, and it
appears that this comes with no documentation what so ever, despite
introducing new properties (like the -map-mask-passthru thing).

So I'm NAKing it until there's some documentation of how this
mechanism is supposed to work.

Merely providing an example in a commit log is (IMHO) insufficient.
An example doesn't explain how it was created, or how to create an
implementation.

Remember, we expect people to do exactly that, so we need to give
them this information so that they can make use of it.

I did try to work out from the code how the -map-mask thing worked,
but eventually gave up.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
