From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: simplefb: Specify node
 location and handoff related properties
Date: Thu, 13 Nov 2014 13:14:26 +0100
Message-ID: <5464A0A2.1080503@redhat.com>
References: <1415868610-13297-1-git-send-email-hdegoede@redhat.com> <CACxGe6uX7V-TcZfM0vP4SvjxKx3T_RGByX8wFqTdFo4LEzP2Yg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBK6BSKRQKGQEMHXOMJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6uX7V-TcZfM0vP4SvjxKx3T_RGByX8wFqTdFo4LEzP2Yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/13/2014 12:02 PM, Grant Likely wrote:
> On Thu, Nov 13, 2014 at 8:50 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Since simplefb nodes do not relate directly to hw typically they have been
>> placed in the root of the devicetree. As the represent runtime information
>> having them as sub-nodes of /chosen is more logical, specify this.
>>
>> Also specify when to set the chosen stdout-path property to a simplefb node.
>>
>> For reliable handover to a hardware specific driver, that driver needs to
>> know which simplefb to unregister when taking over, specify how the hw driver
>> can find the matching simplefb node.
>>
>> Last add some advice on how to fill and use simplefb nodes from a firmware
>> pov.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> --
>> Changes in v2:
>> -Add stdout-path to the example code
>> ---
>>  .../bindings/video/simple-framebuffer.txt          | 38 +++++++++++++++++++++-
>>  1 file changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> index 8f35718..8b7ecf6 100644
>> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> @@ -4,6 +4,26 @@ A simple frame-buffer describes a frame-buffer setup by firmware or
>>  the bootloader, with the assumption that the display hardware has already
>>  been set up to scan out from the memory pointed to by the reg property.
>>
>> +Since simplefb nodes represent runtime information they must be sub-nodes of
>> +the chosen node (*). The primary display node must be named framebuffer0,
>> +additional nodes must be called framebuffer1, etc.
> 
> Thinking more about our conversation yesterday, the preferred name
> should still be framebuffer@<address>. There is no reason to break
> with established convention, and as mentioned in my reply on patch #2,
> using the name is not the preferred way to identify a device node. So,
> my recommendation is to prefer the name "framebuffer@<addr>", but if
> it is inconvenient because the address isn't known, then
> "framebuffer#" is acceptable.

Since we want to use pre-filled simplefb nodes already present in the devicetree,
and u-boot is the one chosing the framebuffer address we don't know the
address to put in the dts file beforehand, so framebuffer# it is.

> Then use /aliases for actual enumeration
> which has the advantage of also working for framebuffers that aren't
> in /chosen.

I'll discuss the aliases in my reply to your next mail which goes into
more details about this.

> 
>> +
>> +If a simplefb node represents the preferred console for user interaction,
>> +then the chosen node's stdout-path property must point to it.
>> +
>> +If the devicetree contains nodes for the display hardware used by a simplefb,
>> +then one of the hw nodes must have a property called "framebuffer" pointing to
>> +the framebuffer# node in chosen, so that the operating system knows which
>> +simplefb to disable when handing over control to a driver for the real
>> +hardware. The bindings for the hw nodes must specify which node contains the
>> +framebuffer property.
> 
> I've also been thinking about this. When we talked yesterday I said I
> didn't have a preference as to which direction the link between the
> framebuffer and the display hardware pointed. Thinking about it now,
> between the two nodes, the HW node is pretty much static, but the FB
> node is dynamic and in most scenarios will be enabled by firmware, and
> then disabled by the operating system. If the framebuffer property is
> in the HW node, then that means the firmware needs to modify two nodes
> to set up the linkage correctly. It needs to enable the framebuffer,
> and then add the link. If one of several possible FB nodes was enabled
> by the firmware, it need to modify the display controller node to
> match. And, when the framebuffer is disabled, the HW node is left with
> a dangling link that kexec won't necessarily know how to fix up.
> 
> If instead the link goes the other way, as a property in the
> framebuffer node pointing to display controller, all of the
> functionality still stays the same, but the display controller node
> never needs to change when framebuffers are
> enabled/disabled/added/removed. Since the location and/or compatible
> value of framebuffers is always well known, (aside from the fact that
> the simplefb driver binds to them), we can have a single API that will
> return all the framebuffers associated to a given display controller
> node. The real HW driver will be able to use that to find its
> framebuffers and coordinate handover between them.

Ok, I'll change the bindings so that the link goes the other way, note that
he firmware should not be touching the link at all, we've a pre-populated
simplefb node in the devicetree for the firmware to further fill in
(and enable), and that should already contain the link.

Regards,

Hans




> 
> g.
> 
>> +
>> +It is advised that devicetree files contain pre-filled, disabled framebuffer#
>> +nodes, so that the firmware only needs to update the mode information and
>> +enable them. This way if e.g. later on support for more display clocks get
>> +added, the simplefb nodes will already contain this info and the firmware
>> +does not need to be updated.
>> +
>>  Required properties:
>>  - compatible: "simple-framebuffer"
>>  - reg: Should contain the location and size of the framebuffer memory.
>> @@ -22,11 +42,27 @@ Optional properties:
>>
>>  Example:
>>
>> -       framebuffer {
>> +chosen {
>> +       framebuffer0 {
>>                 compatible = "simple-framebuffer";
>>                 reg = <0x1d385000 (1600 * 1200 * 2)>;
>>                 width = <1600>;
>>                 height = <1200>;
>>                 stride = <(1600 * 2)>;
>>                 format = "r5g6b5";
>> +               clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
>>         };
>> +       stdout-path = &framebuffer0;
>> +};
>> +
>> +soc@01c00000 {
>> +       lcdc0: lcdc@1c0c000 {
>> +               compatible = "allwinner,sun4i-a10-lcdc";
>> +               framebuffer = <&framebuffer0>;
>> +       };
>> +};
>> +
>> +
>> +*) Older devicetree files may have a compatible = "simple-framebuffer" node
>> +in a different place, operating systems must first enumerate any framebuffer#
>> +nodes found under chosen and then check for other compatible nodes.
>> --
>> 2.1.0
>>
