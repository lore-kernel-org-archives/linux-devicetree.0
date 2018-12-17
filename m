Return-Path: <SRS0=oElv=O2=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
References: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com> <20181205061221.GA21626@localhost.localdomain>
In-Reply-To: <20181205061221.GA21626@localhost.localdomain>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 17 Dec 2018 21:58:02 +0900
Message-ID: <CAH1o70+BgK62TZPRd9zdwyF58MSyewm_qOmFYcZFN0_Ui4NFuQ@mail.gmail.com>
Subject: Re: [PATCH/RFT 0/2] thermal: add suport for R8A77990
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux PM list <linux-pm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Eduardo,

I am sorry for my late replay.

2018=E5=B9=B412=E6=9C=885=E6=97=A5(=E6=B0=B4) 15:12 Eduardo Valentin <edube=
zval@gmail.com>:
>
> Hello Yoshihiro,
>
> On Mon, Oct 15, 2018 at 11:11:57PM +0900, Yoshihiro Kaneko wrote:
> > This series adds thermal support for R-Car E3 (R8A77990).
> >
> > This series is based on the next branch of Eduardo Valentin's linux-soc=
-thermal
> > tree.
>
> Sorry for the late response, but would you be able to refresh your
> series to latest linus master branch?

Yes, I will do it.

Best regards,
Kaneko

>
> >
> > Yoshihiro Kaneko (2):
> >   dt-bindings: thermal: rcar-thermal: add R8A77990 support
> >   thermal: rcar_thermal: add R8A77990 support
> >
> >  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
> >  drivers/thermal/rcar_thermal.c                             | 4 ++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > --
> > 1.9.1
> >
