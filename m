Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0CAC43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D8EC20786
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kL5Dmv0w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731570AbgDABPO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 21:15:14 -0400
Received: from mail-eopbgr70082.outbound.protection.outlook.com ([40.107.7.82]:32112
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731470AbgDABPO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 21:15:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPNFal+76+7vh0SPA038TdGhsKS0Yc/GiHxmW8xr2wz5VDmLqSoiXJApdymCGC2TGQFAm/JyBd+HbNcLUrT5cD9DIZ8v+fm7fd1l6AHGFu7YftOzp6sEKoFSLe95IVAFkZqyHZ4qjs8AE7whtdpBOjOTAM8wq0deFKaB52NgZf8AKk2AVp9RNaWITC1J7MTSamxAZjxYtfpAlthHvzF4SNtp1VfNxUzQ3CVku7Ommi/C7tKEoUM24Ro+RP/MJjliXgLlplAV0w622xmEjyXdQ9FIemx1eT2cEyXFBBlDG3yIlihwdvlr/DlkvBkzFjSJdYsuzRxhTDD5qcQM7dVKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSIiQj8ma+Hi/hn+u8V54JnwYLhV+RiI1bj+gUUteuU=;
 b=PHn9dqiYxf7JPvgo5YETmzs1POOF/OKskvseebT4IF/MhM3Vofa9V7P4uZPe1TjTlpedB15srEwmeLz7dk874s7fg51UgqoK73ybjtqae85CHvwU05gTq39X4pZdBx1i5ogcMLAAvcfMwdXgUlk1eUzXYTgK6gzAZu9sAsxUTyb7l92g81qmmMQY7za6eQNcE8Vs7jMT+LhB3U0lo0zLLSCxKBQzJqyUdhfC6WuUhtpEoKbm8o7oS+8m+D5AGkOfPopKOmwITBf1C47dRv384q0JHLa+dE+D8+rdIOl7F1TjNDwlBKhQnr9PBm8h5sz4+pKDFCwjZ6/wQuWzIeqrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSIiQj8ma+Hi/hn+u8V54JnwYLhV+RiI1bj+gUUteuU=;
 b=kL5Dmv0wHO11SprLbGo00v/pebdNxhi+HYixj6OgzXQDvI0xEW2ea4ZkrocNfnWZql3R0+KhKHzjCB73t8MD6XFfCvJb07+2eP4OWiZ3cVzjgjpnZ14mGjfbrLMNQ6WrXwIh1VGGaQYQzEz1fMzSkYH/IBtViq5pw0+HriSPc0s=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5041.eurprd04.prod.outlook.com (20.176.214.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 01:15:08 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 01:15:08 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel
 availablity
Thread-Topic: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel
 availablity
Thread-Index: AQHWBFX349uurCtgD0iyveXnNMUeUKhjfOyQ
Date:   Wed, 1 Apr 2020 01:15:08 +0000
Message-ID: <AM0PR04MB44819AF3A77BF5362EE95D6388C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-4-sudeep.holla@arm.com>
In-Reply-To: <20200327163654.13389-4-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1f57596-5cd4-4520-a40f-08d7d5da1e83
x-ms-traffictypediagnostic: AM0PR04MB5041:|AM0PR04MB5041:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5041D05F5163ED0DE0C95F7D88C90@AM0PR04MB5041.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(86362001)(52536014)(81166006)(81156014)(64756008)(66446008)(316002)(66476007)(4326008)(54906003)(66946007)(110136005)(66556008)(9686003)(8676002)(8936002)(7696005)(26005)(5660300002)(44832011)(2906002)(186003)(55016002)(478600001)(33656002)(71200400001)(76116006)(4744005)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMEuOR0FsyPesPXYgFH5NmoFG8ODY0VX7rNrbUr8UfYQU5dgt7hVfxICPx+nRfvoW+SZFwTJp8pqyttmGkyc2hQvCG2Ob+1QJq0XT/sWtcsD69mihias1tx5z6YsTDBXV9aNwDtJFSdW+PnGPqMkBjyKBMMp2mtslCC8w+M/bjm7XXuJWd7D1RsS/CPQ+yVd4SIkM1v3HsISW43Xg52QjKT7n7dogzfuW9clBeTR5oovS+p3Hzvl/AgyfKzv3mlSq9j9BAH/4iBntp6Iuhcu+3xwktM/+cliqjV1gzUV+HulY2taN7YjLHhl/S2wx6x2l/M44SHOOfmtGqKBLniNepkM7HqgsCvvz1rjeR7jLE0J/o5fOGp/lPPOXgPsQNCMsSdp7rlIviH4Y+L2uPlzVugsdWHX1KYTHUHfnvdXJgXLcDQssErq1LCcu4Yn8P+9
x-ms-exchange-antispam-messagedata: mhpLNnnxxmo0iCeQWZ6ek8MwrvUniI3kqfJx+6MJ2iM/uUUFfup4LnCA0w68PPlXEVs3GomQj1HuMF0ZT7FivCWASBjY/T9ebMbgQFZG1hGBwFbETAelEeRIlgdFVxWlzPQiTTYcd08qRj9fW72BnA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f57596-5cd4-4520-a40f-08d7d5da1e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 01:15:08.6915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+RE3FXLa2+qnyQhU2S85NydL/lYog53SjYM9hX1dVLrbI9xD+8Aan62pHlYM71QeOTmAmTinxrF5l4o9GT+8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5041
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel
> availablity
>=20
> Instead of declaring the channel availabilty unconditionally, let us chec=
k for
> the presence of "shmem" property and return the channel availablity
> accordingly.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/smc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/firmware/arm_scmi/smc.c
> b/drivers/firmware/arm_scmi/smc.c index dd4b54c29679..5929c668dc1d
> 100644
> --- a/drivers/firmware/arm_scmi/smc.c
> +++ b/drivers/firmware/arm_scmi/smc.c
> @@ -33,6 +33,11 @@ struct scmi_smc {
>=20
>  static bool smc_chan_available(struct device *dev, int idx)  {
> +	struct device_node *np =3D of_parse_phandle(dev->of_node, "shmem", 0);
> +	if (!np)
> +		return false;
> +
> +	of_node_put(np);
>  	return true;
>  }

This is global shared mem:)

Reviewed-by: Peng Fan <peng.fan@nxp.com>

>=20
> --
> 2.17.1

