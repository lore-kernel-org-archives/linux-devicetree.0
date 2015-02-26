From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Thu, 26 Feb 2015 10:26:50 +0000
Message-ID: <20150226102650.7407cf02@lxorguk.ukuu.org.uk>
References: <20140220182257.GF23217@saruman.home>
	<5306F458.9010706@monstr.eu>
	<20140221160442.GA17506@kroah.com>
	<5307790A.4050806@monstr.eu>
	<20140221161246.GM31902@saruman.home>
	<53077C5F.9000407@monstr.eu>
	<54CF9B12.2070807@denx.de>
	<20150202160622.GA9852@kroah.com>
	<54D24BA4.3070509@denx.de>
	<20150205064130.GB22075@kroah.com>
	<20150225214950.GB29527@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150225214950.GB29527@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> So that GPL header at begining of each file becomes one line... and so
> that if it is BSD/GPL dual licensed is plain to see, and I don't have
> to read the notices saying "oh this is gpl.. but if you want to,
> delete gpl above and use license below".

That won't happen though. You'd require every single corporate legal
department of every large company that touched the file to agree that the
SPDX was equivalent to the content, and some of them probably won't.
Lawyers don't seem to believe in #include <legalese.h>

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
