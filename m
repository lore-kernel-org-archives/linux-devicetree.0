From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 12 Jun 2019 17:06:17 +0200
Message-ID: <CAK8P3a2nzZKtshYfomOOSYkqx5HdU15Wr9b+3va0B1euNhFOAg@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
 <36bca57c999f611353fd9741c55bb2a7@codeaurora.org> <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
 <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com> <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 4:28 PM Dan Williams <dcbw@redhat.com> wrote:
> On Wed, 2019-06-12 at 10:31 +0200, Arnd Bergmann wrote:
> > On Tue, Jun 11, 2019 at 7:23 PM Dan Williams <dcbw@redhat.com> wrote:
> I was trying to make the point that rmnet doesn't need to care about
> how the QMAP packets get to the device itself; it can be pretty generic
> so that it can be used by IPA/qmi_wwan/rmnet_smd/etc.

rmnet at the moment is completely generic in that regard already,
however it is implemented as a tunnel driver talking to another
device rather than an abstraction layer below that driver.

> > The current rmnet model is different in that by design the upper
> > layer
> > (rmnet) and the lower layer (qmi_wwan, ipa, ...) are kept independent
> > in
> > both directions, i.e. ipa has (almost) no knowledge of rmnet, and
> > just
> > has pointers to the other net_device:
> >
> >        ipa_device
> >            net_device
> >
> >        rmnet_port
> >            net_device
> >
> > I understand that the rmnet model was intended to provide a cleaner
> > abstraction, but it's not how we normally structure subsystems in
> > Linux, and moving to a model more like how wireless_dev works
> > would improve both readability and performance, as you describe
> > it, it would be more like (ignoring for now the need for multiple
> > connections):
> >
> >    ipa_dev
> >         rmnet_dev
> >                wwan_dev
> >                       net_device
>
> Perhaps I'm assuming too much from this diagram but this shows a 1:1
> between wwan_dev and "lower" devices.
>
> What Johannes is proposing (IIRC) is something a bit looser where a
> wwan_dev does not necessarily provide netdev itself, but is instead the
> central point that various channels (control, data, gps, sim card, etc)
> register with. That way the wwan_dev can provide an overall view of the
> WWAN device to userspace, and userspace can talk to the wwan_dev to ask
> the lower drivers (ipa, rmnet, etc) to create new channels (netdev,
> tty, otherwise) when the control channel has told the modem firmware to
> expect one.

Right, as I noted above, I simplified it a bit. We probably want to
have multiple net_device instances for an ipa_dev, so there has
to be a 1:n relationship instead of 1:1 at one of the intermediate
levels, but it's not obvious which level that should be.

In theory we could even have a single net_device instance correspond
to the ipa_dev, but then have multiple IP addresses bound to it,
so each IP address corresponds to a channel/queue/napi_struct,
but the user visible object remains a single device.

I trust that you and Johannes are more qualified than me to make
the call on that point.

       Arnd
