From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 22:33:48 +0200
Message-ID: <CAK8P3a29+JKbDdS9ikhgaKa-AJ1qd1sDMTAfzivGh5wN4VL88A@mail.gmail.com>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
 <36bca57c999f611353fd9741c55bb2a7@codeaurora.org> <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
 <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com>
 <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
 <CAK8P3a2nzZKtshYfomOOSYkqx5HdU15Wr9b+3va0B1euNhFOAg@mail.gmail.com>
 <dbb32f185d2c3a654083ee0a7188379e1f88d899.camel@sipsolutions.net>
 <d533b708-c97a-710d-1138-3ae79107f209@linaro.org> <abdfc6b3a9981bcdef40f85f5442a425ce109010.camel@sipsolutions.net>
 <CAK8P3a3ksrFTo2+dLB+doLeY+kPP7rYxv2O7BwvjYgK2cwCTuQ@mail.gmail.com> <97cbfb3723607c95d78e25785262ae7b0acdb11c.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97cbfb3723607c95d78e25785262ae7b0acdb11c.camel@sipsolutions.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Alex Elder <elder@linaro.org>, Dan Williams <dcbw@redhat.com>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 10:15 PM Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Tue, 2019-06-18 at 22:09 +0200, Arnd Bergmann wrote:
> > > One is the whole multi-function device, where a single WWAN device is
> > > composed of channels offered by actually different drivers, e.g. for a
> > > typical USB device you might have something like cdc_ether and the
> > > usb_wwan TTY driver. In this way, we need to "compose" the WWAN device
> > > similarly, e.g. by using the underlying USB device "struct device"
> > > pointer to tie it together.
> > >
> > > The other is something like IPA or the Intel modem driver, where the
> > > device is actually a single (e.g. PCIe) device and just has a single
> > > driver, but that single driver offers different channels.
> >
> > I would hope we can simplify this to expect only the second model,
> > where you have a 'struct device' corresponding to hardware and the
> > driver for it creates one wwan_device that user space talks to.
>
> I'm not sure.
>
> Fundamentally, we have drivers in Linux for the ethernet part, for the
> TTY part, and for whatever other part might be in a given USB multi-
> function device.
>
> > Clearly the multi-function device hardware has to be handled somehow,
> > but it would seem much cleaner in the long run to do that using
> > a special workaround rather than putting this into the core interface.
>
> I don't think it really makes the core interface much more complex or
> difficult though, and it feels easier than writing a completely
> different USB driver yet again for all these devices?
>
> As far as I understand from Dan, sometimes they really are no different
> from a generic USB TTY and a generic USB ethernet, except you know that
> if those show up together it's a modem.
>
> > E.g. have a driver that lets you create a wwan_device by passing
> > netdev and a tty chardev into a configuration interface, and from that
> > point on use the generic wwan abstraction.
>
> Yeah, but where do you hang that driver? Maybe the TTY function is
> actually a WWAN specific USB driver, but the ethernet is something
> generic that can also work with pure ethernet USB devices, and it's
> difficult to figure out how to tie those together. The modules could
> load in completely different order, or even the ethernet module could
> load but the TTY one doesn't because it's not configured, or vice versa.

That was more or less my point: The current drivers exist, but don't
lean themselves to fitting into a new framework, so maybe the best
answer is not to try fitting them.

To clarify: I'm not suggesting to write new USB drivers for these at all,
but instead keep three parts that are completely unaware of each other
a)  a regular netdevice driver
b)  a regular tty driver
c)  the new wwan subsystem that expects a device to be created
    from a hardware driver but knows nothing of a) and b)

To connect these together, we need one glue driver that implements
the wwan_device and talks to a) and b) as the hardware. There are
many ways to do that. One way would be to add a tty ldisc driver.
A small user space helper opens the chardev, sets the ldisc
and then uses an ldisc specific ioctl command to create a wwan
device by passing an identifier of the netdevice and then exits.
>From that point on, you have a wwan device like any other.

       Arnd
