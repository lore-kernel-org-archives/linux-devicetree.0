From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: KConfig and DTS files
Date: Wed, 07 May 2014 10:12:29 -0700
Message-ID: <536A697D.3020002@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

I suspect that this has been discussed previously, but I'm a
N00b to DT and Google hasn't helped identify a discussion
on the list.

While getting my feet wet with DTS, I was quite surprised to
see that there's no support for making parts of DTS files
conditional on the kernel configuration.

We often cost-optimize BOMs for our standard boards and omit
bits and pieces not needed for a particular build, and
it would be nice to surround optional components with
conditionals:

     #ifdef CONFIG_BLAH
     #endif

Please advise,


Eric Nelson
Boundary Devices
http://boundarydevices.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
