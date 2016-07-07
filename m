From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Thu, 07 Jul 2016 12:39:42 -0500
Message-ID: <1467913182.32358.68.camel@buserror.net>
References: <1467412897-15220-1-git-send-email-oss@buserror.net>
	 <1467412897-15220-3-git-send-email-oss@buserror.net>
	 <577E2226.3020902@huawei.com> <577E25A4.2010800@arm.com>
	 <577E3EF2.9080105@huawei.com> <577E424C.5030908@arm.com>
	 <577E524F.3030403@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577E524F.3030403-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-07-07 at 20:59 +0800, Ding Tianhong wrote:
> On 2016/7/7 19:51, Marc Zyngier wrote:
> >=20
> > On 07/07/16 12:37, Ding Tianhong wrote:
> > >=20
> > > On 2016/7/7 17:49, Marc Zyngier wrote:
> > > >=20
> > > > What makes you think that ignoring the two bottom bits is a saf=
e thing
> > > > to do? Talking about performance when the HW has such a dramati=
c bug
> > > > is
> > > > like putting a bigger engine on a car that has no brakes: you j=
ust hit
> > > > the wall quicker.
> > > >=20
> > > > Thanks,
> > > >=20
> > > I have a chip which has the same problem like Scott's chip, and I
> > > wish to solve this problem in the same way, our chip designer tol=
d me
> > > that if you got a wrong value from the cntvct_el0, you would not =
get
> > > a wrong value until 8 cycles later, so I could ignoring the lowes=
t 3
> > > bits if I reading twice together.
> > Is that CPU cycles? Or timer cycles? What guarantees do you have th=
at
> > the two reads are *always* done in the right timing window?
> >=20
> The timer counter only use 56 bits in aarch64, my chip would change o=
ne of
> the higher=C2=A0
> bit(55 to 3) to a wrong value when occur bug, so there will be more t=
han 8
> cycles between
> correct value and wrong value from the timer counter. Maybe Scott's p=
roblem
> is not just like
> mine.

It's not like yours. =C2=A0Most errors I saw were time going backwards =
by 1, 3, or
7 cycles (with occasional larger errors).

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
