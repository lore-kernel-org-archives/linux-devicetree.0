From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev
 driver
Date: Tue, 31 Jan 2017 17:02:40 -0800
Message-ID: <6e77aefa-4f22-60e9-7cc0-55c3a2de3124@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
 <20170131000125.GO27312@n2100.armlinux.org.uk>
 <1485856160.2932.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485856160.2932.10.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/31/2017 01:49 AM, Philipp Zabel wrote:
> On Tue, 2017-01-31 at 00:01 +0000, Russell King - ARM Linux wrote:
> [...]
>> The iMX6 manuals call for a very specific seven sequence of initialisation
>> for CSI2, which begins with:
>>
>> 1. reset the D-PHY.
>> 2. place MIPI sensor in LP-11 state
>> 3. perform D-PHY initialisation
>> 4. configure CSI2 lanes and de-assert resets and shutdown signals
>>
>> Since you reset the CSI2 at power up and then release it, how do you
>> guarantee that the published sequence is followed?

Hi Russell,

In "40.3.1 Startup Sequence", it states that step 1 is to "De-assert
CSI2 presetn signal (global reset)". I can't find any description of
this signal in the manual, that statement is the only mention of it. I
don't know if this the D-PHY reset signal,  it sounds more like
CSI2_RESETN (CSI-2 host controller reset).

In any case, I re-reviewed the published sequence in the manual,
and it does look like there are a couple problems.

The pipeline power up sequence in imx-media driver is as follows:
s_power(ON) op is called first on the imx6-mipi-csi2, in which CSI2 and
D-PHY resets are asserted and then de-asserted via the CSI2_RESETN
and CSI2_DPHY_RSTZ registers, the D-PHY is initialized, and lanes set.

At this point the MIPI sensor may be powered down (in fact, in OV5640
case, the PWDN pin is asserted). So there could be a problem here,
I don't think the D-PHY is considered in the LP-11 stop state when the
D-PHY master is powered off :). A fix might simply be to reverse power
on, sensor first so that it can be placed in LP-11, then imx6-mipi-csi2.

The following steps are carried out by s_stream() calls. Sensor s_stream(ON)
is called first which starts a clock on the clock lane. Then imx6-mipi-csi2
s_stream(ON) in which the PHY_STATE register is polled to confirm the D-PHY
stop state, then looks for active clock on lock lane.

There could be a problem there too. Again should be fixed simply by
calling stream-on on the imx6-mipi-csi2 first, then sensor.

So I will try the following sequence:

1. sensor power on (put D-PHY in LP-11 stop state).
2. csi-2 power on (deassert CSI2 and D-PHY resets, D-PHY init, verify 
LP-11).
3. sensor stream on (starts clock on clock lane).
4. csi-2 stream on (confirm clock on clock lane).

That comes closest to meeting the sequence requirements.

But this also puts a requirement on MIPI sensors that s_power(ON)
should only place the D_PHY in LP-11, and _not_ start the clock lane.
But perhaps that is correct behavior anyway.

Steve


>> With Philipp's driver, this is easy, because there is a prepare_stream
>> callback which gives the sensor an opportunity to get everything
>> correctly configured according to the negotiated parameters, and place
>> the sensor in LP-11 state.
>>
>> Some sensors do not power up in LP-11 state, but need to be programmed
>> fully before being asked to momentarily stream.  Only at that point is
>> the sensor guaranteed to be in the required LP-11 state.
> Do you expect that 1. and 2. could depend on the negotiated parameters
> in any way on some hardware? I had removed the prepare_stream callback
> from my driver in v2 because for my use case at least the above sequence
> could be realized by
>
> 1. in imx-mipi-csi2 s_power(1)
> 2. in MIPI sensor s_power(1)
> 3./4. in imx-mipi-csi2 s_stream(1)
> 4. in MIPI sensor s_stream(1)
>
> as long as the sensor is correctly put back into LP-11 in s_stream(0).
>
> regards
> Philipp
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
