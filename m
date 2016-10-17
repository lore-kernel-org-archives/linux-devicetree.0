From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64/dts: Add SMMUs to Juno
Date: Mon, 17 Oct 2016 17:47:02 +0100
Message-ID: <a8396d14-7f4b-692a-1ed3-bfb76add8b6e@arm.com>
References: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17/10/16 13:13, Robin Murphy wrote:
> Juno has seperate MMU-401 instances in front of the DMA-330, both HDLCD
> controllers, the USB host controller, the PCIe root complex, and the
> CoreSight ETR. Since there is still work to do to make all the relevant
> subsystems interact nicely with the presence of an IOMMU, add the nodes
> to aid develompent and testing but leave them disabled by default to
> avoid nasty surprises.
>
> CC: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> CC: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Applied to [1] with $subject reformatted and typos fixed

-- 
Regards,
Sudeep

[1] git.kernel.org/sudeep.holla/linux/h/juno-dt/for-next
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
