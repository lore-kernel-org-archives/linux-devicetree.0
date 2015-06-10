From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Wed, 10 Jun 2015 16:46:33 +0200
Message-ID: <CAPybu_2dpcpjPvn-kXaW-yC2OmkNPna+G8PLO-gP1cMBOcU_ew@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
 <20150608184713.446B7C406AA@trevor.secretlab.ca> <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
 <20150609110044.61031C40580@trevor.secretlab.ca> <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
 <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com> <CAMAWPa-bGwVCnmv=H=8Zo-NCw-nOFBj3-XcVvb-0m0sNYtPO7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMAWPa-bGwVCnmv=H=8Zo-NCw-nOFBj3-XcVvb-0m0sNYtPO7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Greg

On Wed, Jun 10, 2015 at 4:38 PM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jun 10, 2015 at 12:11 AM, Ricardo Ribalda Delgado

> At this stage of the cycle (merge window opening soon, maintainers
> trying to stabilize their stuff for Linus) we want to see linux-next
> approaching some level of stability.

Please revert

base/platform: Only insert MEM and IO resources
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=36d4b29260753ad78b1ce4363145332c02519adc
base/platform: Continue on insert_resource() error
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=e50e69d1ac4232af0b6890f16929bf5ceee81538
of/platform: Use platform_device interface
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=b6d2233f2916fa9338786aeab2e936c5a07e4d0c
base/platform: Remove code duplication
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=6d9d4b1469b0d9748145e168fc9ec585e1f3f4b0


This patch from Grant needs to be applied:

[PATCH 2/2] drivercore: Fix unregistration path of platform devices

I dont know if it should go throw your tree or Grants devicetree, but
it needs to be backported to 4.0


Thanks!

>
> Kevin



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
