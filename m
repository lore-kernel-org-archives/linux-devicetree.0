From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Fixing boot-time hiccups in your display
Date: Mon, 06 Oct 2014 14:06:45 +0200
Message-ID: <543285D5.30607@redhat.com>
References: <CAKON4OxRFCvMPMfZhxYNVaxscgAs5AX46YzK-4SU5o6E-iTD1w@mail.gmail.com>	<20141005200150.4379.28017@quantum>	<CAKON4OxunQNC_Ebf5u9yh9EnGS2A+DdWCRyoFcJWS7GSNoLoqA@mail.gmail.com>	<54324445.9070400@redhat.com> <CAKON4Ozum1SeAhecR14uuAmk1NqfMuLZAEyGZnv3Yr0CwAavzA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBZULZKQQKGQEI55YDAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4Ozum1SeAhecR14uuAmk1NqfMuLZAEyGZnv3Yr0CwAavzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/06/2014 01:26 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Mon, Oct 6, 2014 at 3:27 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> On 10/05/2014 10:34 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

<snip>

> The 'clean up' command only releases resources that no one was
> claimed. The device specific framebuffer loaded and claimed all of the
> video resources, so this command has no impact on those resources.

Except that those resources may be turned off if they are shared by
another device with a clk_disable call. Yes I know you're suggesting
to increment the usage count of all clks, regulators, foobars and whatnots
by one, only to release them at the magic release moment, but that
means adding code for this to all affected subsystems, and as such is
not a good solution.

Besides that it has already been nacked by involved subsystem maintainers,
because it is just too ugly.

What we're talking about here from a technical pov is quite simple, we need
to keep various resources alive during the lifetime of the (fake) device using
them, e.g. simplefb. The most KISS solution for that is to simply tie them to
the lifetime of the device.

Not only is this KISS it is also obviously the right solution from a technical
viewpoint. But instead of coming with technical arguments why this is not a
good idea, you come with ...

> Because this needs to be fixed in the OS without relying on detailed
> communication with the BIOS.  Of course you can get this going on one
> box with one BIOS and one kernel. The problems occur when you try to
> get this going on all boxes, all BIOS and all kernels.

FUD about how we cannot trust firmware. What we are doing here is
defining a firmware <-> OS interface, if we cannot trust the firmware, then
we should not be adding such interfaces at all, yet simplefb already exists,
all I'm doing is trying to extend it.

>> Also this non-solution completely discards the use case where e.g. simplefb
>> is used as an early bringup mechanism and there may complete be no real
>> driver for a long time (months if not years). So then again there is no
> 
> I in no way support long term use of simplefb after the boot process.

You do realize that this is what it was actually *designed* for ? And that
only later the idea of using it as an early console came to bear ?

> The problems with this model are legendary on the x86. Try running
> your X server right now on the VBIOS driver, see if it functions.

And yet more fear for bad firmware.

I'm afraid that this is going to be my last reply to any objections from you,
as I simply cannot rationally argue against arguments which are mostly
based on fear.

Regards,

Hans
