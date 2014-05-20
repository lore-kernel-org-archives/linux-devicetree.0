From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Tue, 20 May 2014 15:37:29 -0300
Message-ID: <20140520183729.GA17353@arch.cereza>
References: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAL_JsqJKDFJDsGbhB-=W=ujgoRpnJGcJ9a74uhHjj4KFvRK=gg@mail.gmail.com>
 <20140520065014.493C3C412E3@trevor.secretlab.ca>
 <CAL_JsqJHhJ1ba5tOGnsNNp1DhPwnJWh8F9f2xL8b3FYj=kC1hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJHhJ1ba5tOGnsNNp1DhPwnJWh8F9f2xL8b3FYj=kC1hA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guido =?iso-8859-1?Q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 May 01:30 PM, Rob Herring wrote:
> On Tue, May 20, 2014 at 1:50 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Sun, 18 May 2014 18:11:07 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> On Sun, May 18, 2014 at 12:01 PM, Ezequiel Garcia
> >> <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> >> > When creating a device object for a devicetree node, the device name
> >> > is created by using the node name and the 'reg' property, to make a name
> >> > such as "a000.foo_device".
> >> >
> >> > For certain devices without an associated address, and hence no 'reg' property,
> >> > the current code attempts to make a unique name, by using a global integer.
> >> > Names look like "foo_device.1", "bar_device.2", and so on.
> >> > Examples of such devices are: gpio-keys', backlights and rotary-encoders.
> >> >
> >> > The system cannot know such devices name before hand, given they are determined
> >> > by the kernel probe order and by the nodes present in the devicetree. This can
> >> > be problematic, on systems that are tied to the device's name, e.g. when
> >> > catching hotplug events.
> >
> > The device's uevent file in sysfs contains both the ->name and
> > ->full_name values for a node. Does that help you?
> >
> > The big problem is not the structure under /sys/devices, but rather the
> > symlinks to devices that appear under /sys/bus/*/devices. If two leaf
> > nodes have the same name, then they will conflict when they get added to
> > a bus_type's array of devices.
> >
> > Another way to handle it is to only add the suffix when a conflict
> > actually occurs. That requires checking first whether or not a name will
> > conflict and ammending it only when that happens. I don't know if that
> > can be done nicely. I'll take a look.
> 
> That was my idea as well and to move to a local number so you have
> something like deviceA, deviceA.1, deviceB, deviceB.1 (maybe the
> number is always appended). Perhaps a random number instead so no one
> expects the names to be an ABI. ;)
> 
> I think it should be doable.
> 

That would be very nice :)
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
