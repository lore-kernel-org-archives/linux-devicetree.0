From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] isp1760: Fix endianness-sensitivity in
 of_isp1760_probe()
Date: Thu, 15 Sep 2011 09:53:21 +0100
Message-ID: <20110915085321.GA2016@arm.com>
References: <1316008633-31009-1-git-send-email-dave.martin@linaro.org>
 <1316008633-31009-3-git-send-email-dave.martin@linaro.org>
 <4E70FCB9.4050907@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E70FCB9.4050907-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Sep 14, 2011 at 09:46:29AM -0600, Grant Likely wrote:
> On Wed, Sep 14, 2011 at 02:57:13PM +0100, Dave Martin wrote:

[...]

> > +   of_property_read_u32(dp, "bus-width", bus_width);
>
> Shouldn't this be '&bus_width'?


On Wed, Sep 14, 2011 at 11:12:57PM +0400, Sergei Shtylyov wrote:
[...]

> On 09/14/2011 05:57 PM, Dave Martin wrote:
[...]

> >+	of_property_read_u32(dp, "bus-width", bus_width);
> 
>    You probably mean '&bus_width'?

Yes, it should -- quite right.

Cheers
---Dave
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
