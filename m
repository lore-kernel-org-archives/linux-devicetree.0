From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add Keystone2 Remoteproc driver
Date: Fri, 23 Jun 2017 16:31:15 -0500
Message-ID: <51634d20-41a1-0501-c07d-c4e5492ad422@ti.com>
References: <20170613234513.7624-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613234513.7624-1-s-anna-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/13/2017 06:45 PM, Suman Anna wrote:
> Hi Bjorn,
> 
> This is v3 of the patchset that adds the DT binding and the driver for
> loading and booting the DSP devices present on various Keystone2 SoC families.
> The binding and driver patches have already been acked by Rob Herring and Santosh
> Shilimkar respectively, and this is just a minor refresh with one small comment
> from Rob addressed in the binding (Patch 1). There are no code changes in remaining
> patches. I have picked up their Acks in all the relevant patches.
> 
> Appreciate it if you can pick up the series for v4.13.

Gentle reminder for picking this up for v4.13 merge window.

Thanks
Suman

> 
> v2:
> http://marc.info/?l=linux-kernel&m=149688154304565&w=2
> v1:
> http://marc.info/?t=149581802500004&r=1&w=2
> 
> regards
> Suman
> 
> Andrew F. Davis (1):
>   remoteproc/keystone: Ensure the DSPs are in reset in probe
> 
> Suman Anna (2):
>   dt-bindings: remoteproc: Add Keystone DSP remoteproc binding
>   remoteproc/keystone: Add a remoteproc driver for Keystone 2 DSPs
> 
>  .../bindings/remoteproc/ti,keystone-rproc.txt      | 133 ++++++
>  drivers/remoteproc/Kconfig                         |  13 +
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/keystone_remoteproc.c           | 525 +++++++++++++++++++++
>  4 files changed, 672 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
>  create mode 100644 drivers/remoteproc/keystone_remoteproc.c
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
