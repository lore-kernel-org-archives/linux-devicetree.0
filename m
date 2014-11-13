From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/4] dt-bindings: simplefb: Specify
 node location and handoff related properties
Date: Thu, 13 Nov 2014 16:07:18 +0000
Message-ID: <CACxGe6tA90T+nj5aBbWWd4SJVofzKLY9AS2cXeqUJyAVMYECbw@mail.gmail.com>
References: <1415885645-24613-1-git-send-email-hdegoede@redhat.com>
 <5464C026.7030300@ti.com> <5464C444.4050101@redhat.com> <5464D3C7.7060707@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCJP567ORICBBS5OSORQKGQEEL2FXTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5464D3C7.7060707-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 3:52 PM, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> On 13/11/14 16:46, Hans de Goede wrote:
>> Hi,
>>
>> On 11/13/2014 03:28 PM, Tomi Valkeinen wrote:
>>> On 13/11/14 15:34, Hans de Goede wrote:
>>>
>>>> +chosen {
>>>> +   framebuffer0: framebuffer@5fc00000 {
>>>>             compatible = "simple-framebuffer";
>>>> -           reg = <0x1d385000 (1600 * 1200 * 2)>;
>>>> +           reg = <0x5fc00000 (4096 * 1024)>;
>>>
>>> Was there a reason for this change?
>>
>> I changed the node name to match the new bindings text which
>> specifies that the node name must be framebuffer@<address>,
>> while at it I've taken a real world address range.
>>
>> I assume you refer to the bit where the size of the reg property
>> is changed ? That indeed is not really necessary.
>
> Yes, I meant the size of the reg prop. As this is an example, I think it
> should be as clear as possible.
>
> I guess a valid use case here is to set the size to larger-than-needed,
> so that it gets preallocated and you don't need to worry about getting
> the memory later when the system has already been running for a longer
> time. But if that's the case in this example, I think it would be better
> to describe it explicitly.

Besides, we already have a mechanism for that called /reserved-memory.
Any memory used by a framebuffer needs to be described in the reserved
map anyway, and that region can be made larger than the firmware
configured framebuffer.

g.
