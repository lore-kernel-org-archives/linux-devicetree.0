From: "Mani, Rajmohan" <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH 0/3] DW9714 DT support
Date: Wed, 23 Aug 2017 01:22:38 +0000
Message-ID: <6F87890CF0F5204F892DEA1EF0D77A5972FA7293@FMSMSX114.amr.corp.intel.com>
References: <1502977376-22836-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502977376-22836-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for the patches.

I have verified that the dw9714 driver gets probed via DT bindings, with these patches on 4.13-rc6 kernel.

Feel free to add

Tested-by: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Raj

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org]
> Sent: Thursday, August 17, 2017 6:43 AM
> To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Mani, Rajmohan
> <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH 0/3] DW9714 DT support
> 
> Hi all,
> 
> This patchset adds DT bindings as well as DT support for DW9714. The unused
> ACPI match table is removed.
> 
> Sakari Ailus (3):
>   dt-bindings: Add bindings for Dongwoon DW9714 voice coil
>   dw9714: Add Devicetree support
>   dw9714: Remove ACPI match tables, convert to use probe_new
> 
>  .../bindings/media/i2c/dongwoon,dw9714.txt         |  9 ++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  drivers/media/i2c/dw9714.c                         | 26 +++++++++-------------
>  3 files changed, 21 insertions(+), 15 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
> 
> --
> 2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
