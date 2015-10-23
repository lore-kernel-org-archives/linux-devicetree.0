From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Fri, 23 Oct 2015 08:28:21 -0500
Message-ID: <CAL_JsqJvomv3_9TBAtJ3JckeW8hJiS02aYAjR3Q+bCex85uUPw@mail.gmail.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
 <1445522558-5808-2-git-send-email-mans@mansr.com> <562A23B9.3090208@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562A23B9.3090208-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 7:10 AM, Marc Gonzalez
<marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org> wrote:
> On 22/10/2015 16:02, Mans Rullgard wrote:
>
>> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
>> using the "aurora,nb8800" compatible string.  When used in Sigma
>> Designs chips a few additional control registers are available.
>> This variant is indicated by the "sigma,smp8640-ethernet" compatible
>> string.
>>
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/net/aurora,nb8800.txt      | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/aurora,nb8800.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.txt b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>> new file mode 100644
>> index 0000000..c19f615
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>> @@ -0,0 +1,26 @@
>> +* Aurora VLSI AU-NB8800 Ethernet controller
>> +
>> +Required properties:
>> +- compatible: Should be "aurora,nb8800", "sigma,smp8640-ethernet"
>> +     The latter indicates presence of extra features added by Sigma Designs.
>
> I've been meaning to ask a noob question to the devicetree group
> about how names for compatible strings are chosen.
>
> Sigma Designs has two active SoC families, Tango3 (which consists of
> about a dozen MIPS-based SoCs, typically named SMP86xx) and Tango4
> (a few ARM-based SoCs, typically named SMP87xx). I should note that
> there is no SMP8640 SoC AFAIK, rather SMP864x is a Tango3 sub-family
> (I could locate 42,43,44,45,46).
>
> AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
> along with the extra features. I find it odd to use a specific SoC
> model to refer to this device, instead of a more generic name.
> (It's weird having to mention smp8640 in the tango4 DT.)

The block may seem the same, but do you really know? Same block can
have different operating frequencies depending on the physical design.
A specific string is insurance in case you do find some difference as
that should not require you do update your DTB (the traditional model
is DTB is part of firmware and independent of OS versions).

Having a generic string for matching is fine, but you also need a
specific one. Often the first chip with a block is the generic string.
New SOCs can then claim compatibility with old versions and existing
drivers.

> Would it be possible to have a compatible string which makes it
> clear that it is an Aurora MAC with vendor-specific tweaks?
> Something like "sigma,aurora-nb8800-mac" ?

That is what is done here essentially. You can debate on the exact
name if you like.


>> +- reg: Should be MMIO address space of the device
>> +- interrupts: Should contain the interrupt specifier for the device
>> +- interrupt-parent: Should be a phandle for the interrupt controller
>> +- clocks: Should be a phandle for the clock for the device
>> +
>> +Common properties described in ethernet.txt:
>> +- local-mac-address
>> +- mac-address
>> +- max-speed
>> +- phy-mode
>> +
>> +Example:
>> +
>> +ethernet@26000 {
>> +     compatible = "aurora,nb8800";
>> +     reg = <0x10000 0x800>;
>> +     interrupts = <42>;
>
> I thought one had to specify also whether the device sent "edge"
> or "level" IRQs?

That is entirely dependent on the interrupt controller you are
attached to. Often that is not a configurable property for hard wired
IRQs.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
