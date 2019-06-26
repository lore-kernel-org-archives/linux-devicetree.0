From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Wed, 26 Jun 2019 19:55:48 +0200
Message-ID: <98101e9d46604927e04735f3bb5c4fc8586e6a92.camel@sipsolutions.net>
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
 <e6ba8a9063e63506c0b88a70418d74ca4efe85cd.camel@sipsolutions.net>
 <850eed1d-0fec-c396-6e91-b5f1f8440ded@linaro.org>
 <84153d9e7c903084b492ceccc0dd98cbb32c12ac.camel@redhat.com>
 <7de004be-27b6-ac63-389d-8ea9d23d0361@linaro.org>
 <868e949b1fc8cf22307f579ab1f14543064bec20.camel@sipsolutions.net>
 <0f5c0332-6894-2fdd-fd25-7af9a21b445b@linaro.org>
 (sfid-20190626_153658_340951_528F9725)
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0f5c0332-6894-2fdd-fd25-7af9a21b445b@linaro.org>
 (sfid-20190626_153658_340951_528F9725)
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, syadagir@codeaurora.org, Eric Caruso <ejcaruso@google.com>, linux-arm-msm@vger.kernel.org, abhishek.esse@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, linux-soc@vger.kernel.org, David Miller <davem@davemloft.net>, cpratapa@codeaurora.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-26 at 08:36 -0500, Alex Elder wrote:
> 
> We need to identify the existence of a WWAN device (which is I
> guess--typically? always?--a modem).  Perhaps that can be
> discovered in some cases but I think it means a node described
> by Device Tree.

Yeah, perhaps that's something you could do. I'm not sure though. For
one, for USB devices, obviously it isn't :-) And even for IPA you might
want to support existing DTs I guess.

> So you're saying you have a single Ethernet driver, and it can
> drive an Ethernet device connected to a WWAN, or not connected
> to a WWAN, without any changes.  The only distinction is that
> if the device is part of a WWAN it needs to register with the
> WWAN framework.  Is that right?

That's what I'm thinking, and I believe (mostly from discussions with
Dan) that this actually exists.

> > > So maybe:
> > > - Hardware probe detects a WWAN device
> > > - The drivers that detect the WWAN device register it with the
> > >   WWAN core code.
> > > - A control channel is instantiated at/before the time the WWAN
> > >   device is registered
> > > - Something in user space should manage the bring-up of any
> > >   other things on the WWAN device thereafter
> > 
> > But those things need to actually get connected first :-)
> 
> What I meant is that the registering with the "WWAN core code"
> is what does that "connecting."  The WWAN code has the information
> about what got registered.  But as I said above, this WWAN device
> needs to be identified, and I think (at least for IPA) that will
> require something in Device Tree.  That will "connect" them.
> 
> Or I might be misunderstanding your point.

No, I think we're mostly agreeing, just thinking about different
scenarios. I think for IPA you don't really *need* anything in the DT
though - as soon as the IPA driver is loaded you know for sure you
actually have a modem there, and the IPA driver presumably loads based
on some existing probing (didn't look at it now).

Now, I don't know how the QMI channel to the modem is set up, so of
course you'd want a way of identifying that the two channels (IPA and
QMI) go to the same device and link them together in the WWAN framework.

> > If userspace actually had the ability to create (data) channels, then it
> > would have the ability to also remove them. Right now, this may or may
> > not be supported by the drivers that act together to form the interfaces
> > to a WWAN device.
> 
> I think this (user space control) needs to be an option, but
> it doesn't have to be the only way.

Agree.

johannes
