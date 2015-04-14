From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT properties for
 tscadc
Date: Tue, 14 Apr 2015 17:32:42 +0530
Message-ID: <552D01E2.4080305@ti.com>
References: <OFD386DA80.D9FD2A2E-ONC1257E27.003DC94D-C1257E27.003DF465@br-automation.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <OFD386DA80.D9FD2A2E-ONC1257E27.003DC94D-C1257E27.003DF465-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hannes Petermaier <Hannes.Petermaier-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jan Kardell <jan.kardell-KSZdJiTw9mzQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org, Johannes Pointner <Johannes.Pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hannes,

On Tuesday 14 April 2015 04:46 PM, Hannes Petermaier wrote:
> Hi Vignesh,
> 
> did you recognize my last email ? whats your opinion around that =
> 
> best regards,
> Hannes
> ----- Forwarded by Hannes Petermaier/Eggelsberg/AT/B&R on 14.04.2015 13:14 
> -----
> 
> Hannes Petermaier/Eggelsberg/AT/B&R schrieb am 07.04.2015 14:30:19:
> 
>> From: Hannes Petermaier/Eggelsberg/AT/B&R
>> To: vigneshr-l0cyMroinI0@public.gmane.org
>> Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Date: 07.04.2015 14:30
>> Subject: WG: Fwd: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT 
> properties for tscadc
>>
>> Hi Vignesh,
>>
>> would it be possible to add some more channel-specific settings ?
>>
>> It would be nice to have allmost full control to the STEPCONFIGx 
> register.
>>
>> At least we need to write the bits
>>
>> SEL_RFM_SWC_1_0
>> SEL_INM_SWC_3_0 
>> SEL_RFP_SWC_2_0 
>>
>> In the current mainline version only (SEL_INP_SWC_3_0) is written.
>> So for the other bits "0" is value is used, for my point of view this is 
> not correct.
>>
>> For example if we want to read a value from AIN5 the negative pin from 
> adc is 
>> muxed allways to AIN0.

Sorry... I didn't understand what you meant by"AIN5 is muxed always with
AIN0"?

>> In fact i can readout heavy jitter even if AIN5 is connected to ground - 
> after
>> setting up negative adc pin within code (to use REFN)  the readout value 
> is 0 
>> as expected without nameable jitter.
>> If i short AIN0 also to ground, jitter is also eliminated.

Hmmm... nobody has reported such behavior before. ADC support for
am335x-evm/beaglebone has been there for quite long time, but nobody
reported any jitter on AIN5 line. I think this may be specific to
your setup. Can you provide more info with regard to your setup?
Which kernel? Is it am335x-evm or beaglebone or a custom board?

>>
>> Maybe this is also some fault of TI SoC ... in normal case somebody 
> could 
>> expect, that negative adc pin is equal even the Diff_CNTRL bit isn't set 
> - but
>> in practice it isn't.
>>
>> Also actually it isn't possible to make some accurate measurement due to 
> the 
>> fact that allways VDDA_ADC is used as positive reference.
>>
>> So it would be nice to have control around this bits.
>> Whats your opinion around that?

Sorry, I am not yet clear on your bug/use-case.

Please comment inline while replying on mailing list

Regards
Vignesh
