Return-Path: <SRS0=pEqb=R7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:1568
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbfC1NEP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Mar 2019 09:04:15 -0400
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon support
Date: Thu, 28 Mar 2019 13:04:06 +0000
Message-ID: <OSBPR01MB2103A7BB0AF6B9B97B30D684B8590@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-3-git-send-email-biju.das@bp.renesas.com>
 <20190327232802.GA28701@bogus>
In-Reply-To: <20190327232802.GA28701@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH 2/9] dt-bindings: usb: renesas_usb3: add extcon suppo=
rt
>=20
> On Wed, Mar 06, 2019 at 09:07:19AM +0000, Biju Das wrote:
> > Add support for renesas_usb3 to receive connect and disconnect
> > notification using extcon framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index d366555..ae35674 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -21,6 +21,8 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - extcon: phandle for the extcon device renesas usb3 uses to detect
> > +	    connect/disconnect events.
>=20
> Please don't use extcon and use usb-connector binding instead.

I have switched to usb role switch framework  instead of extcon and sent V2=
 based on the below feedback.
https://patchwork.kernel.org/patch/10840659/

On V2, I have sent  a patch series which uses " usb-connector " binding [1]=
   and "usb-role-switch" property[2]
[1] https://patchwork.kernel.org/patch/10852495/
[2] https://patchwork.kernel.org/patch/10852497/

Support for  "usb-role-switch" compatible can be  found in the below patch =
set
https://patchwork.kernel.org/project/linux-usb/list/?series=3D97707

Please can you comment, is this approach is acceptable or not?

Regards,
Biju=20
