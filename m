From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 21:59:19 +0200
Message-ID: <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org> <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 9:14 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> On Tue, 2019-06-18 at 08:16 -0500, Alex Elder wrote:
> > On 6/17/19 6:28 AM, Johannes Berg wrote:
> > So getting back to your question, the IPA in its current form only
> > has a single "multiplexed" channel carried over the connection
> > between the AP and modem.  Previously (and in the future) there
> > was a way to add or remove channels.
>
> What would those channels do?
>
> I've not really been very clear with the differentiation between a
> channel and what's multiplexed inside of the channel.
>
> Using the terminology you defined in your other mail, are you saying
> that IPA (originally) allowed multiple *connections* to the device, or
> is there basically just one connection, with multiple (QMAP-muxed)
> *channels* on top of it?
>
> If the latter, why did IPA need ioctls, rather than rmnet?

>From my understanding, the ioctl interface would create the lower
netdev after talking to the firmware, and then user space would use
the rmnet interface to create a matching upper-level device for that.
This is an artifact of the strong separation of ipa and rmnet in the
code.

> > > The software bridging is very questionable to start with, I'd advocate
> > > not supporting that at all but adding tracepoints or similar if needed
> > > for debugging instead.
> >
> > To be honest I don't understand the connection between software
> > bridging and debugging, but that's OK.
>
> It's a mess. Basically, AFAICT, the only use for the rmnet bridging is
> in fact debugging. What it does, again AFAICT, is mirror out all the
> rmnet packets to the bridge if you attach it to a bridge, so that then
> you can attach another netdev to the bridge and forward all the rmnet
> packets to another system for debugging.
>
> It's a very weird way of doing this, IMHO.

My understanding for this was that the idea is to use it for
connecting bridging between distinct hardware devices behind
ipa: if IPA drives both a USB-ether gadget and the 5G modem,
you can use to talk to Linux running rmnet, but you can also
use rmnet to provide fast usb tethering to 5g and bypass the
rest of the network stack. That again may have been a wrong
guess on my part.

> > I believe the only QMAP commands are for doing essentially
> > XON/XOFF flow control on a single channel.  In the course of
> > the e-mail discussion in the past few weeks I've come to see
> > why that would be necessary.
>
> It does make sense, because you only have a single hardware (DMA)
> channel in these cases, so you implement flow control in software on
> top.
>
> (As I said before, the Intel modem uses different hardware channels for
> different sessions, so doesn't need something like this - the hardware
> ring just fills up and there's your flow control)

ipa definitely has multiple hardware queues, and the Alex'
driver does implement  the data path on those, just not the
configuration to enable them.

Guessing once more, I suspect the the XON/XOFF flow control
was a workaround for the fact that rmnet and ipa have separate
queues. The hardware channel on IPA may fill up, but user space
talks to rmnet and still add more frames to it because it doesn't
know IPA is busy.

Another possible explanation would be that this is actually
forwarding state from the base station to tell the driver to
stop sending data over the air.

       Arnd
