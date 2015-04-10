From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Fri, 10 Apr 2015 10:24:46 -0500
Message-ID: <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150410100529.GA6854-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Apr 10, 2015, at 5:05 AM, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org> =
wrote:

> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
>> This patch set adds support for SMP boot on the MSM8x16 family of Qu=
alcomm SoCs.
>>=20
>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM i=
nterfaces to
>> setup the boot/release addresses for the secondary CPUs.  In additio=
n we need
>> a uniquie set of cpu ops.  I'm aware the desired methods for booting=
 secondary
>> CPUs is either via spintable or PSCI.  However, these SoCs are shipp=
ing with a
>> firmware that does not support those methods.
>=20
> And the reason is? Some guesses:
>=20
> a) QC doesn't think boot interface (and cpuidle) standardisation is
>   worth the effort (to put it nicely)
> b) The hardware was available before we even mentioned PSCI
> c) PSCI is not suitable for the QC's SCM interface
> d) Any combination of the above
>=20
> I strongly suspect it's point (a). Should we expect future QC hardwar=
e
> to do the same?
>=20
> You could argue the reason was (b), though we've been discussing PSCI
> for at least two years and, according to QC press releases, MSM8916
> started sampling in 2014.
>=20
> The only valid reason is (c) and if that's the case, I would expect a
> proposal for a new firmware interface protocol (it could be PSCI-base=
d),
> well documented, that can be shared with others that may encounter th=
e
> same shortcomings.
>=20
> --=20
> Catalin

Does it matter?  I=92ve always felt the kernel was a place of inclusion=
=2E  Qualcomm choose for whatever reason to not use PSCI or spin table.=
  You don=92t like it, I might not like it, but it is what it is.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
