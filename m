From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v4 3/7] phy: Add set_mode callback
Date: Wed, 4 May 2016 14:48:21 -0500
Message-ID: <572A5205.8010509@lechnology.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-4-git-send-email-david@lechnology.com>
 <20160504181030.GA4327@uda0271908> <572A3D74.3080907@lechnology.com>
 <20160504183903.GB27414@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160504183903.GB27414@uda0271908>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/04/2016 01:39 PM, Bin Liu wrote:
>
> Have you already tested this? I never tried changing mode via sysfs, but
> by quickly reviewing the code, I am wondering how it works. the core
> only calls ops->set_mode() but nothing else. To really switch the mode,
> the driver has to talk to the root hub, and manipulate the SESSION
> bit...
>
> Regards,
> -Bin.
>


I haven't actually tried this. I need to hack together a USB cable to 
test it in host mode (Mini-B to Mini-B w/ powered hub).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
