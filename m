From: Hannes Petermaier <Hannes.Petermaier-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
Subject: Fwd: Fwd: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT properties for
 tscadc
Date: Tue, 14 Apr 2015 13:16:42 +0200
Message-ID: <OFD386DA80.D9FD2A2E-ONC1257E27.003DC94D-C1257E27.003DF465@br-automation.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jan Kardell <jan.kardell-KSZdJiTw9mzQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org, Johannes Pointner <Johannes.Pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vignesh,

did you recognize my last email ? whats your opinion around that =

best regards,
Hannes
----- Forwarded by Hannes Petermaier/Eggelsberg/AT/B&R on 14.04.2015 13:14 
-----

Hannes Petermaier/Eggelsberg/AT/B&R schrieb am 07.04.2015 14:30:19:

> From: Hannes Petermaier/Eggelsberg/AT/B&R
> To: vigneshr-l0cyMroinI0@public.gmane.org
> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Date: 07.04.2015 14:30
> Subject: WG: Fwd: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT 
properties for tscadc
> 
> Hi Vignesh,
> 
> would it be possible to add some more channel-specific settings ?
> 
> It would be nice to have allmost full control to the STEPCONFIGx 
register.
> 
> At least we need to write the bits
> 
> SEL_RFM_SWC_1_0
> SEL_INM_SWC_3_0 
> SEL_RFP_SWC_2_0 
> 
> In the current mainline version only (SEL_INP_SWC_3_0) is written.
> So for the other bits "0" is value is used, for my point of view this is 
not correct.
> 
> For example if we want to read a value from AIN5 the negative pin from 
adc is 
> muxed allways to AIN0.
> In fact i can readout heavy jitter even if AIN5 is connected to ground - 
after
> setting up negative adc pin within code (to use REFN)  the readout value 
is 0 
> as expected without nameable jitter.
> If i short AIN0 also to ground, jitter is also eliminated.
> 
> Maybe this is also some fault of TI SoC ... in normal case somebody 
could 
> expect, that negative adc pin is equal even the Diff_CNTRL bit isn't set 
- but
> in practice it isn't.
> 
> Also actually it isn't possible to make some accurate measurement due to 
the 
> fact that allways VDDA_ADC is used as positive reference.
> 
> So it would be nice to have control around this bits.
> Whats your opinion around that?
> 
> best regards,
> Hannes
> ----- Forwarded by Hannes Petermaier/Eggelsberg/AT/B&R on 07.04.2015 
14:17 -----
> 
> From: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: hannes.petermaier-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org
> Date: 07.04.2015 13:58
> Subject: Fwd: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT properties 
for tscadc
> 
> ---------- Forwarded message ----------
> From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> Date: 2015-03-31 13:12 GMT+02:00
> Subject: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT properties for 
tscadc
> To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>,
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell
> <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>,
> Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen
> <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov
> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jan
> Kardell <jan.kardell-KSZdJiTw9mzQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
> fcooper-l0cyMroinI0@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> 
> 
> 
> Hi,
> 
> This patch adds optional DT properties for tscadc to set open delay,
> sample delay and number of averages per sample for each adc channel.
> Open delay, sample delay and averaging are some of the parameters that
> affect the sampling rate and accuracy of the tscadc. Decreasing delays
> and averaging helps to achieve higher sampling rates, while increasing
> this parameters provides greater accuracy. Hence, this patch provides DT
> properties to set the initial values for delays and number of averages
> per sample. User space control via sysfs can be added later.
> 
> 
> Vignesh R (2):
>   iio: adc: ti_am335x_adc: refactor DT parsing into a function
>   iio: adc: ti_am335x_adc: make sample delay, open delay, averaging DT
>     parameters
> 
>  .../bindings/input/touchscreen/ti-tsc-adc.txt      | 24 +++++++
>  drivers/iio/adc/ti_am335x_adc.c                    | 83 
+++++++++++++++++-----
>  2 files changed, 91 insertions(+), 16 deletions(-)
> 
> --
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
