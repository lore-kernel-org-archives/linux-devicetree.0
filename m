From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 5/6] sunxi: video: Add simplefb support
Date: Mon, 17 Nov 2014 09:58:20 +0000
Message-ID: <CACxGe6vE0BdWOrdw1iQyk2-tmdnAUZ=oQCvGg_LESoiw055DLw@mail.gmail.com>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>
 <1415984088-6800-6-git-send-email-hdegoede@redhat.com> <1416138607.25454.13.camel@hellion.org.uk>
 <5468AC2E.80601@redhat.com> <1416148688.25454.22.camel@hellion.org.uk>
 <5468BE9A.8050501@redhat.com> <1416154297.25454.24.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416154297.25454.24.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 16, 2014 at 4:11 PM, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> wrote:
> On Sun, 2014-11-16 at 16:11 +0100, Hans de Goede wrote:
>> On 11/16/2014 03:38 PM, Ian Campbell wrote:
>> > On Sun, 2014-11-16 at 14:52 +0100, Hans de Goede wrote:
>> >> Hardcoding a path is deliberate. I don't know if you've read the
>> >> previous u-boot code for this, but it did a lot of dt parsing to
>> >> find clocks and add phandles to them, the way we eventually settled
>> >> on when discussing this is for the dts to contain pre-populated simplefb
>> >> nodes which u-boot just needs to fill with the mode info and enable, this
>> >> way as we add support for more clocks (like the module clocks for the
>> >> various display pipeline blocks), we don't need to update u-boot in lock-step,
>> >> we just add the clocks to the simplefb node in the dts file when they get
>> >> added to the dts file in the first place. See the updated bindings.
>> >
>> > AFAICT this in no way invalidates what I suggested. There's no reason
>> > why the need to populate/tweak a pre-existing node should have anything
>> > to do with where the node is in the device-tree.
>>
>> Right, I forgot to add one important bit to my explanation, sorry, if
>> you look at the binding then it says that the name should be suffixed
>> with the output type, so currently the sunxi u-boot code will look for
>> /chosen/framebuffer0-hdmi. Which will e.g. also happen on any A10
>> based tablets which typically have both hdmi out and an lcd screen,
>> in the future I hope we will also get lcd support in u-boot, and then
>> logically on tablets the lcd screen would take precedence, so then
>> unless overriden through some config mechanism u-boot will chose
>> to use the lcd, and will look for /chosen/framebuffer0-lcd which has
>> a different set of clocks then /chosen/framebuffer0-hdmi.
>
> This sounds like a use for:
>         compatible = "simple-framebuffer,hdmi", "simple-framebuffer"
> or some such, that's almost exactly what multiople compatible strings
> are for. Relying on specific naming and/or path is rather
> unconventional.

Indeed, for a long time now finding nodes by path has been strongly
discouraged. It makes it hard to move nodes around when needed. I'm
not going to make a big deal about it because it doesn't affect the OS
interface, but Ian's suggestion is sane. simple-framebuffer is enough
to identify the binding, but you can use additional strings to
identify the specific hardware interface that U-Boot can use to locate
the node. ie. sunxi,framebuffer-hdml or some such. You can never be
sure when someone will produce a board that messes with your naming
assumptions. What if is suddenly needs to be named "framebuffer1-hdmi"
because they added and FPGA that they want as framebuffer0? (Yes, I'm
making stuff up, but I have to think about the corner cases)

>> The devicetree bindings have been going on for so long, that this
>> would be the 2nd merge window this feature misses, Luc's original
>> version was posted before the v2014.10 merge window.
>
> I'm afraid I don't agree that just because it has taken a long time to
> get something right we should commit to it before it is ready,
> especially when it is an ABI, which is what a DT binding is.
>
> If this scheme was acked by a DT maintainer then I'd be fine with it,
> but so far it hasn't been, at least not publicly in the threads I've
> looked at.

I /DO/ want comments though. Putting the node in /chosen is
unconventional. I want to hear if anyone has a good reason why the
framebuffers shouldn't be placed into /chosen.

>> AFAIK Grant agrees with v5
>
> AFAIK Grant hasn't actually said that. If he does ack it (or if someone
> points me to the correct mail) then I have no further objections.

My word also isn't gospel. On controversial stuff I want to have
consensus. For the clock patches and had a long conversation with Rob
to make sure we were both in agreement before giving my final ack.

> In fact it's a bit odd to have a reg property under /chosen at all,
> since it doesn't really fit in with the bus structure. I've done
> something similar in some bindings I've authored[0], but AIUI I got that
> wrong and really should have used a set of non-reg properties with a
> single value so there was no need to parse using #*-cells  (cf the
> initrd-start + initrd-end properties under /chosen). Sadly DT is an ABI,
> so for my bindings I'm kind of stuck with it for the foreseeable future.
>
> [0]
> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;h=08ed7751859dbe2d2c32d86d7df371057d7b45a4;hb=HEAD

Ironic isn't it that I though of that as precedence when I suggested
/chosen! :-)

I actually don't have a problem with it. We do need a way to specify
runtime memory usage, and /chosen is as good a place as any,
particularly when it represents things that won't necessarily be
relevant on kexec or dom0 boot.

The other options are under either the /memory or the /reserved-memory
tree. Rob and I talked about /reserved-memory quite a lot. We could
put all the framebuffer details into the memory node that reserves the
framebuffer. However, I don't like that idea because it kind of makes
assumptions about how the framebuffer will be located inside the
memory region and doesn't allow for multiple framebuffers within a
single region.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
