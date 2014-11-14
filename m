From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: simplefb: Document naming
 scheme for pre-populated simplefb nodes
Date: Fri, 14 Nov 2014 10:50:42 +0100
Message-ID: <5465D072.1000407@redhat.com>
References: <1415955751-6316-1-git-send-email-hdegoede@redhat.com> <CACxGe6txgJKsybuSrCXzCn8sPJYZVwo-wm+pV5KuTmP=YHiA2g@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB65AS6RQKGQEEHJB2PA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6txgJKsybuSrCXzCn8sPJYZVwo-wm+pV5KuTmP=YHiA2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 11/14/2014 10:12 AM, Grant Likely wrote:
> On Fri, Nov 14, 2014 at 9:02 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Since we advice to use pre-populated simeplfb nodes in dt files, where the
>> firmware then only needs to fill in the mode info + address and enable it,
>> we should also specify how these pre-populated nodes should be named so
>> that the firmware can find and enable the right one.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/video/simple-framebuffer.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> index c548f33..01dc948 100644
>> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
>> @@ -29,6 +29,13 @@ enable them. This way if e.g. later on support for more display clocks get
>>  added, the simplefb nodes will already contain this info and the firmware
>>  does not need to be updated.
>>
>> +If pre-filled framebuffer nodes are used, they should be named
>> +"framebuffer#-<output>", e.g. "framebuffer0-hdmi". The output should be
>> +included in the name since different outputs typically require different
>> +clocks and the clocks are part of the pre-populated nodes. The firmware must
>> +rename the nodes to the standard "framebuffer@<address>" using the runtime
>> +chosen address when enabling the nodes.
> 
> -<output> should be optional, an only used when there are multiple options.

Right, notice the "should be named", I would rather leave it at that then
complicate the wording by adding something about only use -output when there
are multiple options.

> Something we've not talked about is how to handle a framebuffer that
> has been set up with mirrored displays. Does that case matter?

It is bound to happen sooner or later I guess, but it is still just a single
framebuffer, so from the simplefb kernel driver pov it does not matter, it really
is just another variant on the -<output> theme where there happen to be 2 outputs
active at the same time.

Regards,

Hans



> 
> g.
> 
