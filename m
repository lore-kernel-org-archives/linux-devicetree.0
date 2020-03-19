Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37094C4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 06:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBAA82072D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 06:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GB4pSwDJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgCSGqk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 02:46:40 -0400
Received: from mail-eopbgr130089.outbound.protection.outlook.com ([40.107.13.89]:46818
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726982AbgCSGqk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 02:46:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJvVrSeMGaq5ifsxd0oddvjBEmq08HuM29uQS/hylt4SQKBfIlzrdBu2uGZe8/bW2bb3/aTUIbqQcLQ/uadGUJ8QBy8TTTF60lEvIecEDfxTBwVBOZocN0QofXOBnmouq9jBLmejny6c8Bob1IE6P0QMdtWekjvhvOdpuT1azes8kediXdret75uf2Dn3ZL3SKcESP6j2dWC0VmIEQ2wodMTSE6/IQRQszGipZCHdeQ+xHSvrnXpRCKZwfR/H7vN6xkmSl/r3TR7NcMAoe7xAHPOW2k+nmKGUCu04iu7JWXbVTuG1lyZHq/OudIjg9uitUJIoB9T8Cn6fFYb7ElJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENk8I17T8kQCjf1AOXFJ5+0wu8JhuzPV/5upaqlpclI=;
 b=TvrlZad96pQ34S+d3i946M/+SF95sX2JPQgWkoquz477hlB9GJagly/xXZohFcyKy279WfJgNo1GHQMa1IVZ+MOUNSQ8ngULb+V+DNCZAssX6iml4xMappOTNHVpdgEJMNOEyailUNeX5Mfvew1MgI1ZQk0LXn2zSOokfwkXNP5vmxq1xH4vAyYjG1urvyP8nRPooBtV20Eaq4mM6YkhGmyuNn7U5XI1UAz84gOS9kqAZ2EUBtHHnwY7vB5tsrEjRDkP+yz2j+iGEPGVGEhHs59s+8Tsf4tu4CgDIcZg4vKEAv+tcRJWcEo4FI30ZcwYhpEkZchvJewQtra8Xx8WNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENk8I17T8kQCjf1AOXFJ5+0wu8JhuzPV/5upaqlpclI=;
 b=GB4pSwDJFh/+tEZuIGc+/ONVls+Z5YRZ0NiBiUVrFy0hIh6f/JINEYCq+T6N9A0Aq2NaZTWREqVE7WTYiOTDxtDGOC5EdNWzzCpZoxEy8ha/LGpp/+8WTfan4f/lggKXMvdnclMNtlPOvn55aYRKYSRZbaz2hNVfimJd94MHlj4=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB7031.eurprd04.prod.outlook.com (52.135.56.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15; Thu, 19 Mar 2020 06:46:36 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 06:46:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Topic: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Index: AQHV+eSIbYUUoyB07UqkpsijN1q1vahO7pAAgACSAoA=
Date:   Thu, 19 Mar 2020 06:46:36 +0000
Message-ID: <20200319064655.GB11834@b29397-desktop>
References: <20200314093941.2533-1-peter.chen@nxp.com>
 <20200314093941.2533-2-peter.chen@nxp.com> <20200318220420.GA15468@bogus>
In-Reply-To: <20200318220420.GA15468@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 230d31a1-6392-4c98-c7be-08d7cbd1451e
x-ms-traffictypediagnostic: AM7PR04MB7031:|AM7PR04MB7031:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB70319255396C8BD072EB5BDE8BF40@AM7PR04MB7031.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(4326008)(66946007)(8676002)(66556008)(81156014)(66446008)(8936002)(33656002)(64756008)(76116006)(91956017)(6916009)(66476007)(86362001)(81166006)(5660300002)(9686003)(1076003)(71200400001)(316002)(6506007)(54906003)(6512007)(44832011)(53546011)(2906002)(33716001)(186003)(478600001)(6486002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB7031;H:AM7PR04MB7157.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2QUc1nIkxIksB9pqSq4EDu5bEQ9QK9uKP0nZcsRvrAfG8H9mS0VQVQ673EfWIZ6Gkcs71Nx45noaUat+4DNPxLlsMgp5tiMrVEhY7w0XtKnFbof481GR3Iyz8lZAgC8clpStvudRdQ6iHU9MaY9+hMdJ40sESaj7sRBCOLtPBPt719NwAoCkoWoc3IMg5YuCFHloyOSIcbxPkigLHq/bvfpKFDtQ5NWEcCKWbLRI19MTVSGKnek1nhvOERizyhW1hild1brEx3389j4Ih/aDsUfgAOXNzjlx3iBswbmzvNuQPu/Vma8zBxM6gAunA8IN1mpwtSppug36tUclhNgt9UgBvg1XZq3jFglj9MGbGeXi5tqwz0BxmK+W7wDU+0PzdahmYv0MDl+9YsbZo/UsYdbfR8ymuBTFcH+WFdYHI62nGtTHtfDM/ednLaGbfMe
x-ms-exchange-antispam-messagedata: bZDy3jq/ziSArUpX4h6iuKX2rkg++MhZq3wkBKxRT0lBZ2AL4pNl0/GBbCGMtstkLxrBh5RS3C5EEuqZjwHOSUuK8XcVxMS0663hDP8N8amqQw4X8nGv1ipaLorqPq99J9AhTVaP3D9+e2wNJmE9Ng==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E578A2EC88F71140920603AA82CF9573@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230d31a1-6392-4c98-c7be-08d7cbd1451e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 06:46:36.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkAcmgJDU260sjBMC55snKC8keliNSUtbWeP6wJcY2kk9k/nqCfjICR7TaDlM64h4seeL1ZmOxvFn5f6/FQnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7031
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-03-18 16:04:20, Rob Herring wrote:
> On Sat, 14 Mar 2020 17:39:41 +0800, Peter Chen wrote:
> > Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> > and is only used for USB3 and USB2.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v2:
> > - Fix kinds of yaml style issue
> >=20
> >  .../bindings/phy/cdns,salvo-phy.yaml          | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-ph=
y.yaml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/=
cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: 'power-domains' does not=
 match any of the regexes: 'pinctrl-[0-9]+'

The 'power-domains' is described at:
Documentation/devicetree/bindings/power/power_domain.txt

> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/=
cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: #phy-cells:0:0: 1 was ex=
pected
>=20

#phy-cell could be 0 if it is a dedicated PHY, eg single function PHY.
See below comments from drivers/phy/phy-core.c

/**
 * of_phy_simple_xlate() - returns the phy instance from phy provider
 * @dev: the PHY provider device
 * @args: of_phandle_args (not used here)
 *
 * Intended to be used by phy provider for the common case where #phy-cells=
 is
 * 0. For other cases where #phy-cells is greater than '0', the phy provide=
r
 * should provide a custom of_xlate function that reads the *args* and retu=
rns
 * the appropriate phy.
 */

--=20

Thanks,
Peter Chen=
