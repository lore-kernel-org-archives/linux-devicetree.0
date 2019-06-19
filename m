From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 19 Jun 2019 14:23:16 +0200
Message-ID: <CAK8P3a3e+U85yHTeE4dHa4okLVHgBd8Kke9=FytzvMwz+wB0sQ@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org> <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
 <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
 <613cdfde488eb23d7207c7ba6258662702d04840.camel@sipsolutions.net>
 <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com> <6c70950d0c78bc02a3d016918ec3929e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c70950d0c78bc02a3d016918ec3929e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 11:15 PM Subash Abhinov Kasiviswanathan
<subashab@codeaurora.org> wrote:
>
> On 2019-06-18 14:55, Arnd Bergmann wrote:
> > On Tue, Jun 18, 2019 at 10:36 PM Johannes Berg
> > <johannes@sipsolutions.net> wrote:
> >>
> >> On Tue, 2019-06-18 at 21:59 +0200, Arnd Bergmann wrote:
> >> >
> >> > From my understanding, the ioctl interface would create the lower
> >> > netdev after talking to the firmware, and then user space would use
> >> > the rmnet interface to create a matching upper-level device for that.
> >> > This is an artifact of the strong separation of ipa and rmnet in the
> >> > code.
> >>
> >> Huh. But if rmnet has muxing, and IPA supports that, why would you
> >> ever
> >> need multiple lower netdevs?
> >
> > From my reading of the code, there is always exactly a 1:1 relationship
> > between an rmnet netdev an an ipa netdev. rmnet does the encapsulation/
> > decapsulation of the qmap data and forwards it to the ipa netdev,
> > which then just passes data through between a hardware queue and
> > its netdevice.
> >
>
> There is a n:1 relationship between rmnet and IPA.
> rmnet does the de-muxing to multiple netdevs based on the mux id
> in the MAP header for RX packets and vice versa.

Oh, so you mean that even though IPA supports multiple channels
and multiple netdev instances for a physical device, all the
rmnet devices end up being thrown into a single channel in IPA?

What are the other channels for in IPA? I understand that there
is one channel for commands that is separate, while the others
are for network devices, but that seems to make no sense if
we only use a single channel for rmnet data.

> >> Yeah, but if you actually have a hardware queue per upper netdev then
> >> you don't really need this - you just stop the netdev queue when the
> >> hardware queue is full, and you have flow control automatically.
> >>
> >> So I really don't see any reason to have these messages going back and
> >> forth unless you plan to have multiple sessions muxed on a single
> >> hardware queue.
> >
>
> Hardware may flow control specific PDNs (rmnet interfaces) based on QoS
> -
> not necessarily only in case of hardware queue full.

Right, I guess that makes sense if everything ends up in a
single queue in IPA.

      Arnd
