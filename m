From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/6] sunxi: video: Add simplefb support
Date: Mon, 17 Nov 2014 11:10:16 +0100
Message-ID: <5469C988.5040702@redhat.com>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>
	<1415984088-6800-6-git-send-email-hdegoede@redhat.com>
	<1416138607.25454.13.camel@hellion.org.uk>
	<5468AC2E.80601@redhat.com>
	<1416148688.25454.22.camel@hellion.org.uk>
	<5468BE9A.8050501@redhat.com>
	<1416154297.25454.24.camel@hellion.org.uk>
	<CACxGe6vE0BdWOrdw1iQyk2-tmdnAUZ=oQCvGg_LESoiw055DLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CACxGe6vE0BdWOrdw1iQyk2-tmdnAUZ=oQCvGg_LESoiw055DLw@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc@hellion.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, U-Boot <u-boot@lists.denx.de>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/17/2014 10:58 AM, Grant Likely wrote:
> On Sun, Nov 16, 2014 at 4:11 PM, Ian Campbell <ijc@hellion.org.uk> wrote:
>> On Sun, 2014-11-16 at 16:11 +0100, Hans de Goede wrote:

<snip>

>>> Right, I forgot to add one important bit to my explanation, sorry, if
>>> you look at the binding then it says that the name should be suffixed
>>> with the output type, so currently the sunxi u-boot code will look for
>>> /chosen/framebuffer0-hdmi. Which will e.g. also happen on any A10
>>> based tablets which typically have both hdmi out and an lcd screen,
>>> in the future I hope we will also get lcd support in u-boot, and then
>>> logically on tablets the lcd screen would take precedence, so then
>>> unless overriden through some config mechanism u-boot will chose
>>> to use the lcd, and will look for /chosen/framebuffer0-lcd which has
>>> a different set of clocks then /chosen/framebuffer0-hdmi.
>>
>> This sounds like a use for:
>>         compatible = "simple-framebuffer,hdmi", "simple-framebuffer"
>> or some such, that's almost exactly what multiople compatible strings
>> are for. Relying on specific naming and/or path is rather
>> unconventional.
> 
> Indeed, for a long time now finding nodes by path has been strongly
> discouraged. It makes it hard to move nodes around when needed. I'm
> not going to make a big deal about it because it doesn't affect the OS
> interface, but Ian's suggestion is sane. simple-framebuffer is enough
> to identify the binding, but you can use additional strings to
> identify the specific hardware interface that U-Boot can use to locate
> the node. ie. sunxi,framebuffer-hdml or some such. You can never be
> sure when someone will produce a board that messes with your naming
> assumptions. What if is suddenly needs to be named "framebuffer1-hdmi"
> because they added and FPGA that they want as framebuffer0? (Yes, I'm
> making stuff up, but I have to think about the corner cases)

I like the suggestion of using a compatible of : "sunxi,framebuffer-hdmi"
although it will need to be : "sunxi,framebuffer0-hdmi" as u-boot
needs to know which simplefb node to use for which display pipeline
(so that the node has the right clocks and whats not).

And I think it makes sense to put simple in there as it is a pre-populated
simplefb node , so then we get:

"sunxi,simple-framebuffer0-hdmi"

And we can drop the unconventional lookup by path.

I'll go on irc now, and join #devicetree, Ian, maybe you can join us
there to and we can hash out something we can all agree on ?

And then I'll do yet another set of patches (to apply on top on the
kernel side, and a new version of the u-boot patch), and we'll hopefully
end up with something which makes us all happy

<snip>

>> In fact it's a bit odd to have a reg property under /chosen at all,
>> since it doesn't really fit in with the bus structure. I've done
>> something similar in some bindings I've authored[0], but AIUI I got that
>> wrong and really should have used a set of non-reg properties with a
>> single value so there was no need to parse using #*-cells  (cf the
>> initrd-start + initrd-end properties under /chosen). Sadly DT is an ABI,
>> so for my bindings I'm kind of stuck with it for the foreseeable future.
>>
>> [0]
>> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;h=08ed7751859dbe2d2c32d86d7df371057d7b45a4;hb=HEAD
> 
> Ironic isn't it that I though of that as precedence when I suggested
> /chosen! :-)
> 
> I actually don't have a problem with it. We do need a way to specify
> runtime memory usage, and /chosen is as good a place as any,
> particularly when it represents things that won't necessarily be
> relevant on kexec or dom0 boot.
> 
> The other options are under either the /memory or the /reserved-memory
> tree. Rob and I talked about /reserved-memory quite a lot. We could
> put all the framebuffer details into the memory node that reserves the
> framebuffer. However, I don't like that idea because it kind of makes
> assumptions about how the framebuffer will be located inside the
> memory region and doesn't allow for multiple framebuffers within a
> single region.

I'm not a devicetree expert, but /chosen already came to my mind even
before Grant suggested it, /chosen seems the right place for this to me.

Note that once we drop the path based lookup the location can always be
changed later (to some degree, it still needs to be in a place where
the kernel will bind to it).

Regards,

Hans
