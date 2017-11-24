From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi: document new generic
 binding
Date: Fri, 24 Nov 2017 12:04:12 +0000
Message-ID: <20efcf8f-85a5-3cad-a84b-434ee5cad68e@arm.com>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
 <20171124105240.GB3792@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171124105240.GB3792@ulmo>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

(adding linux-sunxi, which I forgot at the initial post).

On 24/11/17 10:52, Thierry Reding wrote:
> On Fri, Nov 24, 2017 at 11:19:52AM +0100, Linus Walleij wrote:
>> On Mon, Nov 13, 2017 at 2:25 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>> So far all the Allwinner pinctrl drivers provided a table in the
>>> kernel to describe all the pins and the link between the pinctrl functions
>>> names (strings) and their respective mux values (register values).
>>>
>>> Extend the binding to put those mappings in the DT, so that any SoC can
>>> describe its pinctrl and GPIO data fully there instead of relying on
>>> tables.
>>> This uses a generic compatible name, to be prepended with an SoC
>>> specific name in the node.
> 
> This seems backwards to me. I'm not sure if Rob has any hard rules on
> this, but in the past I've seen a lot of drivers stick this kind of data
> into drivers. I personally also prefer that approach because the data is
> completely static and there's no way for any specific board to customize
> it. So the tables are in fact implied completely by the SoC compatible
> string.

But this is just *data*, and I believe it is actually package specific.
We need the DT to describe the relation between devices and pins anyway,
it's just that we use arbitrary strings today instead of the actual
register value. This is what the generic pinmux property fixes.

> Moving all of this data into device tree has a number of disadvantages:
> 
>   * Existing boards already use the static tables in the driver, and the
>     device trees don't contain any data, so you can't get rid of any of
>     the existing tables because it would break ABI.

Yes, my DeLorean is in the garage, so I can't really change this anymore
;-) But that doesn't mean we have to go on with this forever, I think.

>   * Moving the table into the DT doesn't actually solve anything because
>     the driver would have to validate the DT description to make sure it
>     contains valid data. And in order to validate DT content, the driver
>     would need a copy of the table anyway.

I don't get what the driver would need to validate? We rely on DT
information to be correct anyway, otherwise your board just won't work.
If the DT is wrong, you have much bigger problems.

Actually we gain something, because we only commit information that can
actually be tested. Right now we have a lot of information which is
copied from the manual, and nobody knows if pin H24 on the A10 is really
PATA-CS1 or not. Plus we have bugs when creating the table, plus
copy&paste bugs. I found some while grep-ing for patterns - will send
fixes ASAP.

In the moment all the table gives us is a mapping between a *string* and
the respective mux register value (per pin), plus the number of pins in
each bank. This can *easily* be put in the DT and should belong there.

Actually I believe that the current binding is not correct, because it
makes those mux strings a part of the binding, though this is not
documented anywhere. A developer cannot take the binding and write a
working driver or even a DT without looking at the code.
Plus we already changed those names in the past (for instance commit
bc0f566a98c4), basically breaking compatibility.

> I don't think you're going to do yourself any favours by pushing this. I
> also don't see the commit description give any reason why you want to
> move the table into device tree. Do you see any advantages in doing so?

We stop adding tables with SoC specific *data* in the kernel *code*
base. With being boolean Kconfig options, this gets added to every
single-image kernel.

More important: those tables help Linux, but other DT consumers (*BSD,
U-Boot) have to replicate them, which is just wrong, IMHO.

I believe the kernel is a nice collection of really good code for
complicated file systems, high performance network protocols and
sophisticated memory management, among others. It shouldn't be a dumping
ground for arbitrary, very SoC specific information. Cf. LinusT 2011.
DT is out there to fix this, so we should do so.

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
