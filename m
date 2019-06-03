From: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 03 Jun 2019 13:04:37 -0600
Message-ID: <c200581b8fc167f3a0c09ef6233b8d81@codeaurora.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <e75cd1c111233fdc05f47017046a6b0f0c97673a.camel@redhat.com>
 <065c95a8-7b17-495d-f225-36c46faccdd7@linaro.org>
 <CAK8P3a05CevRBV3ym+pnKmxv+A0_T+AtURW2L4doPAFzu3QcJw@mail.gmail.com>
 <a28c5e13-59bc-144d-4153-9d104cfa9188@linaro.org>
 <3b1e12b145a273dd3ded2864d976bdc5fa90e68a.camel@redhat.com>
 <87f98f81-8f77-3bc5-374c-f498e07cb1bd@linaro.org>
 <0fc29577a5c69530145b6095fa1ac1a51949ba8e.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0fc29577a5c69530145b6095fa1ac1a51949ba8e.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dcbw@redhat.com>
Cc: Alex Elder <elder@linaro.org>, Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, evgreen@chromium.org, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, abhishek.esse@gmail.com, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>> I can't (or won't) comment right now on whether IPA needs its own
>> netdev for rmnet to use.  The IPA endpoints used for the modem
>> network interfaces are enabled when the netdev is opened and
>> disabled when closed.  Outside of that, TX and RX are pretty
>> much immediately passed through to the layer below or above.
>> IPA currently has no other net device operations.
> 
> I don't really have issues with the patchset underneath the netdev
> layer. I'm interested in how the various bits present themselves to
> userspace, which is why I am trying to tie this in with Johannes'
> conversation about WWAN devices, netdevs, channels, and how the various
> drivers present API for creating data channels that map to different
> modem contexts.
> 
> So let me rephrase. If the control plane has set up the default context
> and sent a QMI Start Network message (or the network attached the
> default one) and the resulting IP details are applied to the IPA netdev
> can things just start sending data? Or do we need to create an rmnet on
> top to get that working?
> 
> Dan

Hi Dan

All data from the hardware will have the MAP headers.
We still need to create rmnet devs over the IPA netdev and use it for 
the
data path.
The IPA netdev will pass on the packets which it receives from the 
hardware
and queue it to network stack where it will be intercepted by the
rmnet rx handler.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
