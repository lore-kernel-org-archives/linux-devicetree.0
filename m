From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: arm64: dts: Add expansion bus to VExpress and Juno
Date: Mon, 4 Apr 2016 18:05:11 +0100
Message-ID: <57029EC7.8030802@arm.com>
References: <1459786850-29409-1-git-send-email-brian.starkey@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459786850-29409-1-git-send-email-brian.starkey-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 04/04/16 17:20, Brian Starkey wrote:
> The VExpress and Juno development platforms have an external expansion
> bus which can be used for additional hardware (e.g. LogicTile Express
> daughterboards).

How do you plan to add those additional hardware on the expansion bus ?

IIUC having them in DT and running on a system without the tile
connected will cause aborts, hence you are just adding bus definition.

Is there any use in having just the bus definition in DT. If you are
planning to add devices using overlays, can't the bus definition also
be added then ?

I am fine with the patch as such, just wanted to know the information.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
