From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Celinux-dev] Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Mon, 4 May 2015 18:20:35 -0500
Message-ID: <CAL_JsqKkZYEMdYmh=JkA6O34a+7mKy=SgB2XxzgTM70mihgQeQ@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
 <5543EE80.5060109@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5543EE80.5060109-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 1, 2015 at 4:22 PM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> On 04/11/2015 02:20 PM, Rowand, Frank wrote:
>> In recent years there have been proposed tools to aid in the creation of valid
>> device trees and in debugging device tree issues.  An example of this is the
>> various approaches proposed (with source code provided) to validate device tree
>> source against valid bindings.  As of today, device tree related tools,
>> techniques, and debugging infrastructure have not progressed very far.  I have
>> submitted a device tree related proposal for the Linux Plumbers 2015 conference
>> to spur action and innovation in such tools, techniques, and debugging
>> infrastructure.
>>
>> The current title of the track is "Device Tree Tools, Validation, and
>> Troubleshooting".  The proposal is located at
>>
>>    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting
>
> Want I want to do is:
>
> 1) Download an archive of device tree files describing a bunch of
> boards. (Both dts and corresponding dtb files, with maybe a .txt telling
> me about the board and the -append line qemu needs to give it any
> board-specific kernel command line stuff like "console=myserialport".)

The dts half is here[1]. It is a kernel repository automatically
stripped of everything but dts files.

> 2) Feed one of the dtb files to qemu to instantiate a bunch of devices.

I'd like this too. The QEMU maintainers don't really agree. I think
the ARM virt platform is the wrong way around with QEMU generating the
DT. There was a patch series to allow sysbus devices to be created on
the command line like you can with PCI. This would have allowed a
front end script to generate a QEMU command line from a DT. I'm not
sure if it ever got in.

It would lower the bar to adding new platforms to just writing models
for blocks perhaps. I'm not sure there's enough interest. The number
of ARM platforms supported in QEMU is much less than the kernel.

Rob

[1] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
