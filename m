From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800 Ethernet controller
Date: Mon, 26 Oct 2015 12:05:21 +0000
Message-ID: <yw1x1tchg7i6.fsf@unicorn.mansr.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
	<1445522558-5808-2-git-send-email-mans@mansr.com>
	<562A23B9.3090208@sigmadesigns.com>
	<yw1xio5xg0rq.fsf@unicorn.mansr.com>
	<562DF394.3030500@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562DF394.3030500-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org> (Marc Gonzalez's message of
	"Mon, 26 Oct 2015 10:34:12 +0100")
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
>
> Just to make things a bit more confusing, I learned that Sigma made
> one MIPS-based Tango4 SoC...

That explains the presence of tango4 mentions in a Sigma MIPS kernel
tree I found.  Do you know what it was called?

>>> AFAIK, all our SoCs are using the same Aurora NB8800 Ethernet MAC,
>>> along with the extra features. I find it odd to use a specific SoC
>>> model to refer to this device, instead of a more generic name.
>>> (It's weird having to mention smp8640 in the tango4 DT.)
>>=20
>> I picked 8640 since all 8640 or higher chips are compatible (863x ch=
ips
>> (tango2) are not).  Some of the later versions have additional extra
>> features, but they all work with the basic driver.
>
> According to my branch's FAEs, the first Tango3 was SMP8644.

I don't know which was first out the door, but judging by marketing
materials, 8642, 8644, and 8646 were available around the same time.
All of these also have an odd-numbered variant (8643 etc) without
Macrovision features.

> I showed the DT to a colleague, and his reaction was: "Don't use
> smp8640, it will confuse other engineers, Sigma didn't make a 8640
> SoC."
>
> http://www.qobuz.com/info/IMG/pdf/SMP8643.pdf
>
> Would you be willing to change the compatible string to
> "sigma,smp8644-foo" or "sigma,smp864x-foo" ?
>
> If it's not possible, I suppose I can add comments in the DT, to clea=
r
> the potential confusion for Sigma engineers.

My intent was certainly not to confuse.  Sigma product brochures talk
about the "SMP8640 series," so I figured that would be a good way of
referring to them as a group.  See e.g. this PDF, now gone from the
main sigmadesigns.com site:
http://wayback.archive.org/web/20150101024010/http://www.sigmadesigns.c=
om/uploads/documents/selection_guide.pdf

>> There also appear to be some differences (bug fixes?) between 8643 a=
nd
>> 8759 (the ones I have) not documented anywhere.
>
> Suppose you identify these differences, and you make the appropriate
> changes to the driver. What compatible string would you use to refer
> to the new features? I used "sigma,tango4-ethernet" but IIUC it must
> be more specific, such as the first Tango4 chip to implement these
> changes (I guess that would be the SMP8734).

There are differences even within the tango3 family.  The SMP867x chips
have features not present on the earlier ones.  The tango3 and tango4
codenames are too unspecific to be of use here.  It's better to use
exact chip designations.

> So I should write something like this in my DT?
>
>   eth0: ethernet@26000 {
>     compatible =3D "sigma,smp8734-ethernet", "sigma,smp8640-ethernet"=
, "aurora,nb8800";
>
> Hmmm, you mention this below, but you used "sigma,smp8759-ethernet".
> What about earlier chips?

OK, how about this scheme then:

- Device trees list the exact chip, the chip family, the oldest
  compatible family, and finally the basic "aurora,nb8800".  For the
  SMP8759 that would look like this:
  "sigma,smp8759-ethernet", "sigma,smp87xx-ethernet", "sigma,smp864x-et=
hernet",
    "aurora,nb8800"

- Drivers match against whatever they need to in order to safely
  identify features.  If the driver finds a match for e.g.
  "sigma,smp864x-ethernet" it is allowed to make use of any features
  present in all chips of that family (even if the actual chip is a
  later one, the DT says it's compatible).  If a specific chip is found
  to need a bug workaround or whatever, the driver can enable that by
  matching on the exact string.

This approach means that if the driver is updated to support newer
features, no change is needed to the devicetree, and if a new chip show=
s
up, say a hypothetical smp8764, a driver with support for the smp87xx
family will automatically recognise it without changes.  Unfortunately
the 863x (tango2) chips are not compatible with 864x and later, so it's
not safe to use a catch-all smp86xx.

Speaking more generally about device trees, for chip families like this=
,
it can be a good solution to have all the common parts in, say,
smp87xx.dtsi which is included by chip-specific files, i.e. smp8734.dts=
i
and smp8759.dtsi, with overrides and additions as necessary.  These
files can then be included by the actual board files such as
smp8759-vantage.dts which can apply further tweaks and add nodes for
off-chip peripherals.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
