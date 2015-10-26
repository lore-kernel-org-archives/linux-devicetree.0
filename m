From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800 Ethernet controller
Date: Mon, 26 Oct 2015 13:54:10 +0000
Message-ID: <yw1xsi4xenwd.fsf@unicorn.mansr.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
	<1445522558-5808-2-git-send-email-mans@mansr.com>
	<562A23B9.3090208@sigmadesigns.com>
	<yw1xio5xg0rq.fsf@unicorn.mansr.com>
	<562DF394.3030500@sigmadesigns.com>
	<yw1x1tchg7i6.fsf@unicorn.mansr.com>
	<562E2A61.2080306@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562E2A61.2080306@sigmadesigns.com> (Marc Gonzalez's message of
	"Mon, 26 Oct 2015 14:28:01 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: DT <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Sebastian Frias <sebastian_frias@sigmadesigns.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

Marc Gonzalez <marc_gonzalez@sigmadesigns.com> writes:

>>> So I should write something like this in my DT?
>>>
>>>   eth0: ethernet@26000 {
>>>     compatible =3D "sigma,smp8734-ethernet", "sigma,smp8640-etherne=
t", "aurora,nb8800";
>>>
>>> Hmmm, you mention this below, but you used "sigma,smp8759-ethernet"=
=2E
>>> What about earlier chips?
>>=20
>> OK, how about this scheme then:
>>=20
>> - Device trees list the exact chip, the chip family, the oldest
>>   compatible family, and finally the basic "aurora,nb8800".  For the
>>   SMP8759 that would look like this:
>>   "sigma,smp8759-ethernet", "sigma,smp87xx-ethernet", "sigma,smp864x=
-ethernet",
>>     "aurora,nb8800"
>
> AFAICT, the list of tango4 chips is (in chronological order)
>
> 8910, 8734, 8756, 8758, 8759
>
> The problem I see is that Sigma already has plans for non-tango4
> 87xx SoCs (two in fact: 8760 and 8762, as far as I've heard).
> (What a mess.)
>
> I would think the "chip family" needs to use the code-name like
> tango3 or tango4 (for lack of a better discriminant).
>
> Also, (purely hypothetical) suppose something changed in 8756 and up.
> How would the 8758 pick up the improvement, but not the 8734?
>
> I'm also confused, because I thought I read somewhere not to use
> wildcards in compatible strings... <Looking> It was there:
> http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_=
Property
> (Sorry, some of this stuff is a bit hard for me to grok.)

Right, and you just illustrated why wildcards are bad.  Sorry for the
confusion.  I should have known better than to look at existing
bindings.  Let's drop that idea.

Let's try something else:

Device trees list the exact chip, the oldest chip with the same
features, and the oldest compatible chip.  From the sound of things,
that means the smp8759 should use "sigma,smp8759-ethernet",
"sigma,smp8910-ethernet", "sigma,smp8642-ethernet", "aurora,nb8800".

> Finally, I think what you decide to do can also be done for the
> interrupt controller, right?

Sure, the same scheme should be used for all on-chip devices.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
