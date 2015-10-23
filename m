From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Fri, 23 Oct 2015 15:57:38 +0200
Message-ID: <562A3CD2.3050903@sigmadesigns.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
 <1445522558-5808-2-git-send-email-mans@mansr.com>
 <562A23B9.3090208@sigmadesigns.com> <yw1xio5xg0rq.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xio5xg0rq.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: DT <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Sebastian Frias <sebastian_frias@sigmadesigns.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

On 23/10/2015 15:41, M=E5ns Rullg=E5rd wrote:

> Marc Gonzalez wrote:
>=20
>> On 22/10/2015 16:02, Mans Rullgard wrote:
>>
>>> This adds a binding for the Aurora VLSI NB8800 Ethernet controller
>>> using the "aurora,nb8800" compatible string.  When used in Sigma
>>> Designs chips a few additional control registers are available.
>>> This variant is indicated by the "sigma,smp8640-ethernet" compatibl=
e
>>> string.
>>>
>>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>>> ---
>>>  .../devicetree/bindings/net/aurora,nb8800.txt      | 26 ++++++++++=
++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/aurora,nb=
8800.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/aurora,nb8800.tx=
t b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>>> new file mode 100644
>>> index 0000000..c19f615
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/aurora,nb8800.txt
>>> @@ -0,0 +1,26 @@
>>> +* Aurora VLSI AU-NB8800 Ethernet controller
>>> +
>>> +Required properties:
>>> +- compatible: Should be "aurora,nb8800", "sigma,smp8640-ethernet"
>>> +	The latter indicates presence of extra features added by Sigma De=
signs.
>>
>> I've been meaning to ask a noob question to the devicetree group
>> about how names for compatible strings are chosen.
>>
>> Sigma Designs has two active SoC families, Tango3 (which consists of
>> about a dozen MIPS-based SoCs, typically named SMP86xx) and Tango4
>> (a few ARM-based SoCs, typically named SMP87xx). I should note that
>> there is no SMP8640 SoC AFAIK, rather SMP864x is a Tango3 sub-family
>> (I could locate 42,43,44,45,46).
>>
>> AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
>> along with the extra features. I find it odd to use a specific SoC
>> model to refer to this device, instead of a more generic name.
>> (It's weird having to mention smp8640 in the tango4 DT.)
>=20
> I picked 8640 since all 8640 or higher chips are compatible (863x chi=
ps
> (tango2) are not).  Some of the later versions have additional extra
> features, but they all work with the basic driver.
>=20
> There also appear to be some differences (bug fixes?) between 8643 an=
d
> 8759 (the ones I have) not documented anywhere.

I'm trying to locate someone who would know these kinds of details.

>> Would it be possible to have a compatible string which makes it
>> clear that it is an Aurora MAC with vendor-specific tweaks?
>> Something like "sigma,aurora-nb8800-mac" ?
>=20
> This doesn't indicate which Sigma modifications are present.  If the
> driver is at some point modified to take advantage of features/fixes =
in
> newer chips, it's good to have a naming scheme that can accommodate
> that.
>=20
> For the SMP8759 devicetree, one could set the compatible list to
> "sigma,smp8759-ethernet", "sigma,smp8640-ethernet", "aurora,nb8800"
> indicating the exact device even if the driver currently doesn't care=
,
> that it is compatible with the 8640 baseline, and finally the plain
> aurora as a last fallback.

I will update my vantage-1172 DT accordingly.

>> I thought one had to specify also whether the device sent "edge"
>> or "level" IRQs?
>=20
> Depends on the interrupt controller.  This is just an example.

Sorry for the noise. (I thought edge/level was a device property,
as in "I'll just pulse that IRQ, or I'll hold it until someone
asks me to shut up.")

Regards.
