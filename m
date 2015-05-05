From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [Celinux-dev] Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Tue, 5 May 2015 09:34:08 +0200
Message-ID: <CAMuHMdV7xfbBYL5fhudObdwNVJ0L_1_h0ozT+U4Lpx=Mu9UGhw@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
	<5543EE80.5060109@landley.net>
	<CAL_JsqKkZYEMdYmh=JkA6O34a+7mKy=SgB2XxzgTM70mihgQeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKkZYEMdYmh=JkA6O34a+7mKy=SgB2XxzgTM70mihgQeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

On Tue, May 5, 2015 at 1:20 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, May 1, 2015 at 4:22 PM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
>> On 04/11/2015 02:20 PM, Rowand, Frank wrote:
>>> In recent years there have been proposed tools to aid in the creation of valid
>>> device trees and in debugging device tree issues.  An example of this is the
>>> various approaches proposed (with source code provided) to validate device tree
>>> source against valid bindings.  As of today, device tree related tools,
>>> techniques, and debugging infrastructure have not progressed very far.  I have
>>> submitted a device tree related proposal for the Linux Plumbers 2015 conference
>>> to spur action and innovation in such tools, techniques, and debugging
>>> infrastructure.
>>>
>>> The current title of the track is "Device Tree Tools, Validation, and
>>> Troubleshooting".  The proposal is located at
>>>
>>>    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting
>>
>> Want I want to do is:
>>
>> 1) Download an archive of device tree files describing a bunch of
>> boards. (Both dts and corresponding dtb files, with maybe a .txt telling
>> me about the board and the -append line qemu needs to give it any
>> board-specific kernel command line stuff like "console=myserialport".)
>
> The dts half is here[1]. It is a kernel repository automatically
> stripped of everything but dts files.
>
> [1] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

Great!

While "git log" has the "--nomerges" option, cgit hasn't, making it hard to see
the actual changes through the forest of merges.

Any chance merge commits not causing any changes can be stripped out, too?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
