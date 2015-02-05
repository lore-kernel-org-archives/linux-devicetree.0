From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Thu, 5 Feb 2015 11:49:20 +0000
Message-ID: <20150205114920.554a3874@lxorguk.ukuu.org.uk>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
	<20140220182257.GF23217@saruman.home>
	<5306F458.9010706@monstr.eu>
	<20140221160442.GA17506@kroah.com>
	<5307790A.4050806@monstr.eu>
	<20140221161246.GM31902@saruman.home>
	<53077C5F.9000407@monstr.eu>
	<54CF9B12.2070807@denx.de>
	<20150202160622.GA9852@kroah.com>
	<54D24BA4.3070509@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D24BA4.3070509-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> We really need one tag per file. Of course the resulting license for the 
> Linux kernel is clear. But there are many things to take into account 

You don't even need that. Generate a set of hashes and paths of the kernel
files, put the hashes and the paths and your tags into a database, enjoy.

It doesn't need to be in the kernel, and it probably serves no useful
purpose being there.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
