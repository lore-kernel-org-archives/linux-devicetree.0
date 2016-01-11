From: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
Subject: [RESEND][PATCHv2 0/3] Devicetree bindings for Ion
Date: Mon, 11 Jan 2016 13:39:21 -0800
Message-ID: <1452548364-9522-1-git-send-email-laura@labbott.name>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Gall <tom.gall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Feng Tang <feng.tang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

There was some recent discussion
(http://thread.gmane.org/gmane.linux.ports.arm.kernel/468051/)
about Ion DT bindings and a request that I resend my proposal for common DT
bindings. This is a straight resend, no bux fixed that were pointed out.
Previous thread: http://article.gmane.org/gmane.linux.drivers.driver-project.devel/80475

>From before:

This is another attempt at devicetree bindings for Ion. The big complaint from
v1 was that too much unnecessary data was being pushed into devicetree.
v2 takes a different approach of using just compatbile strings for the heaps.
This gets closer to the devicetree philosophy of describing just the hardware.
Each heap ultimately represents some kind of memory that exists in the system.
The compatible string indicates the match for how to handle the type of memory
on this system. The details like heap-id, name etc. are now pushed out to C
files. This makes Ion heaps look closer to something like a quirks framework.
(I'd argue this isn't a complete mischaracterization given the type of setup
Ion gets used for...) The one downside here is that this leads to more new
bindings for each board that gets added.

This version also includes a sample C file which shows what the structure
might look like. As always, your comments and reviews are appreciated.


Thanks,
Laura

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
