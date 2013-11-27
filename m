From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Tue, 26 Nov 2013 20:34:22 -0800
Message-ID: <CAN8TOE-PccHVcsdy8QrbLKuOpz1ysKNAbhxv3JuXMmWfU1GWpA@mail.gmail.com>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
	<20131127012158.GR9468@ld-irv-0074.broadcom.com>
	<1385526078.44550720@f276.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385526078.44550720-3vKlxj6uJRtsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On Tue, Nov 26, 2013 at 8:21 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> ...
>> We're dealing with a similar issue in other drivers currently, and I
>> think it's worth straightening out the issue for all systems.
>>
>> On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
>> > This patch adds a property to automatically determine the NAND
>> > bus width by CFI/ONFI information from chip. This property works
>> > if the bus width is not specified explicitly.
>>
>> This issue brings up a few questions in my mind, which are relevant to
>> device tree in general.
>>
>> First of all, do we need a device tree property at all, for something
>> that is auto-detectable?
>>
>> Related: is a device tree consumer (like Linux) supposed to be a
>> validator, or simply a best-effort? I'm considering the following case:
>> if Linux is allowed to auto-detect some property which also has a device
>> tree binding (e.g., "nand-bus-width", in
>> Documentation/devicetree/bindings/mtd/nand.txt), what should happen if
>> the binding happens to be incorrect? IOW, what if the device tree
>> specifies buswidth is x16, but Linux correctly detects it as x8?
>> Shouldn't we make the best effort to bring the hardware up, regardless
>> of what the device tree says?
>>
>> So for something like this GPIO driver, I'm thinking that Linux should
>> just use NAND_BUSWIDTH_AUTO all the time [*]. But (as I'm hinting above)
>> that would allow DTB firmware implementors to be lazier and have a
>> technically-incorrect "nand-bus-width" or "bank-width" binding, since
>> they know it can reliably be detected and overridden by Linux.
>>
>> [*] Except where resource_size(res) < 2, as Alexander already has in
>> this patch.
>>
>> > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  3 +++
>> >  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
>> >  2 files changed, 15 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > index 36ef07d..fe4e960 100644
>> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > @@ -19,6 +19,9 @@ Optional properties:
>> >    defaults to 1 byte.
>> >  - chip-delay : chip dependent delay for transferring data from array to
>> >    read registers (tR).  If not present then a default of 20us is used.
>> > +- gpio-control-nand,bank-width-auto : Device bus width is determined
>> > +  automatically by CFI/ONFI information from chip if "bank-width"
>> > +  parameter is omitted (Boolean).
>>
>> If we do resort to a new binding for auto-buswidth, it should be a
>> generic one that all NAND drivers can use. Maybe a separate boolean
>> "nand-bus-width-auto" and if it is present, then it overrules the
>> presence (or lack) of the "nand-bus-width" boolean property?
>> Or is it possible to extend "nand-bus-width" to allow the value of 0 to
>> mean automatic?
>
> This was be my first implementation of this feature, but rejected...
> http://permalink.gmane.org/gmane.linux.drivers.mtd/47302

Huh? Your original patch was not correct (it removed properties) and
it was not comprehensive in its description -- it didn't cover any of
the topics in my questions above. It wasn't rejected for any reason
related to my questions here.

My question is whether we can leave the documented
bus-width/bank-width binding in place, but just change the Linux
implementation to perform auto-detection instead of just using the
binding directly. And if the answer is "no", then we need a new
binding like your current patch, except that it should be usable for
all NAND.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
