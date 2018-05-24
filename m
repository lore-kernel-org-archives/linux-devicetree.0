From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] arcnet: com20020: bindings for smsc com20020
Date: Thu, 24 May 2018 09:36:36 -0500
Message-ID: <CAL_JsqL1M3SuH_cJGUhh0+Xg+UYDjAc-=a+USENOKznvWib1Ng@mail.gmail.com>
References: <20180517130628.2770-1-andrea.greco.gapmilano@gmail.com>
 <20180523164931.GA3635@rob-hp-laptop> <CAPoXtQJYmfk+-4qOpbEetUAdVwTgVPmk=mQaFv7yLF2V2dO=4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPoXtQJYmfk+-4qOpbEetUAdVwTgVPmk=mQaFv7yLF2V2dO=4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Cc: "Tobin C. Harding" <tobin@apporbit.com>, Andrea Greco <a.greco@4sigma.it>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 5:17 PM, Andrea Greco
<andrea.greco.gapmilano@gmail.com> wrote:
> On 05/23/2018 06:49 PM, Rob Herring wrote:
>> One typo, otherwise:
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Yes typo, Fixed over my branch, sorry for that...
> I expect a comment about bps, Bit per Second, used in `bus-speed-bps`
> You will add it by your self in property-units.txt, or required my patch?

If you want to add it, that's fine. But it's really not something that
comes up often. For UARTs, there's already the "current-speed"
property and most other things I can think of use Hz to express
speeds.

Rob
