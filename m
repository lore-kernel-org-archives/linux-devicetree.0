Return-Path: <SRS0=8793=I5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.161.176]:45596 "EHLO
        mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932949AbeFKMd5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Jun 2018 08:33:57 -0400
Received: by mail-yw0-f176.google.com with SMTP id v190-v6so6235259ywa.12
        for <devicetree@vger.kernel.org>; Mon, 11 Jun 2018 05:33:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org>
References: <20180531104710.23965-1-mgautam@codeaurora.org>
 <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org> <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com>
 <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org>
From: Julien Massot <jmassot@softbankrobotics.com>
Date: Mon, 11 Jun 2018 14:33:55 +0200
Message-ID: <CADGp=QdjwY=9C26NtehXLk5V=k7f1fqorzQcx98Gtc4jK0hc+A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

Hi Vivek,

> I have a branch that's based on 4.17. You can pick that.
> https://github.com/vivekgautam1/linux/commits/v4.17/db820c
>

Thanks a lot,
I will test this branch.

Julien

--=20


*This email and any attachment thereto are confidential and intended=20
solely for the use of the individual or entity to whom they are addressed.

If you are not the intended recipient, please be advised that disclosing,=
=20
copying, distributing or taking any action in reliance on the contents of=
=20
this email is strictly prohibited. In such case, please immediately advise=
=20
the sender, and delete all copies and attachment from your system.
This=20
email shall not be construed and is not tantamount to an offer, an=20
acceptance of offer, or an agreement by SoftBank Robotics Europe on any=20
discussion or contractual document whatsoever. No employee or agent is=20
authorized to represent or bind SoftBank Robotics Europe to third parties=
=20
by email, or act on behalf of SoftBank Robotics Europe by email, without=20
express written confirmation by SoftBank Robotics Europe=E2=80=99 duly auth=
orized=20
representatives.
*



*Ce message =C3=A9lectronique et =C3=A9ventuelles pi=C3=A8ces=20
jointes sont confidentiels, et exclusivement destin=C3=A9s =C3=A0 la person=
ne ou=20
l'entit=C3=A9 =C3=A0 qui ils sont adress=C3=A9s.
Si vous n'=C3=AAtes pas le destinataire vis=C3=A9,=20
vous =C3=AAtes pri=C3=A9 de ne pas divulguer, copier, distribuer ou prendre=
 toute=20
d=C3=A9cision sur la foi de ce message =C3=A9lectronique. Merci d'en aviser=
=20
imm=C3=A9diatement l'exp=C3=A9diteur et de supprimer toutes les copies et =
=C3=A9ventuelles=20
pi=C3=A8ces jointes de votre syst=C3=A8me.
Ce message =C3=A9lectronique n'=C3=A9quivaut pas =C3=A0=20
une offre, =C3=A0 une acceptation d=E2=80=99offre, ou =C3=A0 un accord de S=
oftBank Robotics=20
Europe sur toute discussion ou document contractuel quel qu=E2=80=99il soit=
, et ne=20
peut =C3=AAtre interpr=C3=A9t=C3=A9 comme tel. Aucun employ=C3=A9 ou agent =
de SoftBank Robotics=20
Europe n'est autoris=C3=A9 =C3=A0 repr=C3=A9senter ou =C3=A0 engager la soc=
i=C3=A9t=C3=A9 par email, ou =C3=A0=20
agir au nom et pour le compte de la soci=C3=A9t=C3=A9 par email, sans qu=E2=
=80=99une=20
confirmation =C3=A9crite soit donn=C3=A9e par le repr=C3=A9sentant l=C3=A9g=
al de SoftBank=20
Robotics Europe ou par toute autre personne ayant re=C3=A7u d=C3=A9l=C3=A9g=
ation de=20
pouvoir appropri=C3=A9e.
*

**
