From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P)
 support
Date: Thu, 3 Nov 2016 17:20:05 -0700
Message-ID: <20161104002005.GA15578@mini-rhel.redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
 <20161028000656.GH26139@codeaurora.org>
 <822ebad4-4fdf-574a-12cb-75b0165f4746@redhat.com>
 <20161103223246.GA5135@hector>
 <9e0555fa-d689-e26e-feba-9daa815eb1c5@codeaurora.org>
 <20161103230429.GW25787@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161103230429.GW25787@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Bastian K?cher <mail-LJ92rlH3Dns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 04:04:29PM -0700, Bjorn Andersson wrote:
> On Thu 03 Nov 15:42 PDT 2016, Stephen Boyd wrote:
> 
> > On 11/03/2016 03:32 PM, Andy Gross wrote:
> > > On Thu, Oct 27, 2016 at 05:54:01PM -0700, Jeremy McNicoll wrote:
> > >> On 2016-10-27 5:06 PM, Stephen Boyd wrote:
> > >>> On 10/25, Jeremy McNicoll wrote:
> > >>>> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> > >>>> new file mode 100644
> > >>>> index 0000000..2fc68c4
> > >>>> --- /dev/null
> > >>>> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> > >>>> @@ -0,0 +1,40 @@
> > >>>> +/* Copyright (c) 2015, Huawei Inc. All rights reserved.
> > >>>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> > >>>> + *
> > >>>> + * This program is free software; you can redistribute it and/or modify
> > >>>> + * it under the terms of the GNU General Public License version 2 and
> > >>>> + * only version 2 as published by the Free Software Foundation.
> > >>>> + *
> > >>>> + * This program is distributed in the hope that it will be useful,
> > >>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > >>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > >>>> + * GNU General Public License for more details.
> > >>>> + */
> > >>>> +
> > >>>> +/dts-v1/;
> > >>>> +
> > >>>> +#include "msm8994-v2.0.dtsi"
> > >>>> +
> > >>>> +/ {
> > >>>> +	model = "HUAWEI MSM8994 ANGLER rev-1.01";
> > >>>> +	compatible = "qcom,msm8994";
> > >>> Please replace this with something more specific for the actual
> > >>> board. Preferably with the board manufacturer vendor prefix and
> > >>> some sort of string for the board.
> > > Something like?
> > >
> > > "huawei,nexus-6P", "qcom,msm8994"
> > 
> > Sure, except completely remove qcom,msm8994 from there.
> 
> Why? So far we have always used the form <device>, <platform> as
> compatible. This is even in line with ePAPR, what changed?
> 
> Also, the compatible should be "huawei,angler" (if I read the internet
> correctly) and the model should contain the product name
> (Huawei Nexus 6P).
>

What about 

  model = "Huawei Nexus 6P";
  compatible = "huawei, angler", "qcom,msm8994";

?

Obviously I will update the Nexus5X to look similar. 

-jeremy

> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
