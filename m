From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v4 3/7] phy: Add set_mode callback
Date: Mon, 9 May 2016 17:47:59 -0500
Message-ID: <5731139F.4020602@lechnology.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-4-git-send-email-david@lechnology.com>
 <20160504181030.GA4327@uda0271908> <572A3D74.3080907@lechnology.com>
 <20160504183903.GB27414@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160504183903.GB27414@uda0271908>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/04/2016 01:39 PM, Bin Liu wrote:
> On Wed, May 04, 2016 at 01:20:36PM -0500, David Lechner wrote:
>> This is something I actually plan on using because the device I am
>> using (LEGO MINDSTORMS EV3) is not wired for OTG, so the callback is
>> needed to override the ID and VBUS signals when switching between
>> host and peripheral mode.
>
> Have you already tested this? I never tried changing mode via sysfs, but
> by quickly reviewing the code, I am wondering how it works. the core
> only calls ops->set_mode() but nothing else. To really switch the mode,
> the driver has to talk to the root hub, and manipulate the SESSION
> bit...
>

I have tested this now and it works. It works because by setting the 
mode, we are overriding the VBUS and ID signals, which in turn triggers 
interrupts. I have tested switching to both peripheral mode and host 
mode via sysfs. Host mode has some issues if you are using a 
self-powered device, but that is a bug in the da8xx glue layer and 
shouldn't hold up this patch series. Aside from that, it works exactly 
as expected.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
