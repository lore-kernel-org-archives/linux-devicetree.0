From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v2 06/11] memory: atmel-ebi: add DT bindings documentation
Date: Fri, 7 Nov 2014 17:19:33 +0100
Message-ID: <CAAObsKDkqksPyidfQmcHtShd3u7AFOd1RwLh3FRWPus2KjnBQA@mail.gmail.com>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
 <1415203287-21517-7-git-send-email-boris.brezillon@free-electrons.com>
 <CAL_JsqJvT-gnr6AYHq42qfgS+ckZ1y6DFiPK5+-MBhHefB8_Sg@mail.gmail.com> <20141107164940.663f5423@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141107164940.663f5423@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Rob Herring <robherring2@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 7 November 2014 16:49, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 7 Nov 2014 09:21:39 -0600
> Rob Herring <robherring2@gmail.com> wrote:
>
>> On Wed, Nov 5, 2014 at 10:01 AM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>
>> Perhaps some commit msg?
>
> Yes, I was just lazy and though this series would make another round
> anyway :-).
>
> I'll add a commit log to all my commits...
>
>>
>> While this binding seems mostly okay to me, this is the 2nd memory
>> controller binding I've looked at in the last day [1]. There are
>> probably some others already as well. This makes me think we need a
>> generic binding here. At least the node structure and how we define
>> chip selects should be common.
>
> Sure.
> Any suggestion ?

I unfortunately cannot see much benefit to a generic binding, but
maybe that's because the one in T124 is a bit special? I'm very
interested in hearing proposals though.

Thanks,

Tomeu
