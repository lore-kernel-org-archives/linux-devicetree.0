From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 12 Jun 2019 10:31:04 +0200
Message-ID: <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
 <36bca57c999f611353fd9741c55bb2a7@codeaurora.org> <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
Sender: netdev-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 7:23 PM Dan Williams <dcbw@redhat.com> wrote:
> On Tue, 2019-06-11 at 10:52 -0600, Subash Abhinov Kasiviswanathan wrote:
>
> rmnet should handle muxing the QMAP, QoS, and aggregation and pass the
> resulting packet to the lower layer. That lower layer could be IPA or
> qmi_wwan, which in turn passes that QMAP packet to USB or GSI or
> whatever. This is typically how Linux handles clean abstractions
> between different protocol layers in drivers.
>
> Similar to some WiFi drivers (drivers/net/wireless/marvell/libertas for
> example) where the same firmware interface can be accessed via PCI,
> SDIO, USB, SPI, etc. The bus-specific code is self-contained and does
> not creep into the upper more generic parts.

Yes, I think that is a good model. In case of libertas, we have multiple
layers inheritence from the basic device (slightly different in the
implementation,
but that is how it should be):

struct if_cs_card { /* pcmcia specific */
     struct lbs_private {  /* libertas specific */
           struct wireless_dev { /* 802.11 specific */
                  struct net_device {
                        struct device {
                              ...
                        };
                        ...
                  };
                  ...
           };
           ...
      };
      ...
};

The outer structure gets allocated when probing the hardware specific
driver, and everything below it is implemented as direct function calls
into the more generic code, or as function pointers into the more specific
code.

The current rmnet model is different in that by design the upper layer
(rmnet) and the lower layer (qmi_wwan, ipa, ...) are kept independent in
both directions, i.e. ipa has (almost) no knowledge of rmnet, and just
has pointers to the other net_device:

       ipa_device
           net_device

       rmnet_port
           net_device

I understand that the rmnet model was intended to provide a cleaner
abstraction, but it's not how we normally structure subsystems in
Linux, and moving to a model more like how wireless_dev works
would improve both readability and performance, as you describe
it, it would be more like (ignoring for now the need for multiple
connections):

   ipa_dev
        rmnet_dev
               wwan_dev
                      net_device

Where each layer is a specialization of the next. Note: this is a
common change when moving from proprietary code to upstream
code. If a driver module is designed to live out of tree, there
is a strong incentive to limit the number of interfaces it uses,
but when it gets merged, it becomes much more flexible, as
an internal interface between wwan_dev and the hardware driver(s)
can be easily changed by modifying all drivers at once.

       Arnd
