From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 12 Sep 2011 14:15:58 +0200
Message-ID: <CACRpkdaVL5L2-DR8gshN9b0sOn5rDY5QyP4fwZggXjFPmFr9-g@mail.gmail.com>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109061347410.20358-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2011 at 7:52 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 6 Sep 2011, Linus Walleij wrote:
>
>> Does anyone happen to run a mainline kernel with
>> zImage-appended device tree?
>>
>> Or:
>>
>> Are there out-of-tree patches required to do this?
>> (I guess so.)
>>
>> And:
>>
>> Do they actually work?
>
> They sure do, (or so I hope).
>
> My latest patchset is here:

I've tested this a bit now with U8500 and RealView
PB1176.

I'm using the clean patches on a clean tree, i.e.
just relying on the code already in mainline.

We add this to the MACHINE_START()

static const char * realview_dt_board_compat[] = {
       "arm,realview-pb1176",
       NULL
};

.dt_compat      = realview_dt_board_compat,

On kernel 3.1-rc4 the system hangs in early boot
(early printk does not help). But this is not related to
these patches at all, it happens as soon as you enable
CONFIG_USE_OF. (Any hints on how to fix that?)

So I tested a bit with just a plain v3.0 kernel.

Using the "supplementing DTB with traditional ATAG data"
patch totally hangs my systems, even if I don't enable
CONFIG_ATAG_DTB_COMPAT, so I think that patch
needs some scrutiny.

Removing that patch the system boots, and I can use
CONFIG_USE_OF with CONFIG_PROC_DEVICETREE
to inspect an empty tree in /proc/device-tree

If I then try to enable these patches it dies
by not finding any "compatible" property. (But it boots,
yay!)

Error: unrecognized/unsupported device tree compatible list:
[ ]
Available machine support:
ID (hex)	NAME
ffffffff	ARM-RealView PB1176
Please check your kernel config and/or bootloader.

(I know the MACHINE_TYPE isn't sane.)

Anyway, so the
prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
returns NULL.

So it appears that the appended device tree does not
show up.

I don't quite know how to debug this further...
Given that the appended approach is generally
frowned upon maybe we are better off trying to fix
our U-Boot, getting a combo that is known to work
with device tree, than trying to get appended device
trees to work?

Yours,
Linus Walleij
