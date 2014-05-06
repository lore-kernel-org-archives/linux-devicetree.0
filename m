From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCHv2 1/2] usb: dwc2: Disable descriptor dma mode by default
Date: Tue, 6 May 2014 23:33:13 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E03046D193DEE@US01WEMBX2.internal.synopsys.com>
References: <1399417243-4614-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399417243-4614-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> Sent: Tuesday, May 06, 2014 4:01 PM
> 
> Even though the IP supports Descriptor DMA mode, it does not support SPLIT
> transactions in this mode. So the driver, in its currently form, will not
> support LS/FS devices when connected to a HS Hub if Descriptor DMA mode is
> enabled.
> 
> So we disable descriptor dma mode by default and a provide device tree property
> for users to enable it if they really want to.

Hi Dinh,

I'd prefer not to add the DT property, at least for now. I doubt if
anyone will want to enable it. Besides, I'm not sure that a property
which only enables a driver feature is appropriate for DT.

So, if you redo patch 1 to remove the DT property read, and drop patch
2, you can add my acked-by. Thanks.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
