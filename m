From: Pacman du34 <pacmandu34-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FATAL ERROR: Unable to parse input tree
Date: Tue, 3 Jun 2014 16:35:39 +0200
Message-ID: <CAPH+8+giheV1kcuOAHvUWuDGRL4e2wRO95KJRxA9-o=TRVZ5FQ@mail.gmail.com>
References: <CAPH+8+gzCmV=tZOhq3DhYfWo6Pngcj+9XW3gNgCTV+qq5HnJ_Q@mail.gmail.com>
	<20140603130241.GC1310@leverpostej>
	<CAPH+8+iDZ3+bx5zU6aoGDH_tiKCPAf07QGymSRp0oB1W+_1=1Q@mail.gmail.com>
	<20140603133501.GD1310@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140603133501.GD1310@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-06-03 15:35 GMT+02:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Tue, Jun 03, 2014 at 02:25:25PM +0100, Pacman du34 wrote:
>> 2014-06-03 15:02 GMT+02:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
>> > On Tue, Jun 03, 2014 at 01:53:24PM +0100, Pacman du34 wrote:
>> >> Hello all,
>> >>
>> >> I am working on a new Linux port to a new architecture and I would like
>> >> to add a dts file to describe my system.
>> >>
>> >> So first of all I wrote the following dts test file :
>> >>
>> >> / {
>> >>     compatible = "manufacturer,cpu";
>> >> };
>> >>
>> >> I've read that this is the minimum structure required for a device tree
>> >> on the wiki.
>> >>
>> >> But when I try compiling it with dtc (the first line is the command
>> >> line) I get this error message :
>> >>
>> >> dtc -I dts -O dtb -o my_file.dtb myfile.dts
>> >>
>> >> Error: myfile.dts:1.1-2 syntax error
>> >> FATAL ERROR: Unable to parse input tree
>> >
>> > You're missing the DTS version. Try:
>> >
>> > /dts-v1/;
>> > / {
>> >         comaptible = "manufacturer,device";
>> > };
>> >
>> > Cheers,
>> > Mark.
>> >
>> >>
>> >> I tried both the dtc version of Linux source code (1.2.0-g37c0b6a0) and
>> >> dtc version installed with "apt-get install device-tree-compiler" (1.3.0).
>> >>
>> >> I searched on Google but I have not found relevant information for my issue.
>> >>
>> >> I really do not understand what the problem here and I am totally stuck.
>> >> Any help will be appreciated.
>> >>
>> >> Thanks a lot in advance.
>> >>
>> >> Best regards.
>>
>> That works, thank you very much,
>>
>> I take this opportunity to ask another question... As I have to
>> specify the DTS version, are there other versions, and if yes, what
>> are their differences ? I mean, if there are other versions, why to
>> choose the vesion 2 instead of 3 or 1 ?
>
> There was a v0 a while back according to ePAPR, but it's obsolete,
> incompatible and no-one uses it anymore (dtc doesn't support it as far
> as I can tell). The flag is to tell v1 apart from v0.
>
> There is not currently a v2 or later. Perhaps there might be in future,
> so it's worth keeping the flag around, but at present there's
> effectively only v1.
>
> Cheers,
> Mark.

Ok thank you very much again for your quick answer.

So I'll keep using v1 flag.

At the beginning of the porting, I was using a kernel version which
does not support Device Tree, I only had a C file to initialize the
drivers for my board. And I'm trying to understand how to add the
support of Device Tree to the kernel. Because now I have a dtb file,
but no message appears during the boot, showing that the kernel knows
it must read this file and use the matching device drivers.

I have seen that some manufacturers use "config USE_OF", in the
Kconfig file, to give the option to add device tree support when
compiling the kernel. So I added the same option, but I don't know how
to confirm that the kernel is now using device tree.

Will it appear some messages, during boot, that indicate the kernel is
really using it ?

Thanks again for your attention,

Best regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
