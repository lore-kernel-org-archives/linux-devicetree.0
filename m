Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E364C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 13:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03F56206F5
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 13:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VHNaKkqN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbgCaNxn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 09:53:43 -0400
Received: from mail-eopbgr60081.outbound.protection.outlook.com ([40.107.6.81]:59780
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730420AbgCaNxn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 09:53:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvj3jWj21x8tfdWS4XmRHpGGdCCJJqJLpwkuScg7quRIe6hMdMuzHpOn+IKY9ZASdbNQsJhs8+RwrGLabRsvp97+BW8NpWAih59Px3kELdYLSqgspBhmFTcKZvKG1rWZCT2V0N/MD79ADuuxH0hCERCSv0CtR93LszaxDllA5UD6RYWcG+PYHpdAN1WmFhEcfR7urGlrbHec+FNF1NdYpuSQSgtR9Uucb9bEXsoWjESKMJs8S+skJALNAXa9YpbDtxM2LVHoxbJaIvQr2VJEprV7uRzWKaqAed7OJrKioPNvV67Tra/xRl5/XEx7XKrDhEJ2wEI6mwV5o6VG5Z3kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEuexm9TMZwYticN/IDbxupeWAKN/qwROQGa/xNqdxo=;
 b=DHPANy7QEq3C/mQwnsoTLMzE3RtmihWmREnNenYjykkTDDbYH+T7kcRwPaurxWr7qakV5zqyEaMzOq0Qtquzh2X8V5m7M9XqByZ3M8jKOcuQceYx9SwKHqWPLjDFyH5wTKDBCI8l9TqpvASu1Wz/UL1Otqv+tt6PX7sGcs5v37tIL8Bu3Y1ExWkWLoAoqzRlEkHA9mcqusEEJbQF/KvcSwN1b2LiHzL8Ip3yAo6qnCj5+rw66fK5RO6dP3n+9yzSy9od7F7lWRqBaRTDvU92FumAtjM5A7lU/cHUvnUIroy7X+lN6nyRoyOHSdV25+tqwJ+mQTzh3gLCv1IgfDSZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEuexm9TMZwYticN/IDbxupeWAKN/qwROQGa/xNqdxo=;
 b=VHNaKkqN6fRwdORp3mHhZhVMZqFyNyZS/lKeWAYdQJycIzujM98pkvZ0EMp3oCAvzajD5RIa+5Oxu0ypImb2cf2EuqICOxzS9qb2A4MQ++f4IW64SnW4O4wHgszobKIoHVd+JLrSQeP2S1BspclKikwAysx47m2o7M3FGC8hLpw=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4468.eurprd04.prod.outlook.com (52.135.145.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 13:53:40 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 13:53:40 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support
 multiple channels
Thread-Topic: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support
 multiple channels
Thread-Index: AQHWBFX27wlDVoVytE2BgopmDmTwV6hivp2Q
Date:   Tue, 31 Mar 2020 13:53:40 +0000
Message-ID: <AM0PR04MB4481FB36D888882183C4293188C80@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
In-Reply-To: <20200327163654.13389-1-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [180.107.26.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6755d483-cb5c-47ca-4c33-08d7d57aeb2d
x-ms-traffictypediagnostic: AM0PR04MB4468:|AM0PR04MB4468:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB44687F191D8ED1A6EED7513C88C80@AM0PR04MB4468.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(6506007)(81156014)(81166006)(9686003)(33656002)(478600001)(54906003)(66556008)(52536014)(26005)(66476007)(76116006)(7696005)(55016002)(110136005)(44832011)(5660300002)(66946007)(66446008)(64756008)(8936002)(71200400001)(2906002)(86362001)(8676002)(4326008)(316002)(4744005)(186003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gx0QwHjdmCdq9DdUuVeSEAnTyRiCjAeEQ/6JP+FYV/EGwaUrK4NYa5yiEDG13Ey6EjoCo/Ghe0Yf1kXF8wQDT4w6kH4frfp3Qw5WbuL0ZMoC0BZIH2cA2/9o1UsqB+6mKS8JGlDt2n6Yi+vszGwH/IT0BiYzPDXulhgofhWB0t2l8KskteYlCSaXQQ1fZNTQO1HHvE9mgLgEsVyYLjYOC2dC3sy66x1GZeJJakgxwD2qPMYXuzZ7tn6eQMuYb4hvZed1Xm0gTlAnCSOvwjX2iwfdmHal8BP5W4o+6mCSRoHUuVymEkLTxF31PpCAJTdXUhZH5kj983GbDw3y/5MZt1tHFKH/wvHRn9sbntopOK5MiufOd6noY6Jh7hO46sogCBtbdBIuEKS/OOBiy3UAe//old5/Bo2vT+YNz18O0IHGG2dHA8AemntjZqk3OQ6A
x-ms-exchange-antispam-messagedata: cA1OjVYp5hP4uTmuzeHXTeAl8pyIqhUzdyu4alPiyCI7HPggwVe4YCuQp2ZTEu4mXyhN54p4UpvMVo7L4BqJtDPcUmUECyGCyJ8w7rHyef+WhNwgol0hUuJojvoyw1XArUt5jtqEjKJLhojNekhuUA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6755d483-cb5c-47ca-4c33-08d7d57aeb2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 13:53:40.2876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3YZArhZiEl/R8CpVZmGskq4hlzEkp0IrmOD/B6yv+nnaEikYA7PlupWWgm36pxc2ADk58iCeZOsqvtTTVMSAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4468
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support
> multiple channels
>=20
> Hi,
>=20
> While merging SMC/HVC transport to SCMI, I did a quick hack to extend it =
to
> support multiple channels. I may be missing something obvious, if not the
> changes required look simple. Some of them could be merged into original
> patch, but since I am unable to test, I preferred to keep them separate, =
easy
> to revert if things break.

With patchset applied to your scmi tree, my test still work as before.

Tested-by: Peng Fan <peng.fan@nxp.com>

Thanks,
Peng.

>=20
> Regards,
> Sudeep
> --
>=20
> Sudeep Holla (4):
>   firmware: arm_scmi: Make mutex channel specific
>   firmware: arm_scmi: Drop empty stub for smc_mark_txdone
>   firmware: arm_scmi: Check shmem property for channel availablity
>   firmware: arm_scmi: Drop checking for shmem property in parent node
>=20
>  drivers/firmware/arm_scmi/smc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> --
> 2.17.1

