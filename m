From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 23:06:29 +0200
Message-ID: <CAK8P3a3r95gXMdq7s9GF=37v6t4kR+-2iyC6bnmUDVuM+bn80Q@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
 <36bca57c999f611353fd9741c55bb2a7@codeaurora.org> <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
 <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com>
 <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
 <CAK8P3a2nzZKtshYfomOOSYkqx5HdU15Wr9b+3va0B1euNhFOAg@mail.gmail.com>
 <dbb32f185d2c3a654083ee0a7188379e1f88d899.camel@sipsolutions.net>
 <d533b708-c97a-710d-1138-3ae79107f209@linaro.org> <abdfc6b3a9981bcdef40f85f5442a425ce109010.camel@sipsolutions.net>
 <CAK8P3a3ksrFTo2+dLB+doLeY+kPP7rYxv2O7BwvjYgK2cwCTuQ@mail.gmail.com>
 <97cbfb3723607c95d78e25785262ae7b0acdb11c.camel@sipsolutions.net>
 <CAK8P3a29+JKbDdS9ikhgaKa-AJ1qd1sDMTAfzivGh5wN4VL88A@mail.gmail.com> <54a5acb6cf26ebc6447f8ebcbdcb8e0eed693ab3.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <54a5acb6cf26ebc6447f8ebcbdcb8e0eed693ab3.camel@sipsolutions.net>
Sender: netdev-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 10:39 PM Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Tue, 2019-06-18 at 22:33 +0200, Arnd Bergmann wrote:

> It seems to me though that this is far more complex than what I'm
> proposing? What I'm proposing there doesn't even need any userspace
> involvement, as long as all the pieces are in the different sub-drivers,
> they'd fall out automatically.
>
> And realistically, the wwan_device falls out anyway at some point, the
> only question is if we really make one specific driver be the "owner" of
> it. I'm suggesting that we don't, and just make its lifetime depend on
> the links to parts it has (unless something like IPA actually wants to
> be an owner).

My feeling so far is that having the wwan_device be owned by a device
gives a nicer abstraction model that is also simpler for the common
case. A device driver like ipa would end up with a probe() function
that does does wwan_device_alloc/wwan_device_register, corresponding
to alloc_etherdev/register_netdev, and then communicates through
callbacks.

I agree the compound device case would get more complex by
shoehorning it into this model, but that can be a valid tradeoff
if it's the exceptional case rather than the common one.

      Arnd
