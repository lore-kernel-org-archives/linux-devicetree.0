From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] vfio, platform: add support for ACPI while
 detecting the reset driver
Date: Fri, 11 Mar 2016 04:05:37 +0000
Message-ID: <20160311040537.4067a210@arm.com>
References: <1457451209-21462-1-git-send-email-okaya@codeaurora.org>
	<56E14858.9050401@linaro.org>
	<56E1AB38.8020702@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E1AB38.8020702-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Mar 2016 12:13:28 -0500
Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> On 3/10/2016 5:11 AM, Eric Auger wrote:
> > Hi Sinan,
> > On 03/08/2016 04:33 PM, Sinan Kaya wrote:
> >> The  code is using the compatible DT string to associate a reset driver with
> >> the actual device itself. The compatible string does not exist on ACPI
> >> based systems. HID is the unique identifier for a device driver instead.
> >> The change allows a driver to register with DT compatible string or ACPI
> >> HID and then match the object with one of these conditions.
> >>
> >> Rules for loading the reset driver are as follow:
> >> - ACPI HID needs match for ACPI systems
> >> - DT compat needs to match for OF systems
> >>
> >> Tested-by: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (device tree only)
> >> Tested-by: Shanker Donthineni <shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (ACPI only)
> >> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> ---
> >>  .../vfio/platform/reset/vfio_platform_amdxgbe.c    |   4 +-
> >>  .../platform/reset/vfio_platform_calxedaxgmac.c    |   4 +-
> >>  drivers/vfio/platform/vfio_platform_common.c       | 112 +++++++++++++++++----
> >>  drivers/vfio/platform/vfio_platform_private.h      |  43 ++++----
> >>  4 files changed, 125 insertions(+), 38 deletions(-)

[...]

> >> -	vfio_platform_get_reset(vdev);
> >> +	ret = vfio_platform_get_reset(vdev);
> >> +	if (ret) {
> >> +		iommu_group_put(group);
> >> +		return ret;
> >> +	}
> > This change is not related to your commit message. Also here you change
> > the use model of VFIO platform and forbid any usage if no reset module
> > is available, right? I don't think this is something we discussed and I
> > think it removes some flexibility. Currently a warning is emitted in
> > case we don't have a reset function.
> 
> Well, I haven't seen that warning during testing. I was trying to be more 
> proactive.
> 
> I'm fine removing these checks but not having a reset driver needs a really
> big warning here.

This code really needs to be moved to a separate patch, but I agree
overall: a reset function should be made mandatory - I cannot imagine
trusting the HW to be left in a sane state after being used by a guest.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
