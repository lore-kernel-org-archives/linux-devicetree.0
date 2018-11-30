Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:6876
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726161AbeK3ND0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 30 Nov 2018 08:03:26 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2][resend] OF: add for_each_port_of_node()
Date: Fri, 30 Nov 2018 01:55:46 +0000
Message-ID: <871s731gnr.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
        <87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
        <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
        <87in0h24yx.wl-kuninori.morimoto.gx@renesas.com>
        <CAL_JsqJ=44-odEWvefbXn-2Kdx=pPuC8n9REYKEFHaPZZd--XA@mail.gmail.com>
        <877egv1jtc.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877egv1jtc.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E8A358F433C36469F999F311529C995@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


Hi Rob, again

> > > -       for_each_endpoint_of_node(node, endpoint) {
> > > -               if (endpoint =3D=3D ep)
> > > +       for_each_port_of_node(node, p) {
> > > +               if (port =3D=3D p)
> > >                         id =3D i;
> > >                 i++;
> > >         }
> >=20
> > This is fragile because it assumes 0-N port numbering. While that's
> > usually true, it's not guaranteed.
> >=20
> > Just add a of_graph_get_port_id() that reads and returns 'reg' value
> > or 0 if no 'reg'. Or just use of_graph_parse_endpoint().
>=20
> OK, will think about this.
> How about [1/2] patch ? Is it good or not ?

Thank you for your advice.
of_graph_parse_endpoint() was good enough !

Best regards
---
Kuninori Morimoto
