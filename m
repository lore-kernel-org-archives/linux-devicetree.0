From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 3 Jun 2019 12:04:18 +0200
Message-ID: <CAK8P3a0brT0zyZGNWiS2R0RMHHFF2JG=_ixQyvjhj3Ky39o0UA@mail.gmail.com>
References: <20190531035348.7194-1-elder@linaro.org> <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org> <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org> <20190531233306.GB25597@minitux>
 <d76a710d45dd7df3a28afb12fc62cf14@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d76a710d45dd7df3a28afb12fc62cf14@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>, David Miller <davem@davemloft.net>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 1, 2019 at 1:59 AM Subash Abhinov Kasiviswanathan
<subashab@codeaurora.org> wrote:
> On 2019-05-31 17:33, Bjorn Andersson wrote:
> > On Fri 31 May 13:47 PDT 2019, Alex Elder wrote:
> >> On 5/31/19 2:19 PM, Arnd Bergmann wrote:
> > But any such changes would either be years into the future or for
> > specific devices and as such not applicable to any/most of devices on
> > the market now or in the coming years.
> >
> >
> > But as Arnd points out, if the software split between IPA and rmnet is
> > suboptimal your are encouraged to fix that.
>
> The split rmnet design was chosen because we could place rmnet
> over any transport - IPA, PCIe (https://lkml.org/lkml/2018/4/26/1159)
> or USB.
>
> rmnet registers a rx handler, so the rmnet packet processing itself
> happens in the same softirq when packets are queued to network stack
> by IPA.

I've read up on the implementation some more, and concluded that
it's mostly a regular protocol wrapper, doing IP over QMAP. There
is nothing wrong with the basic concept I think, and as you describe
this is an abstraction to keep the common bits in one place, and
have them configured consistently.

A few observations on more details here:

- What I'm worried about most here is the flow control handling on the
  transmit side. The IPA driver now uses the modern BQL method to
  control how much data gets submitted to the hardware at any time.
  The rmnet driver also uses flow control using the
  rmnet_map_command() function, that blocks tx on the higher
  level device when the remote side asks us to.
  I fear that doing flow control for a single physical device on two
  separate netdev instances is counterproductive and confuses
  both sides.

- I was a little confused by the location of the rmnet driver in
  drivers/net/ethernet/... More conventionally, I think as a protocol
  handler it should go into net/qmap/, with the ipa driver going
  into drivers/net/qmap/ipa/, similar to what we have fo ethernet,
  wireless, ppp, appletalk, etc.

- The rx_handler uses gro_cells, which as I understand is meant
  for generic tunnelling setups and takes another loop through
  NAPI to aggregate data from multiple queues, but in case of
  IPA's single-queue receive calling gro directly would be simpler
  and more efficient.

- I'm still not sure I understand the purpose of the layering with
  using an rx_handler as opposed to just using
  EXPORT_SYMBOL(rmnet_rx_handler) and calling that from
  the hardware driver directly.
  From the overall design and the rmnet Kconfig description, it
  appears as though the intention as that rmnet could be a
  generic wrapper on top of any device, but from the
  implementation it seems that IPA is not actually usable that
  way and would always go through IPA.

        Arnd
