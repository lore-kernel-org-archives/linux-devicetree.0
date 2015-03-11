From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Wed, 11 Mar 2015 21:20:31 +0100
Message-ID: <2155628.BceQuZbXC8@wuerfel>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <7DA73171-01A5-4158-9A69-015B62D2D7E8@codeaurora.org> <CAJAp7OiVwvPjRbrBxw7Dndvk4Apwz_bx=CzSqeqd3JzYhmB7Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7OiVwvPjRbrBxw7Dndvk4Apwz_bx=CzSqeqd3JzYhmB7Kw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 11 March 2015 08:33:04 Bjorn Andersson wrote:
> 
> But are these values actually used by the boot loader?
> 
> As far as I could see in 8974 the dtbTool provided by Qualcomm
> extracts the values from the list of dtbs and use them to create the
> table-of-content in the QCDT blob. The boot loader then looks in this
> TOC to pick the right dtb to use.
> 

I guess if I understand this right, we just need to fix that dtbTool
then to look at the top-level compatible property and/or machine
name instead?

	Arnd


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
