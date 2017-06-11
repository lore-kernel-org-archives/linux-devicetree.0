From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [RFC PATCH 3/4] ARM: l2x0: add arm,ecc-enable property for aurora
Date: Sun, 11 Jun 2017 22:55:37 +0000
Message-ID: <220533aeb8f64e829f483e38e209cdc8@svr-chch-ex1.atlnz.lc>
References: <20170608041124.4624-1-chris.packham@alliedtelesis.co.nz>
 <20170608041124.4624-4-chris.packham@alliedtelesis.co.nz>
 <1496998692.3536.24.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?Jan_L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org" <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/06/17 20:58, Jan L=FCbbe wrote:=0A=
> On Do, 2017-06-08 at 16:11 +1200, Chris Packham wrote:=0A=
>> +       if (of_property_read_bool(np, "arm,ecc-enable")) {=0A=
>> +               mask |=3D L2C_AUX_CTRL_EVTMON_ENABLE;=0A=
>> +               val |=3D L2C_AUX_CTRL_EVTMON_ENABLE;=0A=
>> +       } else if (of_property_read_bool(np, "arm,ecc-disable")) {=0A=
>> +               mask |=3D L2C_AUX_CTRL_EVTMON_ENABLE;=0A=
>> +       }=0A=
> =0A=
> Unless I misunderstand the code in __l2c_init(), the mask is used to=0A=
> specify the bits to preserve:=0A=
>          old_aux =3D aux =3D readl_relaxed(l2x0_base + L2X0_AUX_CTRL);=0A=
>          aux &=3D aux_mask;=0A=
>          aux |=3D aux_val;=0A=
> =0A=
>          if (old_aux !=3D aux)=0A=
>                  pr_warn("L2C: DT/platform modifies aux control register:=
 0x%08x -> 0x%08x\n",=0A=
>                          old_aux, aux);=0A=
> =0A=
> So the arm,ecc-disable property will have no effect. This probably also=
=0A=
> applies to patch 2/4. The existing property *-disable code removes the=0A=
> corresponding bit from the mask.=0A=
=0A=
Indeed the disable version should be mask &=3D ~L2C_AUX_CTRL_EVTMON_ENABLE =
=0A=
and I was probably a little lazy to have used the L2C EVTMON instead of =0A=
adding AURORA specific ones like you have in your series.=0A=
=0A=
I'll rebase my series on top of yours and send it direct to you so you =0A=
can include it in the overall submission.=0A=
=0A=
> =0A=
> Regards,=0A=
> Jan=0A=
> =0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
