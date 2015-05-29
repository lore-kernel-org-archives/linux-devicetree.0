From: "Enrico Weigelt, metux IT consult" <weigelt-d/C+FbuhHiA@public.gmane.org>
Subject: dts entries for unsupported devices vs. mainline kernel
Date: Fri, 29 May 2015 10:41:57 +0200
Message-ID: <55682655.4060306@melag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi folks,


I've got an patch for adding the amd z160/z430 (old adreno, built in
mx53) gpus to dts, which isn't supported by mainline kernel, and likely
won't be anytime soon. The only available driver is the proprietary one
by fsl (along with a bunch of pretty ugly and insecure patches).

That raises an interesting question for me: should such patches ever go
into mainline ?

con: there's no (mainline-suitable) driver for that, and nothing in
      sight - therefore the entry would be pretty useless for mainline
      users (those using the proprietary one would have their own
      patchset anyways)

pro: dts should describe the hardware - as precisely as feasible - so
      any (dt-capable) os/kernel can configure its drivers from there
      (one could even argue, that the linux kernel tree isn't the right
      place for maintaining the dts'es)


What's your opinion ? Is there some policy for that ?


thx
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
