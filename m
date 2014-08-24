From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Sun, 24 Aug 2014 18:43:35 -0500
Message-ID: <CAL_JsqLGdZRFXni0Y5Loij3FVfw8RzaizNaRA+_hccXz0opkKw@mail.gmail.com>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
 <CAL1qeaGb-o0P7x4nZPJ+dGfoSKz+2ANrB0gGrBi19TtPxVTAZQ@mail.gmail.com>
 <20140823063113.GC23715@localhost> <201408231556.42571.arnd@arndb.de> <20140823161456.GA2758@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140823161456.GA2758@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 23, 2014 at 11:14 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Sat, Aug 23, 2014 at 03:56:42PM +0200, Arnd Bergmann wrote:
>> On Saturday 23 August 2014, Olof Johansson wrote:
>> > On Fri, Aug 22, 2014 at 02:10:23PM -0700, Andrew Bresticker wrote:
>> > > On Fri, Aug 22, 2014 at 1:42 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > > >
>> > > > On Aug 21, 2014 3:05 PM, "Andrew Bresticker" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > > > >
>> > > > > To be consistent with other architectures and to avoid unnecessary
>> > > > > makefile duplication, move all MIPS device-trees to arch/mips/boot/dts
>> > > > > and build them with a common makefile.
>> > > >
>> > > > I recall reading that the ARM organization for DTS files was a bit unfortunate
>> > > > and should have been something like:
>> > > >
>> > > > arch/arm/boot/dts/<vendor>/
>> > > >
>> > > > Is this something we should do for the MIPS and update the other architectures
>> > > > to follow that scheme?
>> > >
>> > > I recall reading that as well and that it would be adopted for ARM64,
>> > > but that hasn't seemed to have happened.  Perhaps Olof (CC'ed) will no
>> > > more.
>> >
>> > Yeah, I highly recommend having a directory per vendor. We didn't on ARM,
>> > and the amount of files in that directory is becoming pretty
>> > insane. Moving to a subdirectory structure later gets messy which is
>> > why we've been holding off on it.
>>
>> Another argument is that we plan to actually move all the dts files out of
>> the kernel into a separate project in the future. We really don't want to
>> have the churn of moving all the files now when they get deleted in one
>> of the next merge windows.
>
> To be honest, I don't see that happening within the forseeable
> future. Some of us maintainers like talking about this, but everyone who
> actually develops have nightmares about this scenario. Nobody knows how
> it'll be done without causing some real serious impact on productivity.
>
>> I don't know if we talked about whether that move should be done for
>> all architectures at the same time. If that is the plan, I think it
>> would be best to not move the MIPS files at all but also wait until
>> they can get removed from the kernel tree.
>
> If MIPS can restructure now before things start growing, then I'd really
> recommend that they do so and not hold off waiting on some event that
> might never happen. :)

Yes, I agree on both points.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
