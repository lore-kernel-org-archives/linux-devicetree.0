From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 26 Jun 2019 08:51:02 -0500
Message-ID: <2d40bbcc-1d29-3aa7-e8cb-b0bc5835b8dc@linaro.org>
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
 <db34aa39-6cf1-4844-1bfe-528e391c3729@linaro.org>
 <CAK8P3a1ixL9ZjYz=pWTxvMfeD89S6QxSeHt9ZCL9dkCNV5pMHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1ixL9ZjYz=pWTxvMfeD89S6QxSeHt9ZCL9dkCNV5pMHQ@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Johannes Berg <johannes@sipsolutions.net>, Dan Williams <dcbw@redhat.com>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/24/19 11:40 AM, Arnd Bergmann wrote:
> On Mon, Jun 24, 2019 at 6:21 PM Alex Elder <elder@linaro.org> wrote:
>> On 6/18/19 2:03 PM, Johannes Berg wrote:
>>
>>> Really there are two possible ways (and they intersect to some extent).

. . .

>>> The other is something like IPA or the Intel modem driver, where the
>>> device is actually a single (e.g. PCIe) device and just has a single
>>> driver, but that single driver offers different channels.
>>
>> What I don't like about this is that it's more monolithic.  It
>> seems better to have the low-level IPA or Intel modem driver (or
>> any other driver that can support communication between the AP
>> and WWAN device) present communication paths that other function-
>> specific drivers can attach to and use.
> 
> I did not understand Johannes description as two competing models
> for the same code, but rather two kinds of existing hardware that
> a new driver system would have to deal with.

Based on my understanding of what he said in a message I just
responded to, I think you are exactly right.

. . .

> What we should try to avoid though is a way to add driver private
> interfaces that risk having multiple drivers create similar functionality
> in incompatible ways.

Agreed.

					-Alex
