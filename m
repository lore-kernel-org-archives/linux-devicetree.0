From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Usage of for_each_child_of_node()
Date: Sat, 12 Oct 2013 13:54:16 -0700
Message-ID: <5259B6F8.3070701@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

for_each_child_of_node() and similar functions increase the refcount
on each returned node and expect the caller to release the node by
calling of_node_put() when done.

Looking through the kernel code, it appears this is hardly ever done,
if at all. Some code even calls of_node_get() on returned nodes again.

I guess this doesn't matter in cases where devicetree is a static entity.
However, this is not (or no longer) the case with devicetree overlays,
or more generically in cases where devicetree nodes are added and
removed dynamically.

Fundamental question: Would patches to fix this problem be accepted upstream ?

Or, of course, stepping a bit back: Am I missing something essential ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
