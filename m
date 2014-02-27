From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] phy-rcar-gen2-usb: add device tree support
Date: Thu, 27 Feb 2014 19:50:29 +0400
Message-ID: <530F5EC5.7060309@cogentembedded.com>
References: <201402270312.51588.sergei.shtylyov@cogentembedded.com> <530F3637.5050000@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530F3637.5050000-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, valentine.barshak-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 27-02-2014 16:57, Ben Dooks wrote:

>> Add support of the device tree probing for the Renesas R-Car generation 2 SoCs
>> documenting the device tree binding as necessary.

> So what happened w.r.t to my last set of patches for this?

    Hm, I forgot you've posted the OF patch already (and I was tasked with the 
PHY driver OF support). I have re-read the thread now, and the issue was that 
Felipe wanted an ACK from one of DT maintainers. I had issues with the 
"compatible" props the driver reacts on. Also, I didn't see your bindings doc 
patch the last time you posted the driver patch. I have one more issue now and 
will follow up to the patch with it...

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
