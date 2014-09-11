From: PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Proposal: generic property for system-power-controller
Date: Thu, 11 Sep 2014 16:21:36 +0200
Message-ID: <CABgxDoLAuO1w1jJnnUuiJqsfxz5wx_1zgc+A4Dqrh=+gLwRLWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I had a discussion with Heiko on IRC few days ago about adding
shutdown support in act8865 pmic for Rockchip SoCs. While browsing on
LXR in order to understand how other pmic handles this support I found
that most of the time there is a custom property of the following form
"vendor,system-power-controller". If the devicetree node contains this
property then the corresponding device driver registers a power off
handler. In my opinion, It would be nice to propose a generic and
standard property for that purpose (it would avoid to have to define
his own property each time we implement the support).

I found that there is a property called "wakeup-source" to mark a
device as wakable. See
Documentation/devicetree/bindings/mfd/{stmpe.txt,cros-ec.txt} .We
could have a property like this one for power down. I mean, this is
the same thing except that it's a power off event (and not wakeup).

What do you think ?

Regards,
Romain
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
