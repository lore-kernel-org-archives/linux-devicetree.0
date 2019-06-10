MIME-Version: 1.0
Date: Mon, 10 Jun 2019 15:17:27 -0600
References: <20190524010117.225219-1-saravanak@google.com>
	<bddb15c9-0195-13ca-e829-0a511595c84e@codeaurora.org>
In-Reply-To: <bddb15c9-0195-13ca-e829-0a511595c84e@codeaurora.org>
Message-ID: <CAL_JsqLtZYQLz=quF8t5E2r8rOErNsJRgJMVbYfHjs8xgoO1GQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: David Collins <collinsd@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, May 31, 2019 at 5:27 PM David Collins <collinsd@codeaurora.org> wro=
te:
>
> Hello Saravana,
>
> On 5/23/19 6:01 PM, Saravana Kannan wrote:
> ...
> > Having functional dependencies explicitly called out in DT and
> > automatically added before the devices are probed, provides the
> > following benefits:
> ...
> > - Supplier devices like clock providers, regulators providers, etc
> >   need to keep the resources they provide active and at a particular
> >   state(s) during boot up even if their current set of consumers don't
> >   request the resource to be active. This is because the rest of the
> >   consumers might not have probed yet and turning off the resource
> >   before all the consumers have probed could lead to a hang or
> >   undesired user experience.
> This benefit provided by the sync_state() callback function introduced in
> this series gives us a mechanism to solve a specific problem encountered
> on Qualcomm Technologies, Inc. (QTI) boards when booting with drivers
> compiled as modules.  QTI boards have a regulator that powers the PHYs fo=
r
> display, camera, USB, UFS, and PCIe.  When these boards boot up, the boot
> loader enables this regulator along with other resources in order to
> display a splash screen image.  The regulator must remain enabled until
> the Linux display driver has probed and made a request with the regulator
> framework to keep the regulator enabled.  If the regulator is disabled
> prematurely, then the screen image is corrupted and the display hardware
> enters a bad state.

Do you use the simple-framebuffer binding which provides for keeping necess=
ary clocks and regulators on? With that, the dependency information is alre=
ady in DT.

> We have observed that when the camera driver probes before the display
> driver, it performs this sequence: regulator_enable(), camera register IO=
,
> regulator_disable().  Since it is the first consumer of the shared
> regulator, the regulator is physically disabled (even though display
> hardware still requires it to be enabled).  We have solved this problem
> when compiling drivers statically with a downstream regulator
> proxy-consumer driver.  This proxy-consumer is able to make an enable
> request for the shared regulator before any other consumer.  It then
> removes its request at late_initcall_sync.

IMO, this part of the problem should be solved with priorities for driver p=
robing. It's not uncommon to want to bring up the display ASAP (in cases th=
e bootloader didn't) or ensure serial port is brought up before other drive=
rs (to reduce the need for earlycon). I'd be open to a DT property that ser=
ves as a hint (and only a hint). However, bringing up the dependencies is s=
till a separate problem.

> Unfortunately, when drivers are compiled as modules instead of compiled
> statically into the kernel image, late_initcall_sync is not a meaningful
> marker of driver probe completion.  This means that our existing proxy
> voting system will not work when drivers are compiled as modules.  The
> sync_state() callback resolves this issue by providing a notification tha=
t
> is guaranteed to arrive only after all consumers of the shared regulator
> have probed.

We should stop pretending that late_initcall_sync is a marker at all. This =
includes disabling clocks and regulators and any deferred probe handling.

I'm just repeating myself here. This isn't a new problem and there's been s=
everal attempts to address it all of which get similar feedback and go nowh=
ere. I'm doubtful that folks have read the past proposal discussions. In fa=
ct, this is the 2nd dependency property proposal in the last month or so.

Rob
