From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: [PATCH 0/3] add dependencies
Date: Tue, 13 May 2014 10:54:00 +0200
Message-ID: <1399971243-18153-1-git-send-email-holler@ahsoftware.de>
References: <537151FF.8070104@ahsoftware.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537151FF.8070104-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Here are the 3 patches for dtc I've posted in the previous series for the
kernel ready made for the DTC repository.

They are identical except the different dtc.c (help format).
I've also changed the topic line from dt: deps: dtc: to just deps:

Please keep in mind that adding dependencies will be enabled by default.
That means .dtb sizes will increase slightly after the first patch is applied.

Regards,

Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
