From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Compatible string best practices
Date: Fri, 23 May 2014 08:03:06 -0700
Message-ID: <cc5b8415-4297-49fb-8a2c-bdc4b1b19c2c@BY2FFO11FD033.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, git-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I have a question regarding how a compatible string should be created.
The simple case is obvious:
 <IP-vendor>,<IP-type/name>-<IP-revision>

But what is the recommended string for a SOC specific implementation of
that IP? Let's say for
 <SOC-vendor>,<SOC-name>-<SOC-revision>
how would I assemble a compatible string to identify the SOC-specific
implementation of IP?
I think my biggest confusion is which vendor string to use in that case=
=2E
But in general I'm curious whether some best practice exists for these
cases.

I think what I've seen most is:
 <SOC-vendor>,<SOC-name>-<IP-type>

But one could probably argue whether to rather use IP-vendor, appending
all the revision strings, ...

	Thanks,
	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
