From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] crypto: qce: ice: Add support for Inline Crypto Engine
Date: Thu, 25 Oct 2018 10:45:25 -0500
Message-ID: <CAL_Jsq+26Avcb2cQHKKAnrf=H4J=jMfv6sxsqxdMnFZMUdUDLA@mail.gmail.com>
References: <1539789476-6098-1-git-send-email-anilc@codeaurora.org>
 <1539789476-6098-4-git-send-email-anilc@codeaurora.org> <20181025145548.GA30244@bogus>
 <20181025152856.GD4970@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025152856.GD4970@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, AnilKumar Chimata <anilc@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 10:29 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Thu, Oct 25, 2018 at 09:55:48AM -0500, Rob Herring wrote:
> > > +Introduction:
> > > +=============
> > > +Storage encryption has been one of the most required feature from security
> > > +point of view. QTI based storage encryption solution uses general purpose
> > > +crypto engine. While this kind of solution provide a decent amount of
> > > +performance, it falls short as storage speed is improving significantly
> > > +continuously. To overcome performance degradation, newer chips are going to
> > > +have Inline Crypto Engine (ICE) embedded into storage device. ICE is supposed
> > > +to meet the line speed of storage devices.
> >
> > Is ICE part of the storage device or part of the host as the binding
> > suggests?
>
> My understanding is that for this particular instantiation, the Inline
> Crypto Engine is located on the SOC.

Mine too, but that is not what this doc says.

> However, from the perspective of generic kernel support, the inline
> crypto support could be implemented on the SOC, or in the host bus
> adaptor, or as a "bump in the wire", or on the storage device.  And
> whatever abstract interface in the block layer should be able to
> support all of these cases.

Yes, certainly.

Rob
