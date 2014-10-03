From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3] dt-bindings: Add a clocks property
 to the simple-framebuffer binding
Date: Fri, 03 Oct 2014 19:34:09 +0200
Message-ID: <542EDE11.3010802@redhat.com>
References: <1412345120-24588-1-git-send-email-hdegoede@redhat.com> <CAL_JsqKU2n8p=YfJua3k-mR40bG_4SiZY8_-SL-MXtuWN5NeHg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBGV4XOQQKGQEFOGTWQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAL_JsqKU2n8p=YfJua3k-mR40bG_4SiZY8_-SL-MXtuWN5NeHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/03/2014 05:57 PM, Rob Herring wrote:
> On Fri, Oct 3, 2014 at 9:05 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> A simple-framebuffer node represents a framebuffer setup by the firmware /
>> bootloader. Such a framebuffer may have a number of clocks in use, add a
>> property to communicate this to the OS.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> --
>> Changes in v2:
>> -Added Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Changes in v3:
>> -Updated description to make clear simplefb deals with more then just memory
> 
> NAK. "Fixing" the description is not what I meant and does not address
> my concerns. Currently, simplefb is configuration data. It is
> auxiliary data about how a chunk of memory is used. Using it or not
> has no side effects on the hardware setup, but you are changing that
> aspect. You are mixing in a hardware description that is simply
> inaccurate.

Memory is hardware too, what simplefb is is best seen as a virtual device, and
even virtual devices have hardware resources they need, such as a chunk of memory,
which the kernel should not touch other then use it as a framebuffer, likewise
on some systems the virtual device needs clocks to keep running.

> The kernel has made the decision to turn off "unused" clocks. If its
> determination of what is unused is wrong, then it is not a problem to
> fix in DT.

No, it is up to DT to tell the kernel what clocks are used, that is how it works
for any other device. I don't understand why some people keep insisting simplefb
for some reason is o so very very special, because it is not special, it needs
resources, and it needs to tell the kernel about this or bad things happen.

More over it is a bit late to start making objections now. This has already been
discussed to death for weeks now, and every argument against this patch has already
been countered multiple times (including the one you are making now). Feel free to
read the entire thread in the archives under the subject:
"[PATCH 4/4] simplefb: add clock handling code"

At one point in time we need to stop bickering and make a decision, that time has
come now, so please lets get this discussion over with and merge this, so that
we can all move on and spend out time in a more productive manner.

Regards,

Hans

> 
> Rob
> 
>> ---
>>  Documentation/devicetree/bindings/video/simple-framebuffer.txt | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> index 70c26f3..91176ee 100644
>> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> @@ -1,8 +1,8 @@
>>  Simple Framebuffer
>>
>> -A simple frame-buffer describes a raw memory region that may be rendered to,
>> -with the assumption that the display hardware has already been set up to scan
>> -out from that buffer.
>> +A simple frame-buffer describes a frame-buffer setup by firmware or
>> +the bootloader, with the assumption that the display hardware has already
>> +been set up to scan out from the memory pointed to by the ref property.
>>
>>  Required properties:
>>  - compatible: "simple-framebuffer"
>> @@ -14,6 +14,9 @@ Required properties:
>>    - r5g6b5 (16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b).
>>    - a8b8g8r8 (32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r).
>>
>> +Optional properties:
>> +- clocks : List of clocks used by the framebuffer
>> +
>>  Example:
>>
>>         framebuffer {
>> --
>> 2.1.0
>>
> 
