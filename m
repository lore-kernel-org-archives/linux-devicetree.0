From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: arm64: dts: Add expansion bus to VExpress and
 Juno
Date: Thu, 14 Apr 2016 14:07:52 +0100
Message-ID: <570F9628.70106@arm.com>
References: <1460627546-24230-1-git-send-email-brian.starkey@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460627546-24230-1-git-send-email-brian.starkey-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 14/04/16 10:52, Brian Starkey wrote:
> The VExpress and Juno development platforms have an external expansion
> bus which can be used for additional hardware (e.g. LogicTile Express
> daughterboards).
> Add this bus to all VExpress CoreTile and Juno device-trees.
>

Sorry for missing it earlier, ARM-SoC guys like to keep arm{32,64}
changes separate. So please move Juno DT changes to separate patch.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
