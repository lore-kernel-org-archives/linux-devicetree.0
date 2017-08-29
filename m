From: John Carter <john.carter-U313QQUz4dygSpxsJD1C4w@public.gmane.org>
Subject: Status of drivers/of/configfs.c
Date: Wed, 30 Aug 2017 10:37:24 +1200
Message-ID: <CAFD1m3FQ6vNF9sUU67g_VE5nKsHWk-MfmHiVqyjpZmoq544AxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In 2014 Pantelis Antoniou sent a patch...
    https://lkml.org/lkml/2014/3/18/625
...creating an interface between the config filesystem and devicetree overlays.

As far as I can see it is used in a couple of "off the mainstream
kernel" like the beaglebone black.

Alas, at this stage it doesn't seem to have made it into the upstream
kernel.....

1) What is the status of this patch? Is it still being maintained? If so where?

2) My interest in it is for an nasty bit of oddball hardware.

I have to change a pin from being an gpio input at boot time to being
a uart output sometime after boot.

Would the of / configfs be the best way of doing that or is there a better way?

Thank you!

-- 
John Carter
Phone : (64)(3) 358 6639
Tait Electronics
PO Box 1645 Christchurch
New Zealand

-- 

------------------------------
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer
------------------------------
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
