From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 22:36:35 +0200
Message-ID: <613cdfde488eb23d7207c7ba6258662702d04840.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
         <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
         <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
         <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
         <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org>
         <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
         <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
         (sfid-20190618_215938_912601_E3CB8D3C)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com> (sfid-20190618_215938_912601_E3CB8D3C)
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-18 at 21:59 +0200, Arnd Bergmann wrote:
> 
> From my understanding, the ioctl interface would create the lower
> netdev after talking to the firmware, and then user space would use
> the rmnet interface to create a matching upper-level device for that.
> This is an artifact of the strong separation of ipa and rmnet in the
> code.

Huh. But if rmnet has muxing, and IPA supports that, why would you ever
need multiple lower netdevs?

> > > > The software bridging [...]
> 
> My understanding for this was that the idea is to use it for
> connecting bridging between distinct hardware devices behind
> ipa: if IPA drives both a USB-ether gadget and the 5G modem,
> you can use to talk to Linux running rmnet, but you can also
> use rmnet to provide fast usb tethering to 5g and bypass the
> rest of the network stack. That again may have been a wrong
> guess on my part.

Hmm. Interesting. It didn't really look to me like that, but I'm really
getting lost in the code. Anyway, it seems weird, because then you'd
just bridge the upper netdev with the other ethernet and don't need
special logic? And I don't see how the ethernet headers would work with
this now.

> ipa definitely has multiple hardware queues, and the Alex'
> driver does implement  the data path on those, just not the
> configuration to enable them.

OK, but perhaps you don't actually have enough to use one for each
session?

> Guessing once more, I suspect the the XON/XOFF flow control
> was a workaround for the fact that rmnet and ipa have separate
> queues. The hardware channel on IPA may fill up, but user space
> talks to rmnet and still add more frames to it because it doesn't
> know IPA is busy.
> 
> Another possible explanation would be that this is actually
> forwarding state from the base station to tell the driver to
> stop sending data over the air.

Yeah, but if you actually have a hardware queue per upper netdev then
you don't really need this - you just stop the netdev queue when the
hardware queue is full, and you have flow control automatically.

So I really don't see any reason to have these messages going back and
forth unless you plan to have multiple sessions muxed on a single
hardware queue.

And really, if you don't mux multiple sessions onto a single hardware
queue, you don't need a mux header either, so it all adds up :-)

johannes
