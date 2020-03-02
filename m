Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6471BC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 02:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 225F324697
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 02:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="etVZBWso"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgCBC6v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Mar 2020 21:58:51 -0500
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:9536
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726688AbgCBC6v (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 1 Mar 2020 21:58:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8LvCwW6aD3EMF6lNIY4DX94ojW1Gzi0FoxG75NMeHuDTB788W8Rcr0JtVfQlED0Bxqo7SQFaq5ZMUNVzfGLRrnnWiPEpJWhpvNd+seei3HGPkIUThQQPsfG2nNL39AHvCVnWbVIss/Dt1sD7p1QKBXaoAsssNLg2eS+DvqbbWvpR43oNHSXj1S1NUszPzIAcFRHcWb3CAGpK2er7SqFufi9NJrsVJOmbDBMHoATsdvSfxeLAWCA85PTWeZlaNxXJm09P/Zvf0xcgmJT/8aXKJuTA12TOZ4/ISF+UqdtVLikx0SBAncm3BwFdoZr53Bk1pKiCtdGDPBfMOGht2qwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z0lPYxvMToG9KRfqH7EuMmv7Q2X7gRgzTUcU7bHgD8=;
 b=aKelyea+S55tszNIMvh8D6MwiTAxotSsUSadAcGfcm0mnmUNg1m90krl37j5cQEkdFPuoyOzbN6rtxFIoIGZyC5giZYNc2CZnlIWj+f5gktKPiUQCdl1U4xCCY2qDRV6RRqGOrs2DxlqX3zQXYqvjyZEV97tEuMPzOrH9FyXhO4cPJNP+mlkzvTdZ3p/Mk2S9wH0dCAszDZfi6EUzNuGWvuLeq/2i8+qqizZ0scgsv7jgdfQGeQF/t7SmXYwxNvhSXCyuX7tq/KFb41SHGm0xrztuLyIgtupbrOjXASb4clLFGVrC2c1EquJKps7swyGK64rkHlWdu3iwmK7qA4pYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z0lPYxvMToG9KRfqH7EuMmv7Q2X7gRgzTUcU7bHgD8=;
 b=etVZBWsobUXiEe332pQa7uE3MExGx3xaake8BMdEZEvZ3VOT9CQ7/hXyzyq/9vpIXQ4l6jYDr2f5v4ilrtEjxzpygK3fBooJAX2FHXkv3V6PCMb/7ZD0q2dMabl44pd5LepsQ41cD33xN8MEJkGTlJkaCapsCdnJr4PWk5RyrLQ=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4480.eurprd04.prod.outlook.com (20.177.53.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Mon, 2 Mar 2020 02:58:47 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 02:58:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Topic: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Index: AQHV7TcYWgsnimYnvUK07Zx3ZoCe3agvRosAgAER7SCAAEV4AIAEBKCA
Date:   Mon, 2 Mar 2020 02:58:46 +0000
Message-ID: <20200302025849.GB3834@b29397-desktop>
References: <20200227062754.19131-1-peter.chen@nxp.com>
 <20200227062754.19131-2-peter.chen@nxp.com> <20200227170810.GA2318@bogus>
 <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com>
In-Reply-To: <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 49edfbab-54f0-4a31-8867-08d7be55a080
x-ms-traffictypediagnostic: VI1PR04MB4480:|VI1PR04MB4480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB44809BA235558EAA6F8834E28BE70@VI1PR04MB4480.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(199004)(189003)(66556008)(66476007)(66446008)(64756008)(53546011)(6506007)(6916009)(2906002)(33656002)(478600001)(71200400001)(33716001)(66946007)(54906003)(8936002)(6512007)(9686003)(966005)(44832011)(4326008)(81156014)(81166006)(8676002)(91956017)(76116006)(316002)(26005)(1076003)(86362001)(6486002)(5660300002)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4480;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6omLGwZV42Efq/p61w/DwAru5N0605LzVFCkoD2IxplQnFTllBZCBAa+Ylpo3lm8LrQAVHQFQY9PFTsb8NCldqDWJlsQbdYFaVv/cfR86WSxdF0onxXgxitRAzZsVDrSGj9staM5/o7cSiKCUwpxvQl7IqvZOSQcWu6Qf2YNVffiembD9wnQD2n/dB/A2RB7tX0195bzh+2nF4A6LcLigtosCqZu/Laqh/oUQHUgMCX1Esc4sgYfopn1TseER9yyZiVe9iHenAAco3zwkW3NcfKGv/w1NVW1RCpEBS0i19niv0fHe/UPuT3oXA3JK+H2ZFAEheMVIq1OKf6o+SqTbkFzEMZJtngiPyC2yWwTQdwY60uUR50XbyvN/c4OY/Z4qnaTitP3OsxR6HVJISx3+MVyv5HkgN/Z3Z++PzJDMhlargy6yWbaE03pYRgZwl8XErU6Ti7BH9Fu2FgdSE6qYBgDO0NHNafQ9viC51YGE4LTdwSHdViLtnjDImjf3HROBJyeR7ti+jz3QY9CyqaRw==
x-ms-exchange-antispam-messagedata: GIhyPVF/TrvhWUcdLQn/NjPg+fz32CfEjO8JbdGRMsTo9DNqvY0uK/kEhekFj7TuZSgiQfDF1M9H0FvlYSBwbbeVvX4k38SG3T5hWncSdvOIYNr56gTIqiXTvDgjFa3lSqy5fmMxJAzonES8FAuP2g==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1904CFF5FDA754E9553B63587CB1352@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49edfbab-54f0-4a31-8867-08d7be55a080
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 02:58:46.9210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02Rh9RUQBJdE+u3uluwG9WE66dTZ0BcKxgQtXm0/HN2cmg7cd+kjtlpuUDwIQ4eKrElIAyii78djebTUYs7yGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4480
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-02-28 07:37:14, Rob Herring wrote:
> On Fri, Feb 28, 2020 at 3:29 AM Peter Chen <peter.chen@nxp.com> wrote:
> >
> >
> > > >  .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++=
++++
> > > >  1 file changed, 47 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > warning: no schema found in file:
> > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > > /builds/robherring/linux-dt-
> > > review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: ign=
oring, error
> > > parsing file
> > > Documentation/devicetree/bindings/display/simple-framebuffer.example.=
dts:21.16-
> > > 37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node =
must be
> > > at root node
> > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while sca=
nning a
> > > block scalar
> > >   in "<unicode string>", line 39, column 5 found a tab character wher=
e an indentation
> > > space is expected
> > >   in "<unicode string>", line 41, column 1
> > > Documentation/devicetree/bindings/Makefile:12: recipe for target
> > > 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' fa=
iled
> > > make[1]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.ex=
ample.dts]
> > > Error 1
> > > Makefile:1263: recipe for target 'dt_binding_check' failed
> > > make: *** [dt_binding_check] Error 2
> > >
> > Hi Rob,
> >
> > After changing some format, I still got below errors, would you please =
point to
> > what's wrong with line 40, column 12? Thanks.
>=20
> It is line numbers of the generated .example.dts you need to look at.

There is no cdns,salvo-phy.example.dts file at both source folder or
obj (-O) folder. I use https://github.com/robherring/dt-schema to
create dt-doc-validate. The command I use to verify yaml file:
make O=3D$OUTKNL dt_binding_check, OUTKNL is my kernel obj folder.

I am sorry I get below error:

make[1]: Entering directory '/home/b29397/work/projects/upstream/usb/outout=
/imx_v8'
  CHKDT   Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
/home/b29397/work/projects/upstream/usb/Documentation/devicetree/bindings/p=
hy/cdns,salvo-phy.yaml:  while parsing a block mapping
  in "<unicode string>", line 5, column 1
did not find expected key
  in "<unicode string>", line 42, column 5
/home/b29397/work/projects/upstream/usb/Documentation/devicetree/bindings/M=
akefile:12: recipe for target 'Documentation/devicetree/bindings/phy/cdns,s=
alvo-phy.example.dts' failed
make[2]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.=
dts] Error 1
/home/b29397/work/projects/upstream/usb/Makefile:1262: recipe for target 'd=
t_binding_check' failed
make[1]: *** [dt_binding_check] Error 2
make[1]: Leaving directory '/home/b29397/work/projects/upstream/usb/outout/=
imx_v8'
Makefile:179: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

  1 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
  2 # Copyright (c) 2020 NXP
  3 %YAML 1.2
  4 ---
  5 $id: "http://devicetree.org/schemas/phy/cdns,salvo-phy.yaml#"
  6 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
  7=20
  8 title: Cadence SALVO PHY
  9=20
 10 maintainers:
 11   - Peter Chen <peter.chen@nxp.com>
 12=20
 13 properties:
 14   compatible:
 15     enum:
 16       - nxp,salvo-phy
 17=20
 18   reg:
 19     maxItems: 1
 20=20
 21   clocks:
 22     maxItems: 1
 23=20
 24   clock-names:
 25     items:
 26       - const: salvo_phy_clk
 27=20
 28   "#phy-cells":
 29     const: 1
 30=20
 31 required:
 32   - compatible
 33   - reg
 34   - "#phy-cells"
 35=20
 36 additionalProperties: false
 37=20
 38 examples:
 39     -|
 40     #include <dt-bindings/firmware/imx/rsrc.h>
 41=20
 42     usb3phy: usb3-phy@5B160000 {
 43         compatible =3D "nxp,salvo-phy";
 44         reg =3D <0x5B160000 0x40000>;
 45         clocks =3D <&usb3_lpcg 4>;
 46         clock-names =3D "salvo_phy_clk";
 47         power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
 48         #phy-cells =3D <0>;
 49     };


--=20

Thanks,
Peter Chen=
