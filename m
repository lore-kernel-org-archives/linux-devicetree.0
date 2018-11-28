Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:6211
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727473AbeK1Rz2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 12:55:28 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2][resend] OF: add for_each_port_of_node()
Date: Wed, 28 Nov 2018 06:54:49 +0000
Message-ID: <87efb51z0c.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
        <87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
        <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
In-Reply-To: <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C50F33CB0B56B43827C495764BAACC2@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


Hi Rob again

> > +       do {
> > +               port =3D of_get_next_child(parent, port);
> > +               if (!port)
> > +                       return NULL;
> > +       } while (of_node_cmp(port->name, "port"));
>=20
> Use of_node_name_eq()

I tried this, but unfortunately it seems of_node_name_eq()
is not good match to this purpose.
Because it try to check with "port@n".

# I noticed that I can cleanup this patch to more simpler.
# I want to send v2 patch if this patch is not rejected
# Please let me know

Best regards
---
Kuninori Morimoto
