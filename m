From: Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: cpu of_node links broken
Date: Tue, 4 Apr 2017 23:12:05 -0700
Message-ID: <CAMgXwThQk=3V1HQ8YpoY57mpY0SrdyfAwS5szpsqwkS-r=FPAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In commit 5590f3196b293574a12be58d06d5e1120d8856ec symlinks from
devices to their OF node were added. Unfortunately, the code looks for
them in cpu_dev_init before they exist (of_core_init has not run).
This results in:
[    0.010000] cpu cpu0: Error -2 creating of_node link

I don't know if this code used to work and it got broken, but as of
4.6 it does not work and still does not work in 4.11. Moving
of_core_init() before platform_bus_init() in driver_init()
[drivers/base/init.c] fixes the problem for me.

Is there any downside to reordering these function calls?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
