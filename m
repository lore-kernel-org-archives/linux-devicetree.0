From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: simplefb: Specify node
 location and handoff related properties
Date: Thu, 13 Nov 2014 09:43:24 +0100
Message-ID: <54646F2C.1000707@redhat.com>
References: <1415830124-28787-1-git-send-email-hdegoede@redhat.com> <CAMuHMdU4YTwyMrD5U1i3DYy=cvpocmzXqajySUfgBKVRhcAJVw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBNO6SGRQKGQEMLPCK2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAMuHMdU4YTwyMrD5U1i3DYy=cvpocmzXqajySUfgBKVRhcAJVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/13/2014 09:38 AM, Geert Uytterhoeven wrote:
> On Wed, Nov 12, 2014 at 11:08 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
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
> 
> Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Thanks.

> 
>> ---
>>  .../bindings/video/simple-framebuffer.txt          | 37 +++++++++++++++++++++-
>>  1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> index 8f35718..95fe284 100644
>> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> @@ -4,6 +4,26 @@ A simple frame-buffer describes a frame-buffer setup by firmware or
>>  the bootloader, with the assumption that the display hardware has already
>>  been set up to scan out from the memory pointed to by the reg property.
>>
>> +Since simplefb nodes represent runtime information they must be sub-nodes of
>> +the chosen node (*). The primary display node must be named framebuffer0,
>> +additional nodes must be called framebuffer1, etc.
>> +
>> +If a simplefb node represents the preferred console for user interaction,
>> +then the chosen node's stdout-path property must point to it.
> 
> You may want to add an stdout-path property to the example.

That is a good idea, done for v2.

Regards,

Hans
