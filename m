From: "Enrico Weigelt, metux IT consult" <weigelt-d/C+FbuhHiA@public.gmane.org>
Subject: Re: Dealing with optional i2c devices in a devicetree
Date: Mon, 8 Jun 2015 14:11:19 +0200
Message-ID: <55758667.70501@melag.de>
References: <55713BB1.80004@alliedtelesis.co.nz> <55714FFB.3000608@roeck-us.net> <55752FD4.6050700@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55752FD4.6050700-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "jdelvare-l3A5Bk7waGM@public.gmane.org" <jdelvare-l3A5Bk7waGM@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "shardy-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <shardy-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "guillaume.roguez-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org" <guillaume.roguez-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 08.06.2015 um 08:01 schrieb Chris Packham:

Hi folks,

 > Sounds like my best bet is to mark the nodes as disabled in the
 > dts and have my bootloader update them on the way through.

In case your bootloader can take that decision (eg. if the device
is present at boot time, and the bootloader has the proper probing
logic or simply knows the device has to be there), that would be
an pretty easy way.


But let me add another usecase, which might be a bit more tricky:

Let's assume we can plug in some more complex device, which consists
of several (pretty standard) subdevices, behind certain bus'es (maybe
it's attached via USB, and somewhere behind are some I2C bus'es with
regulators, pwm-generators, etc).

Let's further assume, we already got some DTS or some piece of memory
with an DTB subtree for that device (eg. some simple bulk endpoint that
just gives back a bunch of bytes with the DTB).

Now, when the device is plugged in, I'd like to get that piece of DTB
loaded and the corresponding drivers initialized. And, of course, when
it's plugged-out, everything should be shut down cleanly.

How could we achieve that ?


--mtx
--
Enrico Weigelt, metux IT consult
+49-151-27565287
MELAG Medizintechnik oHG Sitz Berlin Registergericht AG Charlottenburg =
HRA 21333 B

Wichtiger Hinweis: Diese Nachricht kann vertrauliche oder nur f=C3=BCr =
einen begrenzten Personenkreis bestimmte Informationen enthalten. Sie i=
st ausschlie=C3=9Flich f=C3=BCr denjenigen bestimmt, an den sie gericht=
et worden ist. Wenn Sie nicht der Adressat dieser E-Mail sind, d=C3=BCr=
fen Sie diese nicht kopieren, weiterleiten, weitergeben oder sie ganz o=
der teilweise in irgendeiner Weise nutzen. Sollten Sie diese E-Mail irr=
t=C3=BCmlich erhalten haben, so benachrichtigen Sie bitte den Absender,=
 indem Sie auf diese Nachricht antworten. Bitte l=C3=B6schen Sie in die=
sem Fall diese Nachricht und alle Anh=C3=A4nge, ohne eine Kopie zu beha=
lten.
Important Notice: This message may contain confidential or privileged i=
nformation. It is intended only for the person it was addressed to. If =
you are not the intended recipient of this email you may not copy, forw=
ard, disclose or otherwise use it or any part of it in any form whatsoe=
ver. If you received this email in error please notify the sender by re=
plying and delete this message and any attachments without retaining a =
copy.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
