From: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Mon, 26 Oct 2015 10:34:12 +0100
Message-ID: <562DF394.3030500@sigmadesigns.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
 <1445522558-5808-2-git-send-email-mans@mansr.com>
 <562A23B9.3090208@sigmadesigns.com> <yw1xio5xg0rq.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <yw1xio5xg0rq.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
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
>>
>> I've been meaning to ask a noob question to the devicetree group
>> about how names for compatible strings are chosen.
>>
>> Sigma Designs has two active SoC families, Tango3 (which consists of
>> about a dozen MIPS-based SoCs, typically named SMP86xx) and Tango4
>> (a few ARM-based SoCs, typically named SMP87xx). I should note that
>> there is no SMP8640 SoC AFAIK, rather SMP864x is a Tango3 sub-family
>> (I could locate 42,43,44,45,46).

Just to make things a bit more confusing, I learned that Sigma made
one MIPS-based Tango4 SoC...

>> AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
>> along with the extra features. I find it odd to use a specific SoC
>> model to refer to this device, instead of a more generic name.
>> (It's weird having to mention smp8640 in the tango4 DT.)
>=20
> I picked 8640 since all 8640 or higher chips are compatible (863x chi=
ps
> (tango2) are not).  Some of the later versions have additional extra
> features, but they all work with the basic driver.

According to my branch's FAEs, the first Tango3 was SMP8644. I showed
the DT to a colleague, and his reaction was: "Don't use smp8640, it wil=
l
confuse other engineers, Sigma didn't make a 8640 SoC."

http://www.qobuz.com/info/IMG/pdf/SMP8643.pdf

Would you be willing to change the compatible string to
"sigma,smp8644-foo" or "sigma,smp864x-foo" ?

If it's not possible, I suppose I can add comments in the DT, to clear
the potential confusion for Sigma engineers.

> There also appear to be some differences (bug fixes?) between 8643 an=
d
> 8759 (the ones I have) not documented anywhere.

Suppose you identify these differences, and you make the appropriate
changes to the driver. What compatible string would you use to refer
to the new features? I used "sigma,tango4-ethernet" but IIUC it must
be more specific, such as the first Tango4 chip to implement these
changes (I guess that would be the SMP8734).

So I should write something like this in my DT?

  eth0: ethernet@26000 {
    compatible =3D "sigma,smp8734-ethernet", "sigma,smp8640-ethernet", =
"aurora,nb8800";

Hmmm, you mention this below, but you used "sigma,smp8759-ethernet".
What about earlier chips?

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

[Preserved for context]

Regards.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
