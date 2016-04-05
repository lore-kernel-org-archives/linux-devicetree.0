From: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: arm64: dts: Add expansion bus to VExpress and Juno
Date: Tue, 5 Apr 2016 09:14:59 +0100
Message-ID: <20160405081458.GA18740@e106950-lin.cambridge.arm.com>
References: <1459786850-29409-1-git-send-email-brian.starkey@arm.com>
 <57029EC7.8030802@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57029EC7.8030802-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

On Mon, Apr 04, 2016 at 06:05:11PM +0100, Sudeep Holla wrote:
>How do you plan to add those additional hardware on the expansion bus ?
>
>IIUC having them in DT and running on a system without the tile
>connected will cause aborts, hence you are just adding bus definition.
>
>Is there any use in having just the bus definition in DT. If you are
>planning to add devices using overlays, can't the bus definition also
>be added then ?

Did you mean "then" as "when I submit the overlay patches" or "add the
bus in the overlay"?

I wasn't sure the overlays would get accepted into mainline as they
describe proprietary FPGA bitfiles which aren't going to be publicly
available. We should be able to upstream them if that's not an issue.

I'm still interested in getting the bus definition upstream so that we
have a basis for defining our bitfile overlays in our kernel tree(s).
Previously there's been no example or convention leading us to hack the
DTs together in various ways:
https://git.linaro.org/landing-teams/working/arm/kernel.git/commit/14ebf51be6ead99b3861d779bdcf3cee18ab81d6
https://git.linaro.org/landing-teams/working/arm/kernel.git/commit/8e3f902e202f48e2b424c0f049f3894ac83c4c65

As for adding it via overlays; as we use the same bitfile on multiple
platforms, we'd need to maintain and apply a bunch of overlays: one
per-platform for the bus, and one per bitfile for the devices.
It seemed better to get the bus definition (which is fixed) into the
base platform definitions, then we only need overlays to describe the
devices which are unique to a bitfile.

Having the bus definition also serves to document the interrupt lines
and address ranges on the different platforms.

>
>I am fine with the patch as such, just wanted to know the information.
>

Thanks for having a look,

Brian

>-- 
>Regards,
>Sudeep
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
