From: Dan Williams <dcbw@redhat.com>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 19 Jun 2019 15:56:58 -0500
Message-ID: <414bc504bf62ea8de2ad195c00ce64dc0acb773c.camel@redhat.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
         <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
         <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
         <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
         <36bca57c999f611353fd9741c55bb2a7@codeaurora.org>
         <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
         <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com>
         <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
         <CAK8P3a2nzZKtshYfomOOSYkqx5HdU15Wr9b+3va0B1euNhFOAg@mail.gmail.com>
         <dbb32f185d2c3a654083ee0a7188379e1f88d899.camel@sipsolutions.net>
         <d533b708-c97a-710d-1138-3ae79107f209@linaro.org>
         <abdfc6b3a9981bcdef40f85f5442a425ce109010.camel@sipsolutions.net>
         <CAK8P3a3ksrFTo2+dLB+doLeY+kPP7rYxv2O7BwvjYgK2cwCTuQ@mail.gmail.com>
         <97cbfb3723607c95d78e25785262ae7b0acdb11c.camel@sipsolutions.net>
         <CAK8P3a29+JKbDdS9ikhgaKa-AJ1qd1sDMTAfzivGh5wN4VL88A@mail.gmail.com>
         <54a5acb6cf26ebc6447f8ebcbdcb8e0eed693ab3.camel@sipsolutions.net>
         <CAK8P3a3r95gXMdq7s9GF=37v6t4kR+-2iyC6bnmUDVuM+bn80Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3r95gXMdq7s9GF=37v6t4kR+-2iyC6bnmUDVuM+bn80Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Johannes Berg <johannes@sipsolutions.net>
Cc: Alex Elder <elder@linaro.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-18 at 23:06 +0200, Arnd Bergmann wrote:
> On Tue, Jun 18, 2019 at 10:39 PM Johannes Berg
> <johannes@sipsolutions.net> wrote:
> > On Tue, 2019-06-18 at 22:33 +0200, Arnd Bergmann wrote:
> > It seems to me though that this is far more complex than what I'm
> > proposing? What I'm proposing there doesn't even need any userspace
> > involvement, as long as all the pieces are in the different sub-
> > drivers,
> > they'd fall out automatically.
> > 
> > And realistically, the wwan_device falls out anyway at some point,
> > the
> > only question is if we really make one specific driver be the
> > "owner" of
> > it. I'm suggesting that we don't, and just make its lifetime depend
> > on
> > the links to parts it has (unless something like IPA actually wants
> > to
> > be an owner).
> 
> My feeling so far is that having the wwan_device be owned by a device
> gives a nicer abstraction model that is also simpler for the common
> case. A device driver like ipa would end up with a probe() function
> that does does wwan_device_alloc/wwan_device_register, corresponding
> to alloc_etherdev/register_netdev, and then communicates through
> callbacks.
> 
> I agree the compound device case would get more complex by
> shoehorning it into this model, but that can be a valid tradeoff
> if it's the exceptional case rather than the common one.

In my experience, the compound device model is by far the most
prevalent for regular Linux distros or anything *not* running on an SoC
with an integrated modem.

But it's also quite common for Android, no? drivers/net/ethernet/msm/
has rmnet and IPA ethernet drivers while arch/arm/mach-msm/ has various
SMD-related control channel drivers like smd_tty.c and smd_qmi.c and
smd_nmea.c. At least that's how I remember older SMD-based devices
being in the 8xxx and 9xxx time.

Ideally those setups can benefit from this framework as well, without
having to write entirely new composite drivers for those devices.

Dan
