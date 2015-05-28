From: "Enrico Weigelt, metux IT consult" <weigelt@melag.de>
Subject: Re: Device Tree Blob (DTB) licence
Date: Thu, 28 May 2015 14:31:02 +0200
Message-ID: <55670A86.2060502@melag.de>
References: <1430820315.19516.26.camel@opteya.com> <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com> <1432289148.5304.58.camel@opteya.com> <CAL_JsqKLmePHHe+4n4xwiFhjo+wZ+V774i3eY9Z07+61SDHyYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKLmePHHe+4n4xwiFhjo+wZ+V774i3eY9Z07+61SDHyYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Yann Droneaud <ydroneaud@opteya.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, licensing@fsf.org
List-Id: devicetree@vger.kernel.org

Am 22.05.2015 um 18:26 schrieb Rob Herring:

Hi,

 > Ideally, dtb files are shipped with firmware separately from the OS.
 > You should be able to run multiple OS's with that dtb. There is ofte=
n
> desire or "requirements" to not have GPL code in firmware.

I dont see that begin shipped *with* the firmware (but still as a
separate object/file) automatically means a derived work.

And I actually wouldn't want dtb strictly so interewoven with the
firmware/bootloader, that it can be easily extracted or replaced
anymore. IMHO, we shouldn't support such vendors.
(freedom is more than just $0 price)

And there shouldn't be any proprietary firmware anyways.

cu
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
