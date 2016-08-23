From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850: Add missing pin muxing for the UARTs
Date: Tue, 23 Aug 2016 16:39:08 +0530
Message-ID: <fe36e8d1-f371-b093-de15-5e03370ea38c@ti.com>
References: <20160804110656.25318-1-kbeldan@baylibre.com>
 <m2eg64pchw.fsf@baylibre.com> <20160804210045.GD15013@gobelin>
 <m2fuqknnqk.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2fuqknnqk.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 05 August 2016 04:30 AM, Kevin Hilman wrote:
> Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> 
>> On Thu, Aug 04, 2016 at 12:20:27PM -0700, Kevin Hilman wrote:
>>> Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
>>>
>>>> This adds 2 pinctrl groups (rtscts, rxtx) for each of the 3 UARTs.
>>>>
>>>> Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>
>>> Should da850-evm be updated to use the serial2_rxtx_pins also?
>>>
>> I could not find the EVM schematics on the net and I only have an LCDK,
>> but according to the code it should, however I can't tell whether flow
>> control pins are used.
> 
> Ok, let's just leave it for now, since it's working fine.  Sekhar can
> fix that up if he can dig up the schematics.

Looks like the flow control pins are being used for McASP also on the
EVM. So lets leave the EVM as-is.

Regards,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
