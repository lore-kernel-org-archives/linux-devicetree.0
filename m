From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 24 Jun 2019 11:21:50 -0500
Message-ID: <5ffbcce1-f93d-5746-5037-9dcc03cd73f0@linaro.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
 <31c2c94c-c6d3-595b-c138-faa54d0bfc00@linaro.org>
 <b90977f94df020986c6bb490e7fd0262603726b0.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <b90977f94df020986c6bb490e7fd0262603726b0.camel@sipsolutions.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>
Cc: abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/18/19 2:22 PM, Johannes Berg wrote:
> On Tue, 2019-06-18 at 09:00 -0500, Alex Elder wrote:

. . .

> Anyway, I think for now we could probably live with not having this
> configurable for the IPA driver, and if it *does* need to be
> configurable, it seems like it should be a driver configuration, not a
> channel configuration - so something like a debugfs hook if you really
> just need to play with it for performance testing, or a module
> parameter, or something else?
> 
> Or even, in the WWAN framework, a knob that we provide there for the
> WWAN device, rather than for the (newly created) channel.

Agreed.  I think a knob is appropriate, it's just a question of how
that control exposed.  Same answer to your question below.

					-Alex

>> The hardware is capable of aggregating QMAP packets
>> arriving on a connection into a single buffer, so this provides
>> a way of requesting it do that.
>>
>>>> #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)
>>>
>>> Similar here? If you have flow control you probably want to use it?
>>
>> I agree with that, though perhaps there are cases where it
>> is pointless, or can't be supported, so one might want to
>> simply *not* implement/advertise the feature.  I don't know.
> 
> Sure, but then that's likely something the driver would need to know,
> not necessarily userspace?
> 
> johannes
> 
