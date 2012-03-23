From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 23 Mar 2012 09:18:05 +0530
Message-ID: <4F6BF275.9040007@st.com>
References: <1332431402-20606-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332431402-20606-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, deepak sikri <deepak.sikri-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/22/2012 9:20 PM, Stefan Roese wrote:
> +static struct of_device_id spear_ohci_id_table[] __devinitdata = {
> +	{ .compatible = "st,spear600-ohci", },

Hi Stefan,

I have this question for other drivers (fsmc, stmmac...) as well:
Why do we name it spear600-ohci and not spear-ohci?
Because i believe we have same version of USB on all SPEAr SoCs.

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
