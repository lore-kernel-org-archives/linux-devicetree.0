From: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Status variable
Date: Fri, 29 Jan 2016 14:13:20 +0530
Message-ID: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I am confused about the "status" variables on a device tree. What is
the meaning of
status="okay", status="enabled", status="disabled".

the function: __of_device_is_available returns 1 if the entry itself
is not there.

Why is this?

Thanks for your time.

Thanks,
ryan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
