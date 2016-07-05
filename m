From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for Jun 27 (pinctrl && !CONFIG_OF)
Date: Tue, 5 Jul 2016 08:48:53 +0200
Message-ID: <CACRpkdbh8Z9UFWvq3jjoQayfhq7mYCoA_mkyH-MLrY5nrEfB5Q@mail.gmail.com>
References: <20160627163939.20e454d5@canb.auug.org.au> <57716D3D.4070302@infradead.org>
 <CACRpkdb2a=7QhW5A7yucC-DPo4NmNNcd3NcOznVtk0+8XMtbHA@mail.gmail.com> <577A8AE9.3010807@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <577A8AE9.3010807@infradead.org>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 4, 2016 at 6:12 PM, Randy Dunlap <rdunlap@infradead.org> wrote:

>> I merged it I think, Alex made a long series enabling compile
>> testing and I started to cherry-pick the first commits to let
>> them trickle in.
>
> I guess that when you do a git pull of a series of patches, you
> sign the pull commit but not each patch in the series?
> That could explain it.

I think I cherry-picked it actually. But yeah.

> I agree with Arnd that this particular commit should be reverted
> (1e4a80640338924b9f9fd7a121ac31d08134410a).

I've reverted it for fixes.

Yours,
Linus Walleij
