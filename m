From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCHv2 1/2] Documentation: ad5592r: Added devicetree bindings
 documentation
Date: Sat, 31 Oct 2015 11:03:50 +0000
Message-ID: <5634A016.4020801@kernel.org>
References: <1444729080-9937-1-git-send-email-paul.cercueil@analog.com>
 <562CD9BD.6030206@kernel.org>
 <CACRpkdatEhs34y3D5evo-_rmG=pPb9LcdNWE+3zgnGqbZFh9hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdatEhs34y3D5evo-_rmG=pPb9LcdNWE+3zgnGqbZFh9hQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Cercueil <paul.cercueil@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Antonio Fiol <antonio@fiol.es>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27/10/15 16:13, Linus Walleij wrote:
> On Sun, Oct 25, 2015 at 2:31 PM, Jonathan Cameron <jic23@kernel.org> wrote:
>> On 13/10/15 10:37, Paul Cercueil wrote:
>>> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
>> Looks good to me, but as it is a little bit 'different' and we are
>> defining entirely new generic bindings (the channel modes stuff)
>> I would like some more input.  It might be overkill but we do
>> of course have the pinctl framework which covers this sort of
>> thing... Might be worth considering if using that to get the unified
>> bindings might make sense here...
>>
>> cc'd Linus in case he wants to comment on this.
>>
>> It would obviously be a very heavy weight solution to the problem
>> so I'm far from convinced it makes sense - or even fits the usecase
>> terrible well.  Just thought I'd mention the possibility.
> 
> There is something of a grey area between "definately pin control"
> and "some extra pin hardware duct-taped to something else".
> 
> I guess that is natural, life is full of grey areas...
> 
> Basically if there are plenty of pins and functions, local solutions
> to the problem will not scale. Then it is necessary to go ahead
> and implement full pin control. Especially for say a big BGA
> package or so with lots and lots of pins.
> 
> It is is a few pins or they just alter between similar functionality
> (like different graphic modes) I think local solutions are OK.
Thanks Linus.  Makes sense
