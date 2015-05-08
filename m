From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: Zynq: DT: Disable xadc node by default in zynq-7000.dtsi
Date: Fri, 08 May 2015 09:53:24 -0500
Message-ID: <554CCDE4.9090904@ni.com>
References: <1431037945-40360-1-git-send-email-xander.huff@ni.com> <20150507223635.GH8150@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150507223635.GH8150@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/7/2015 5:36 PM, S=C3=B6ren Brinkmann wrote:
> For peripherals that might not be pinned out on a board. But the XADC=
 is
> always present in Zynq and can be used to read the temperature in any
> case.
OK, this makes sense, thanks!

Please disregard this patch set

--=20
Xander Huff
Staff Software Engineer
National Instruments
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
