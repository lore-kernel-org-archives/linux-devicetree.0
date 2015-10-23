From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800 Ethernet controller
Date: Fri, 23 Oct 2015 15:06:06 +0100
Message-ID: <yw1xegglfzn5.fsf@unicorn.mansr.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
	<1445522558-5808-2-git-send-email-mans@mansr.com>
	<562A23B9.3090208@sigmadesigns.com>
	<yw1xio5xg0rq.fsf@unicorn.mansr.com>
	<562A3CD2.3050903@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562A3CD2.3050903-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org> (Marc Gonzalez's message of
	"Fri, 23 Oct 2015 15:57:38 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org> writes:

> On 23/10/2015 15:41, M=E5ns Rullg=E5rd wrote:
>
>> Marc Gonzalez wrote:
>>=20
>>> On 22/10/2015 16:02, Mans Rullgard wrote:
>>>
>>>> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
>>>> using the "aurora,nb8800" compatible string.  When used in Sigma
>>>> Designs chips a few additional control registers are available.
>>>> This variant is indicated by the "sigma,smp8640-ethernet" compatib=
le
>>>> string.
>>>>
>>>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/net/aurora,nb8800.txt      | 26 +++++++++=
+++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/net/aurora,n=
b8800.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.t=
xt b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>>>> new file mode 100644
>>>> index 0000000..c19f615
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>>>> @@ -0,0 +1,26 @@
>>>> +* Aurora VLSI AU-NB8800 Ethernet controller
>>>> +
>>>> +Required properties:
>>>> +- compatible: Should be "aurora,nb8800", "sigma,smp8640-ethernet"
>>>> +	The latter indicates presence of extra features added by Sigma D=
esigns.
>>>
>>> I've been meaning to ask a noob question to the devicetree group
>>> about how names for compatible strings are chosen.
>>>
>>> Sigma Designs has two active SoC families, Tango3 (which consists o=
f
>>> about a dozen MIPS-based SoCs, typically named SMP86xx) and Tango4
>>> (a few ARM-based SoCs, typically named SMP87xx). I should note that
>>> there is no SMP8640 SoC AFAIK, rather SMP864x is a Tango3 sub-famil=
y
>>> (I could locate 42,43,44,45,46).
>>>
>>> AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
>>> along with the extra features. I find it odd to use a specific SoC
>>> model to refer to this device, instead of a more generic name.
>>> (It's weird having to mention smp8640 in the tango4 DT.)
>>=20
>> I picked 8640 since all 8640 or higher chips are compatible (863x ch=
ips
>> (tango2) are not).  Some of the later versions have additional extra
>> features, but they all work with the basic driver.
>>=20
>> There also appear to be some differences (bug fixes?) between 8643 a=
nd
>> 8759 (the ones I have) not documented anywhere.
>
> I'm trying to locate someone who would know these kinds of details.

More specifically, the DMA completion interrupts seem to behave
differently.

>>> I thought one had to specify also whether the device sent "edge"
>>> or "level" IRQs?
>>=20
>> Depends on the interrupt controller.  This is just an example.
>
> Sorry for the noise. (I thought edge/level was a device property,
> as in "I'll just pulse that IRQ, or I'll hold it until someone
> asks me to shut up.")

Most devices keep the interrupt request line high until explicitly
cleared by a driver.  Whether you want edge or level triggering depends
on the driver design and if the interrupt is shared with other devices.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
