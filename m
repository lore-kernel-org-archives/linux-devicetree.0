From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH RFC 6/7] usb: host: ehci-exynos: Remove unnecessary
 usb-phy support
Date: Fri, 15 Aug 2014 11:22:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1408151121580.1144-100000@iolanthe.rowland.org>
References: <1408026240-28365-7-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408026240-28365-7-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 14 Aug 2014, Vivek Gautam wrote:

> Now that we have completely moved from older USB-PHY drivers
> to newer GENERIC-PHY drivers for PHYs available with USB controllers
> on Exynos series of SoCs, we can remove the support for the same
> in our host drivers too.
> This should fix the issue on ehci-exynos, wherein in the absence of
> SAMSUNG_USB2PHY config symbol, we ended up getting the NOP_USB_XCEIV phy
> when the same is enabled. And thus the PHYs are not configured properly.
> 
> Reported-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
