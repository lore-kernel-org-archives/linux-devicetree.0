From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 1/3] lib/string: introduce ascii2utf16le() helper
Date: Mon, 6 Feb 2017 10:12:01 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1702061009590.2010-100000@iolanthe.rowland.org>
References: <a2874c07d68aa29354154ce1961aa17e6468d40f.1486388711.git.richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a2874c07d68aa29354154ce1961aa17e6468d40f.1486388711.git.richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 6 Feb 2017, Richard Leitner wrote:

> For USB string descriptors we need to convert ASCII strings to UTF16-LE.
> Therefore make a simple helper function (based on ascii2desc from
> drivers/usb/core/hcd.c) for that purpose.

You know, we already have utf8s_to_utf16s() in fs/nls/nls_base.c.  
Maybe it doesn't do exactly what you want, but it should be pretty 
close.  Adding another helper function to do essentially the same thing 
seems unnecessary.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
