From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 17 Jun 2019 14:14:21 +0200
Message-ID: <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
         <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
         <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
         (sfid-20190611_135708_651569_0097B773)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com> (sfid-20190611_135708_651569_0097B773)
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-11 at 13:56 +0200, Arnd Bergmann wrote:

[...]

Looking at the flags again,

> #define RMNET_FLAGS_INGRESS_DEAGGREGATION         (1U << 0)

This one I'm not sure I understand - seems weird to have such a
fundamental thing as a *configuration* on the channel.

> #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)

Similar here? If you have flow control you probably want to use it?

> #define RMNET_FLAGS_INGRESS_MAP_CKSUMV4           (1U << 2)

This again looks like a hardware specific feature (ipv4 checksum)? Not
sure why this is set by userspace.

> #define RMNET_FLAGS_EGRESS_MAP_CKSUMV4            (1U << 3)

This could be set with ethtool instead, I suppose.

johannes
