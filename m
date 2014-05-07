From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 07 May 2014 21:15:22 +0200
Message-ID: <5898724.4EExDycMZy@wuerfel>
References: <536A697D.3020002@boundarydevices.com> <142702592.Qpp2HrZZke@wuerfel> <536A8456.1040208@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A8456.1040208-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 May 2014 12:07:02 Eric Nelson wrote:
> For me, setting the status to "disabled" required a
> "resize" first:
> 
>         U-Boot > fdt set /v4l2_out status disabled
>         libfdt fdt_setprop(): FDT_ERR_NOSPACE
>         U-Boot > fdt resize
>         U-Boot > fdt set /v4l2_out status disabled
> 
>         U-Boot > fdt print /v4l2_out
>         v4l2_out {
>                 compatible = "fsl,mxc_v4l2_output";
>                 status = "disabled";
>         };
> 

How about starting out with status="disabled" and then 
removing that if necessary? Leaving out the status property
should have the same effect as setting it to "ok".

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
