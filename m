From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 13 Apr 2012 09:29:10 +0530
Message-ID: <4F87A48E.3090300@st.com>
References: <1332431402-20606-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332431402-20606-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/22/2012 9:20 PM, Stefan Roese wrote:
> This patch adds support to configure the SPEAr EHCI & OHCI driver via
> device-tree instead of platform_data.
> 
> Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/spear-usb.txt          |   39 ++++++++++++++++++++
>  drivers/usb/host/ehci-spear.c                      |   32 +++++++++++++---
>  drivers/usb/host/ohci-spear.c                      |   32 +++++++++++++---
>  3 files changed, 91 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/spear-usb.txt

Hi Greg,

Have you applied this patch?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
