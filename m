MIME-Version: 1.0
Date: Wed, 12 Jun 2019 17:23:25 -0600
References: <20190604003218.241354-1-saravanak@google.com>
	<20190604003218.241354-2-saravanak@google.com>
	<CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
	<570474f4-8749-50fd-5f72-36648ed44653@gmail.com>
	<CAGETcx8M3YkUBZ-e2LLfrbWgnMKMMNG5cv=p8MMmBe7ZyPJ7xw@mail.gmail.com>
	<20190611215242.GE212690@google.com>
	<CAL_Jsq+V9QUBpzmPyYjWe93-06-mpU=5JmUqvf-QsnuLxPnmUA@mail.gmail.com>
	<20190612142159.GA11563@kroah.com>
	<CAL_Jsq+x=_6jfC7hkHy+zAaPRB_3K7i9axRiBMHGE9mHQQtPtg@mail.gmail.com>
	<20190612170821.GA6396@kroah.com>
	<CAL_JsqJRPesdBQH7b7kDLs69pj7Ehw7DFx-pMA-eB2f+PY+Ngg@mail.gmail.com>
	<CAGETcx8tJREbq0DP_unPOYk-9S8T97EkRj+9+iC=uHc1QfrSpw@mail.gmail.com>
	<CAL_Jsq+D_isEk6M9QAK3rgr3U4BdmCViN6+8wanoFCPOA82GCQ@mail.gmail.com>
	<CAGETcx8wnOoKuvv+eRYKpndNG2OBCabyGigdvMhG_LPn5QqyFg@mail.gmail.com>
In-Reply-To: <CAGETcx8wnOoKuvv+eRYKpndNG2OBCabyGigdvMhG_LPn5QqyFg@mail.gmail.com>
Message-ID: <CAL_JsqJHxOyQHdA84YO333SKom5FMeoDi7NSxPDN-S9E9snHEw@mail.gmail.com>
Subject: Re: [RESEND PATCH v1 1/5] of/platform: Speed up of_find_device_by_node()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sandeep Patil <sspatil@android.com>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 12, 2019 at 4:11 PM Saravana Kannan <saravanak@google.com> wrot=
e:
> On Wed, Jun 12, 2019 at 2:12 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Wed, Jun 12, 2019 at 1:29 PM Saravana Kannan <saravanak@google.com> =
wrote:
> > > On Wed, Jun 12, 2019 at 11:19 AM Rob Herring <robh+dt@kernel.org> wro=
te:
> > > > On Wed, Jun 12, 2019 at 11:08 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > On Wed, Jun 12, 2019 at 10:53:09AM -0600, Rob Herring wrote:

[...]

> > > > > > As I said, DT *does* have this dependency information already. =
The
> > > > > > problem is the kernel probing doesn't use it. Fix that and then=
 we can
> > > > > > discuss dependencies the DT doesn't provide that the kernel nee=
ds.
> > > > >
> > > > > Where can the kernel probing be fixed to use it?  What am I missi=
ng that
> > > > > can be done instead of what this patchset does?
> > > >
> > > > Somewhere, either in each subsystem or in the DT or core code creat=
ing
> > > > struct devices, you need to iterate thru the dependencies. Take clo=
cks
> > > > as an example:
> > > >
> > > > for each node:
> > > >   for each 'clocks' phandle
> > > >     Lookup struct device from clock phandle
> > > >     Add the clock provider struct device to node's struct device li=
nks
> > > >
> > > > Now, repeat this for regulators, interrupts, etc.
> > >
> > > I'm more than happy to do this if the maintainers can accept this as =
a
> > > solution, but then we need to agree that we need an override property
>
> Can you please respond to this? For the clock controller example, we
> need to explicitly override the implied dependency because... see
> subsequent comments below.
> Can we at least agree to using "depends-on" as an override when the
> existing bindings don't properly define the mandatory dependencies? If
> it'll make you happy, we can even make it "does-not-depend-on".

I'm not saying I agree to any property yet, but I think this inverse makes =
more sense as it should be the exception.

> > > if the implicit dependency isn't a mandatory dependency. We also need
> > > to agree on how we do this without breaking backwards compatibility.
> > > Either as a config option for this feature or have a property in the
> > > "chosen" node to say it's okay to assume existing bindings imply
> > > mandatory dependencies (it's just describing the DT more explicitly
> > > and the kernel will use it to enable this feature).
> >
> > Thinking of the above example I gave, the problem is mandatory or not
> > can't be decided in the DT. It's a function of what the kernel
> > supports or not, so the kernel has to decide.
>
> That might be debatable for the example you gave, but it's certainly
> not debatable for some clock controllers (CC) that have cyclic
> dependencies. Only one of them can function without the other.
>
> > With a 'depends-on'
> > property, the value you'd want depends on which kernel do you boot.
>
> In the cases I'm thinking of, this has nothing to do with the kernel.
> CC1 supplies 50 clocks, 5 of which need input from CC2. CC2 supplies
> 10 clocks, all of them are dependent on 4 inputs from CC1. CC2 can
> never function without CC1. But in DT, they'll have a cyclic
> dependency if you go by clock bindings they list.

Can't the driver core detect the cycle and break it? Presumably the=20

Are you aware of=20

>
> > If
> > I'm booting a kernel with the pinctrl driver, then pinctrl is a
> > mandatory dependency. If I'm booting a kernel without the pinctrl
> > driver, then pinctrl is not a 'depends-on' dependency.
>
> The way I define depends-on, pinctrl will never be a dependency for
> this specific device (because you are saying it can function without
> it). The driver decides if it wants to -EPROBE_DEFER or not depending
> on the kernel. But I've beaten this horse to death. So, moving
> along...
>
> > Ignoring
> > dependencies like this case only works when things are built-in and
> > only for specific subsystems where it makes sense. It would be nice to
> > solve it for modules too, but that can be done later.
> >
> > There's also the case of dependencies where the driver decides how to
> > handle them. For example, UARTs will use DMA if the dmaengine driver
> > is available and that decision is (at least for some drivers I've
> > looked at) made on every open(). I suppose in that case, the driver
> > could remove the dependency link since it knows it can work with or
> > without DMA, though we'd need some sort of mechanism to do that.
>
> Now you are just going back to listing the examples I gave for why we
> need "depends-on" and why existing bindings aren't mandatory
> dependencies. Don't know if I should laugh or cry :)

If you listed this, I missed it. I've been out on vacation for 2 weeks. I d=
on't think we disagree on the problematic examples. If it wasn't by 'some s=
ort of mechanism', I was referring to within the OS or driver. A new driver=
 hook like the sync_state hook you added. DT doesn't help you here.

Think of 3 different OS's (or versions of the same OS) and the UART drivers=
 have 3 different capabilities:

- driver with PIO only
- driver with  PIO and DMA
- driver with DMA only

Those 3 OS's or versions all have to work with the same dtb. A 'depends-on'=
 property in DT will not work. It is driver specific knowledge. The OS core=
 is not going to know the driver's capabilities, so it can't add or remove =
dependencies. The driver would have to do it or have a chance to ignore the=
 dependency.

Rob
