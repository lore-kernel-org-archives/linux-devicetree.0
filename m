From: Chao Xie <xiechao.mail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: device name in sysfs
Date: Mon, 10 Mar 2014 10:15:12 +0800
Message-ID: <CADApbejNSFCU5nv0uAxZtF4gT-YfWWquy9E2eMfAOUQtVFR7dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

hi
If we use device tree, and depending on dts file to help to create the
devices, the name of the device will be like "ssp.d4282a00". For the
bus, for example, sound, it directory name in sysfs will change from
"sound" to "sound.8" which "8" is the global number.
It brings some difficulties for user.
For example, the device driver may define some interfaces in sysfs,
and user can get or set some information.
We may have the user settings same for mutilple SOCes, for example,
for android, we may define a common interface to control the device,
and this device may be integrated by multiple SOCes.
Without SOCes, ther interfaces and even the application even the
source code of the application are same. Now with device tree, the
interfaces may changes and we can not share one application for all
SOCes.
Does anyone have idea to handle this problem? Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
