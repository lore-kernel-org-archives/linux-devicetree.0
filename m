Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469B5C3F2CF
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 09:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AEB324695
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 09:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fAnjWe3V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgB1J3l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 04:29:41 -0500
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com ([40.107.21.67]:23393
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726490AbgB1J3l (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Feb 2020 04:29:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5fCujb/P4lsfqiuMf8Emk8OcKq9cX23AwivbAsmiipPL1LvUEBzFndwCHFPSDcLSPwvX5ke/NPkl+PJub/0KWa2jGjWyHSNir3zi9Yo0AfmAyKlj50yHgYOaZtSebrOUPxQeSq0FSNyScq4zBcbt7iuSsCiJNiq1TqOPk/IbIwd8Ak8MynjTPWYq1em3o4O9NVKoLR+XbHbXzFZKiihYNbBFxkP3xIcLeRbgQPRmLOAYiM0bvp41qXnBQEL47lY259ECswpVdyzXkHObhjEPmFhULoJwj1xz2PUk80viUIKaoQd6y2jG2Dwvnn4jrBXiDukD7Qoe4sra7199Gn04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/ZS6HYc9dPci1LW/QecOhlynDdsO3psOg0zqECWWyo=;
 b=P4mdq9D85CJgZF4PINv5kBab1K+sDrz+X12L4GNJYVDzEmgXljUzHb7seVSO3qKAH89QRLmizntTnprCoUjkd0kFmaRprdWXhBr99ia3BnfWkjpSMxcsjBB8zLl/J9dxhOJV0utUkSxttY4eldA5SDlqXlmNjYtft0JzBBY+OSa1v6E/e9UYPmW1JDfgrZwJYnxGYjxVuXW5qtHtMy10pyY8ZnDtrMfjCttrzz+S17LwNUDnXSxH7Ln5aavd6tT4kpSGHaQgJ1xyZ9/8TOGj6ENqJPYeU3UQ/s8pd3UsMdtKO306PoqS4DLTkVhPlW2OatZlapwEGGCbLzcxwzLiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/ZS6HYc9dPci1LW/QecOhlynDdsO3psOg0zqECWWyo=;
 b=fAnjWe3V0plA0M1eA2cqsJIQ4OtJcdt1aRcVDGGhEzwpQTkmaZhpcOII52bChHYOAVtg5CtkSXeylAftZE2bbVRD5P1l0inXdSexHyidEpCHXkFanJd+CZHomAiPFS43+w1qBEh20kMvLTd8d3fFQKOqqwCxjvDtkcXKkdwxinA=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3246.eurprd04.prod.outlook.com (10.170.229.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Fri, 28 Feb 2020 09:29:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Fri, 28 Feb 2020
 09:29:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Topic: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Index: AQHV7TcYWgsnimYnvUK07Zx3ZoCe3agvRosAgAER7SA=
Date:   Fri, 28 Feb 2020 09:29:32 +0000
Message-ID: <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200227062754.19131-1-peter.chen@nxp.com>
 <20200227062754.19131-2-peter.chen@nxp.com> <20200227170810.GA2318@bogus>
In-Reply-To: <20200227170810.GA2318@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [222.65.251.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3524706a-9927-4a74-b978-08d7bc30b832
x-ms-traffictypediagnostic: VI1PR04MB3246:|VI1PR04MB3246:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB324621C72CE1C376A638AFB68BE80@VI1PR04MB3246.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(478600001)(6916009)(81156014)(316002)(4326008)(7696005)(81166006)(54906003)(71200400001)(8676002)(55016002)(8936002)(44832011)(86362001)(2906002)(26005)(52536014)(186003)(5660300002)(33656002)(66446008)(9686003)(64756008)(66476007)(66946007)(76116006)(66556008)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3246;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZYIfTfWHDVkXa0/z6Gund1IFLdyX8/x8eHHtCVWKgQU7VoqZiSOaSGoOUuk8O2MPJ9N6xOLlFDoLRsTdMwF7uuHXT3+vq6QGpPjzxeurTsWBFghz23zd6Soiomjvu0HPpgoubFn/NdLMxkVFeOq4CvwL9g8M1YH/3/N+H01Of8oIqwO/5sDvaZ+/uXipNL3CJ2X0wFajy8xMCZph181xLZLvJ/htoOAu+4wpxhM5S9RKn86HEcMnYl1iGzi2MwgslsX4bPG14OlcO1f5s1xlczCrFF8WloO7ftVl/B/2xEi609tA8uWrSyG+2/o43WLPEn+QzBluorwzI/U3j8tgpgsAekXIg1qM9Jt+ZUBqYnOaVS1QvVp88rWV8MWlZZ/4ikujVQMtg5uM42JZoS6wvdNhAVXyRRi4qj3/hYPYKNJC9K1DzJivbpTzibjLgek1
x-ms-exchange-antispam-messagedata: nD8eQaHimbBcSrgbvWSTQldHXumav1lHOEFeejs3PUgKuYX1gPHQ42jvszPJDkmPXSHI36ZyOyvJUZCP5oFWPq1aTfDa1PNMLP6t5aTPuBzxhefRjsl2UdkM38PanLZUXsGOS4fuIlx2Ly3y8YrbiQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3524706a-9927-4a74-b978-08d7bc30b832
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 09:29:32.9839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGpN5P9ebLiXH6gSdqftB6k7OC6UDDpyJbrcO8+viNAsGKLNguGtxi6kzsb7/meUyoENclwsYs+A4KhGVHnuLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3246
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=20
> >  .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> warning: no schema found in file:
> Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: ignorin=
g, error
> parsing file
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:=
21.16-
> 37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must=
 be
> at root node
> Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while scannin=
g a
> block scalar
>   in "<unicode string>", line 39, column 5 found a tab character where an=
 indentation
> space is expected
>   in "<unicode string>", line 41, column 1
> Documentation/devicetree/bindings/Makefile:12: recipe for target
> 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.exampl=
e.dts]
> Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>=20
Hi Rob,

After changing some format, I still got below errors, would you please poin=
t to
what's wrong with line 40, column 12? Thanks.

=A031 required:
=A032 =A0 - compatible
=A033 =A0 - reg
=A034 =A0 - "#phy-cells"
=A035
=A036 additionalProperties: false
=A037
=A038 examples:
=A039 =A0 =A0 -|
=A040 =A0 =A0 usb3phy: usb3-phy {
=A041 =A0 =A0 =A0 =A0 compatible =3D "nxp,salvo-phy";
=A042 =A0 =A0 =A0 =A0 reg =3D <0x5B160000 0x40000>;
=A043 =A0 =A0 =A0 =A0 clocks =3D <&usb3_lpcg 4>;
=A044 =A0 =A0 =A0 =A0 clock-names =3D "salvo_phy_clk";
=A045 =A0 =A0 =A0 =A0 power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
=A046 =A0 =A0 =A0 =A0 #phy-cells =3D <0>;
=A047 =A0 =A0 };


make[1]: Entering directory '/home/b29397/work/projects/upstream/usb/outout=
/imx_v8'
=A0 CHKDT =A0 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
/home/b29397/work/projects/upstream/usb/Documentation/devicetree/bindings/p=
hy/cdns,salvo-phy.yaml: =A0mapping values are not allowed in this context
=A0 in "<unicode string>", line 40, column 12
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

Peter
