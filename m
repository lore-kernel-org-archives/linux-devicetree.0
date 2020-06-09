Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E03C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 05:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F541207ED
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 05:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="T6cv9SX6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgFIFWF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 01:22:05 -0400
Received: from mail-eopbgr10085.outbound.protection.outlook.com ([40.107.1.85]:47620
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725770AbgFIFWF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 9 Jun 2020 01:22:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbez4FR3DVFsI0gNM0dsg7xTxONiS0y1OcqGPeDOAP4ypBANnD0vFkwG9s2I1MLA1kZSSETB9qGjNL/YhniIk+SCtCRL00xW5ZotLyrnN0Y5Vo+1odDFug4Cbne2vCVdQv5IW93UkZlC94cPqST9SXPwApOmsvsfduBoVRL4sqlix9VPRhToCq+nNs1lRRgm9s2G5oxPBA0sz/hQjjuc5JcVKom7tSRTSnQYIVDZpVD9QvcQrRV+2zXbpxPWWgXP6HBs4VxHhp03njqffxXAKgqPUI9t966hxNi8fjiqZPsMoFv5Gr8969vL2UWha5ydvg0HeqcSDa7dRINMV6VB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYrT5NUfWuWW6vgspY+WEOKC1/43sCSfhXuoZQ3vKUg=;
 b=j643AsoZe6lBEaJ91pd6PqxAS7xIKEFo4yT/uuRuIrIqh9RF2ZZcRvyLvWCjBnhPO5urZjTMma27OQkyv5J3I4/Ks3MF86ppdSxIgXpeudHj1qfLZ+mbtENKubmqB9bLtxlteRN8LdfWHmEPcVGYPb2Ku4BE5TyTlX1UJ8VIzVy+ot+Cl3u2CPqs6cb5vRZQtgzWz+y0cCBNr/kCd5PbWn4h4YaJ0/7fCJD3Ha23XfjwLvM0d5qFe8/hxkwytFWx6dgoNjEoR25fDL2O/MRDJxCGnGsHFZPtxiU/gcN7jeGk6YYdk8hPupCnMijmGVOgVRACKocMKMHPvd6ZkJ6/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYrT5NUfWuWW6vgspY+WEOKC1/43sCSfhXuoZQ3vKUg=;
 b=T6cv9SX6+fTbru7k9DNh8bXjkWtjJgBDMBlVjm2BsAcF7z1bl/vTUqPtae0FbfsBo+tODgA43HiD02yS3PTN7gWATocI4EGwalikqOtePJAYx80Ev6LUBKYw6PKEMvtW4q0kcy+Hfhi56ftBOGrvDvzlCkjImvgchXO4sfls8nQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 05:22:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 05:22:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy-imx8mq-usb: add compatible string
 for imx8mp usb phy
Thread-Topic: [PATCH 1/2] dt-bindings: phy-imx8mq-usb: add compatible string
 for imx8mp usb phy
Thread-Index: AQHWPZq0SpIKYKC/gUSS37D+VL4ztqjPwLWA
Date:   Tue, 9 Jun 2020 05:22:01 +0000
Message-ID: <20200609052225.GA14710@b29397-desktop>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0562249a-d89c-40f1-0461-08d80c3509ee
x-ms-traffictypediagnostic: AM7PR04MB6870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB687061DAFC7E5D42596B312F8B820@AM7PR04MB6870.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FWPqR5ome4Lr9G+wTL0Iy24ABoeMtbLOVMZ3w2EcPJyQm6odJ14PI9rZ4LLZmkmyIVD9Qfl6ZEz8aJk7oUj0VkpWn7uEMXg7pa3CTbslprKmW5Uxk6NOCt4i2KfiKe5BdA385YoBlqgCGjpw3IOiT6qjY6BYprgWkzexdiZKoLvAponb6W5WKUa6EbQEYfxtqIrExco5q2PTJveUG/r+3N15pUA0JMxsJaWAPnPDUW95ZNOlaiDe77ENrNKQbzGfZI2nxVcl7EeSaGbuWRsmracrz7tCKkbdsj/J5PuDVbsCXULVV2o9YlnmEtJfC0TuAaCrytLdpBLOQVd9TNioOY/5WHCYaj9FXiMH09cLBw49NlYmthnTh0BIS/gcnNmN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(4744005)(9686003)(5660300002)(44832011)(26005)(8936002)(91956017)(66946007)(64756008)(66476007)(6486002)(53546011)(66556008)(6506007)(86362001)(6512007)(186003)(76116006)(66446008)(8676002)(316002)(54906003)(83380400001)(478600001)(1076003)(4326008)(71200400001)(2906002)(33716001)(6636002)(33656002)(6862004)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8K+daFuAu+Vd4IzIb9FaUbX4RBeKAdD0QSylKxIaPhKFgo/OPqvNVSCob8Lm/rswudPLwmqYWPwkgflN+SQM5PksZiByZAq4RdTqGQGj+H9p1xgAIkuI0e6ccMplciRRYBmanIU5BXJEUZMtsGtoOVhClRQnfYdw8+smSQY2dZbxAoe7j3UeJrzEnM4gm++7cKE71d/6mEJvPEeGMlYecXmyoIm+0xfh+61yf/jKfwRol2PNLhM8AUDB1EZ1j4cGEc3aTOte4skRdutnZxJ865DNpCCmjmAMbV8Nhzw/Bg6sCKjz8U8qaBoA/hU8XbKuM5pGRf79ClAZHaRNop/Mxc5RzRqGH18VbG6HbpdNWAXfM8GgQ5QPYwfCPfgmcvbmQE1Yj4z9SL9rDk3VZemEAI93FRoZBCTjSjpTgArHW5LGxfsxljnvytA46m0t212i8PIkxFejOSthQM2YUUoWP5SvLucZUP+x5p0gSj69/YE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AF186E6118F8A468163984759E5B4BA@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0562249a-d89c-40f1-0461-08d80c3509ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 05:22:01.1084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ibr2rkCsor5181Fww5hkki+hrzYoY8WCm1gF/CNKF/UX62z30ZuMKZJROUA3a6xKg5xtqj/flIHo6gMjEmtg8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-06-08 21:11:32, Li Jun wrote:
> Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
> similar with imx8mq usb phy but with some different customizations.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
>=20

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter

> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt=
 b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
> index ed47e5c..7c70f2a 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
> @@ -1,7 +1,7 @@
>  * Freescale i.MX8MQ USB3 PHY binding
> =20
>  Required properties:
> -- compatible:	Should be "fsl,imx8mq-usb-phy"
> +- compatible:	Should be "fsl,imx8mq-usb-phy" or "fsl,imx8mp-usb-phy"
>  - #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
>  - reg:		The base address and length of the registers
>  - clocks:	phandles to the clocks for each clock listed in clock-names
> --=20
> 2.7.4
>=20

--=20

Thanks,
Peter Chen=
