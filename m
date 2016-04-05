From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 5 Apr 2016 13:31:41 +0530
Message-ID: <570370E5.3070901@nvidia.com>
References: <20160331183130.GR2350@sirena.org.uk> <56FD6CF7.5080909@nvidia.com> <20160331184553.GS2350@sirena.org.uk> <56FD6ED6.3020507@nvidia.com> <20160331185945.GT2350@sirena.org.uk> <56FD7379.2000307@nvidia.com> <20160331192227.GU2350@sirena.org.uk> <56FD7F07.7010404@nvidia.com> <20160331203942.GV2350@sirena.org.uk> <56FE2009.4020302@nvidia.com> <20160401161121.GZ2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160401161121.GZ2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 01 April 2016 09:41 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 01, 2016 at 12:45:21PM +0530, Laxman Dewangan wrote:
>> On Friday 01 April 2016 02:09 AM, Mark Brown wrote:
>>> Is the error in the observed values a function of the capacitance t=
hat
>>> we can calcuate here?
>> As per datasheet, There is no direct equation for ramp time deviatio=
n when
>> regulator output current cross the regulator current limit.
> OK, so it's really a current limit that's kicking in rather than a ra=
mp
> rate control (though if it's a current limit I'm still not clear why =
the
> target rate limits where we cap)?  Can we do something based on the
> maximum load configured and the current limit?  That sounds more gene=
ric
> anyway, a current limiting feature is quite common.  If we implement =
the
> current limit interface for the regulator and then specify what the
> maximum load is we should be able to do the calculations you quoted f=
rom
> the datasheet I'd have thought (unless I'm missing something).

We are not having any control/configuration for this in this particular=
=20
observations. All are set at maximum and still seeing this deviation.

During a DVS transition, the regulators output current will increase by=
=20
COUT*dV/dt. In the event that the load current plus the additional=20
current imposed by the DVS transition, reach the regulator=C2=92s curre=
nt=20
limit, the current limit will be enforced. When the current limit is=20
enforced, the advertised DVS transition rate (dV/dt) will not occur.

Now there is not really equation that how it control dV/dt with require=
d=20
current vs regulator=C2=92s current limit current limit.

Working with HW team on LDO3 rail, we observed that Vendor recommend th=
e=20
Cout to 2.2uF. With having this capacitor in rail, we meet the=20
advertised dv/dt i.e. 100mV/us.
In Our platform, we have used 2x4.7uF for signal conditioning and we=20
observed dv/dt went by half.
When we changed the output capacitor to 2.2uF, we get exactly what=20
vendor advertised.

So can we derive the configured value from the ramp time (platform) and=
=20
some multiplication factor? If this is not common way then probably=20
maxim specific as suggested by Bjorn.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
