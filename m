From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Re: Converting "board file" to device tree one device at a time?
Date: Fri, 31 Jul 2015 16:54:00 +0200
Message-ID: <55BB8C08.1060006@free.fr>
References: <55BB4686.8030509@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55BB4686.8030509-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31/07/2015 11:57, Mason wrote:

> Then I set a breakpoint in of_platform_serial_probe, hoping
> to witness the miracle... and nothing. Looks like device is
> never registered :-(

IIUC, the kernel is supposed to parse my "uart0" node, and
register the device. Then the platform framework should see
that the node's "compatible" property is equal to one
advertized by the of_platform_serial_driver, and the kernel
should #!@& call of_platform_serial_probe? Right?!

I just can't believe how much time I've been pulling my hair
over this trivial issue...

Regards.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
