From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 1 Apr 2016 12:45:21 +0530
Message-ID: <56FE2009.4020302@nvidia.com>
References: <20160331174741.GO2350@sirena.org.uk> <56FD62BA.3040406@nvidia.com> <20160331183130.GR2350@sirena.org.uk> <56FD6CF7.5080909@nvidia.com> <20160331184553.GS2350@sirena.org.uk> <56FD6ED6.3020507@nvidia.com> <20160331185945.GT2350@sirena.org.uk> <56FD7379.2000307@nvidia.com> <20160331192227.GU2350@sirena.org.uk> <56FD7F07.7010404@nvidia.com> <20160331203942.GV2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331203942.GV2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 01 April 2016 02:09 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 01, 2016 at 01:18:23AM +0530, Laxman Dewangan wrote:
>> On Friday 01 April 2016 12:52 AM, Mark Brown wrote:
>> So as per above, it will be adjusted to 13.75mV/us (nearest higher s=
ide) for
>> device configuration but this device need to configure for 27.5mV/us=
=2E
> You're saying that the device is so bad at regulating the ramp rate t=
hat
> it's not only failing to keep up with the desired ramp rate and cappi=
ng
> at whatever rate but it's also doing even worse if configured for a
> slower rate?  That's not great, it sounds like it's doing the ramp
> control via some sort of dead reckoning thing rather than by actually
> ramping the voltage it's trying to regulate like it was asked to.
>
> Is the error in the observed values a function of the capacitance tha=
t
> we can calcuate here?
>
As per datasheet, There is no direct equation for ramp time deviation=20
when regulator output current cross the regulator current limit.

 From data sheet:
/**

During a DVS transition, the regulators output current will increase by=
=20
COUT*dV/dt. In the event that the load current plus the additional=20
current imposed by the DVS transition, reach the regulator=C2=92s curre=
nt=20
limit, the current limit will be enforced. When the current limit is=20
enforced, the advertised DVS transition rate (dV/dt) will not occur.


And there is calculation of Iinrush based on Cout and configured dv/dt.
Iinrush=3Dmin(Ilim & Cout*dV/dt).

IINRUSH calculation for Cout =3D 100uF

IINRUSH=3Dmin(ILIMP & COUT*dV/dt).
SD0 is a two phase regulator with a typical PMOS current limit (ILIMPP0=
)=20
of 3.75A per phase. For ILIMP in the above equation we will use=20
2x3.75A=3D7.5A.
SD0 has a typical soft-start rate (dV/dt_SS_SD0) of 25mV/us. For dv/dt=20
in the above equation we will use 25mV/us.
IINRUSH=3Dmin(7.5A & 100uF*25mV/us).
IINRUSH=3Dmin(7.5A & 2.5A).
IINRUSH=3D2.5A

**/


So providing configured and observed value direct will help much here.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
