From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: simplefb-sunxi: Add
 sunxi simplefb extensions
Date: Tue, 25 Nov 2014 14:21:19 +0100
Message-ID: <5474824F.8080000@redhat.com>
References: <1416309051-26784-1-git-send-email-hdegoede@redhat.com> <1416309051-26784-3-git-send-email-hdegoede@redhat.com> <547476DA.2030004@ti.com> <54747B72.1050406@redhat.com> <54747DCF.9010502@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBXEE2KRQKGQEU2E7KDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54747DCF.9010502-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/25/2014 02:02 PM, Tomi Valkeinen wrote:
> On 25/11/14 14:52, Hans de Goede wrote:
>
>>>> +Required properties:
>>>> +- compatible: "allwinner,simple-framebuffer"
>>>> +- allwinner,pipeline, one of:
>>>
>>> Sorry my ignorance, but what's sunxi and what's allwinner? Both names
>>> are mixed here.
>>
>> sunxi is the sun#i SoCs from Allwinner, Allwinner is the manufacturer
>> and the
>> SoC "code" names used everywhere in the kernel for their SoCs are sun4i,
>> sun5i,
>> sun6i, etc. Most people refer to these SoCs as sunxi. This is also what the
>> linux-sunxi mailinglist in the Cc is about.
>>
>> The official devicetree vendor prefix for Allwinner is allwinner, hence the
>> allwinner in the compatible name, see e.g. also
>>
>> Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>>
>> Which also uses sunxi / sun4i everywhere except in the compatible vendor
>> prefix.
>
> Alright, thanks for explanation.
>
> Shouldn't the compatible then be "allwinner,sunxi-simple-framebuffer",
> to differentiate from some other SoC Allwinner has or might create in
> the future? That is, presuming you're confident enough that a single
> compatible string covers all the current and forthcoming sunxi SoCs.

This was discussed in an earlier thread, we (Ian Campbell, Grant and me)
decided to settle on allwinner,simple-framebuffer to make it clear that
these are allwinner extensions to the standard simple-framebuffer bindings,
and that the node otherwise is simple-framebuffer compatible.

We were afraid that e.g. sun4i-simple-framebuffer would signal that it
is not a normal simple-framebuffer node, so we decided to go with just
the allwinner, prefix to indicate that it uses allwinner specific
extensions.

Regards,

Hans
