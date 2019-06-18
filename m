From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 09:00:57 -0500
Message-ID: <31c2c94c-c6d3-595b-c138-faa54d0bfc00@linaro.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>
Cc: abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/17/19 7:14 AM, Johannes Berg wrote:
> On Tue, 2019-06-11 at 13:56 +0200, Arnd Bergmann wrote:
> 
> [...]
> 
> Looking at the flags again,

I sort of talked about this in my message a little earlier, but I
now see I was partially mistaken.  I thought these flags were
used in messages but they're real device ("port") configuration
flags.

>> #define RMNET_FLAGS_INGRESS_DEAGGREGATION         (1U << 0)
> 
> This one I'm not sure I understand - seems weird to have such a
> fundamental thing as a *configuration* on the channel.

Let me use the term "connection" to refer to the single pathway
that carries data between the AP and modem.  And "channel" to
refer to one of several multiplexed data streams carried over
that connection.  (If there's better terminology, please say
so; I just want to be clear in what I'm talking about.)

Deaggregation is a connection property, not a channel property.
And it looks like that's exactly how it's used in the rmnet
driver.  The hardware is capable of aggregating QMAP packets
arriving on a connection into a single buffer, so this provides
a way of requesting it do that.

>> #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)
> 
> Similar here? If you have flow control you probably want to use it?

I agree with that, though perhaps there are cases where it
is pointless, or can't be supported, so one might want to
simply *not* implement/advertise the feature.  I don't know.

>> #define RMNET_FLAGS_INGRESS_MAP_CKSUMV4           (1U << 2)
> 
> This again looks like a hardware specific feature (ipv4 checksum)? Not
> sure why this is set by userspace.
> 
>> #define RMNET_FLAGS_EGRESS_MAP_CKSUMV4            (1U << 3)
> 
> This could be set with ethtool instead, I suppose.

As I said in my earlier message, I think I concur about this.
I think the IPA driver could easily hide the checksum offload
capability, and if it can truly be controlled as needed
using existing methods there's no need to encumber the
WWAN framework with it.

					-Alex


> johannes
> 
