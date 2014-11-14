From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: simplefb: Specify node
 location and handoff related properties
Date: Fri, 14 Nov 2014 11:15:34 +0100
Message-ID: <5465D646.9050605@redhat.com>
References: <1415906594-2461-1-git-send-email-hdegoede@redhat.com> <CACxGe6uJhyyAfXDEk5a9fR+RtiRbAO4qYzOrStcanJxUuc1GiQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBUNMS6RQKGQEE5AMYQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6uJhyyAfXDEk5a9fR+RtiRbAO4qYzOrStcanJxUuc1GiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 11/14/2014 10:19 AM, Grant Likely wrote:
> On Thu, Nov 13, 2014 at 7:23 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
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
>> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> --
>> Changes in v2:
>> -Add stdout-path to the example code
>> Changes in v3:
>> -Specify that the node name must be "framebuffer@<address>"
>> -Specify that the link to link simplefb node and display hw nodes to one
>>  another for handover goes into the simplefb node, and must be called "display"
>> -Specify how aliases may be used to tell the OS how to number displays
>> -Update the example to reflect these changes
>> Changes in v4:
>> -Keep the size of the reg property in the example as it was before
>> ---
>>  .../bindings/video/simple-framebuffer.txt          | 49 +++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> index 8f35718..c548f33 100644
>> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> @@ -4,6 +4,31 @@ A simple frame-buffer describes a frame-buffer setup by firmware or
>>  the bootloader, with the assumption that the display hardware has already
>>  been set up to scan out from the memory pointed to by the reg property.
>>
>> +Since simplefb nodes represent runtime information they must be sub-nodes of
>> +the chosen node (*). Simplefb nodes must be named "framebuffer@<address>".
>> +
>> +If a simplefb node represents the preferred console for user interaction,
>> +then the chosen node's stdout-path property must point to it.
> 
> Since we've decided to point the display aliases at the display node
> instead of the framebuffer, the stdout-path property should also point
> to the display node. The simplefb driver can still work out which
> framebuffer to use for stdout path in the same way that it figures out
> how to resolve the display alias. This way the stdout details aren't
> lost when the framebuffer is disabled and It also means that
> stdout-path can be merely set to the alias ("display0") instead of the
> full path ("/full/path/to/node").

Ok, will fix for V5.

> 
>> +
>> +If the devicetree contains nodes for the display hardware used by a simplefb,
>> +then the simplefb node must contain a property called "display", which
>> +contains a phandle pointing to the primary display hw node, so that the OS
>> +knows which simplefb to disable when handing over control to a driver for the
>> +real hardware. The bindings for the hw nodes must specify which node is
>> +considered the primary node.
>> +
>> +It is advised to add display# aliases to help the OS determine how to number
>> +things. If display# aliases are used, then if the simplefb node contains a
> 
> s/then if/and if/

Erm, no the then applies to both the musts following that sentence, in pseudo
code it looks like this:

if (display# aliases are used) {
	if (simplefb node contains a "display" property) {
		/aliases/display# path must point to the display hw node the "display" property points to
	} else {
		/aliases/display# path must point directly to the simplefb node.
	}
}

So no && between the (display# aliases are used) and (simplefb node contains a "display" property)
conditions.


> 
>> +"display" property then the /aliases/display# path must point to the display
>> +hw node the "display" property points to, otherwise it must point directly
>> +to the simplefb node.
>> +
>> +It is advised that devicetree files contain pre-filled, disabled framebuffer
>> +nodes, so that the firmware only needs to update the mode information and
>> +enable them. This way if e.g. later on support for more display clocks get
>> +added, the simplefb nodes will already contain this info and the firmware
>> +does not need to be updated.
> 
> You should merge your guidance of naming pre-filled framebuffer nodes
> into this patch. There is no need to have it separate.

Will do for v5.

Regards,

Hans
