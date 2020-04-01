Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4440C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EE5F20719
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UNAwPc+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731509AbgDABMk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 21:12:40 -0400
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:25650
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731470AbgDABMk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 21:12:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpavwc1R/b2+3B7lb8ig2iCv5iSE4f1NSDKQgrLONpWTnbe+2FJU2qs9H6PerBWAFgHMz0QQ85LCb/idVaYAxDrz12FX46WCBKTe5OeAZyFZGDZNWEBxadFC4NWJhe+dnS54tN38Nme788zctPU0rXFQ/8YzcaXlY2ekYQnbKTcQCc89RH7QKYCoGiuSoWoxJsUcm5wfUa3IFoo12mjU6zyUI1r9mJPWcKY166RSwumTeheI5EAAtkLX7dbq1D2V2benQi4g9G636EV32U4iy9jvdWtlXi5T1pu+hhdf8FHZYsdOPwWuWjKKbAEQtLp0VNxmY1KbA3FuVo0OUhJ9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9vA2uh24i0zwuZqHhKT9b1LHe0KC6f6ABSJGKPU3j4=;
 b=M+GuyqIMtS/A3ETtsVCJlxyyvtsdjYXpp7r+ztHtU/9VV1Xp+dcgIyYy35Rpjgq7LB36xMWFAqo1wIeQV8S8h8ETX3jeQ5UgkLBpHFS18wuz4znsV5fksDU0kd1q6cneQaumrjVgf5lERPe+tIyAYYuk0O44nJa37fu1mKSP5mKW669beIImx5czANGXDKVaZVSzraW8EbdofrqqxGv3/fqAMnrGmfkhlEZJNL4+zyb37PXMbqhU8On4XPMfXx7/sskvbjMdeuTocKQWfy/nS3nDlV9kBih4rhPchbvpo0tDdhBwBrayBwyA7TXD49EJazFsvI5/wGTTyM8Gf0NpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9vA2uh24i0zwuZqHhKT9b1LHe0KC6f6ABSJGKPU3j4=;
 b=UNAwPc+wvZu2t24c4hkCwmRe4qfBoKcMVb7zGnc7KoVJSPhyy3zui07WdMB8XiZsvk/gwH+Prz6n4lqLpv6tdHKHf7nQ6NAmM5va/q6wpLpmFwuDqqDNavvGgih6nwZnd91rYu5JN8FKMkpIk2lrgb9JdPCRCoFRTb5KNeE15WQ=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5363.eurprd04.prod.outlook.com (20.178.114.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 01:12:37 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 01:12:37 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Index: AQHWBFX27nJMU2DyaUm7ucC0dRZvA6hje9AQ
Date:   Wed, 1 Apr 2020 01:12:37 +0000
Message-ID: <AM0PR04MB4481562E2A31386752F92C4488C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-2-sudeep.holla@arm.com>
In-Reply-To: <20200327163654.13389-2-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 689cf461-4d5a-4ef8-6ec9-08d7d5d9c43b
x-ms-traffictypediagnostic: AM0PR04MB5363:|AM0PR04MB5363:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5363CAA0925C47F6F8DE4EA988C90@AM0PR04MB5363.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(66556008)(55016002)(66476007)(66946007)(81156014)(8936002)(86362001)(4326008)(76116006)(7696005)(81166006)(66446008)(64756008)(9686003)(478600001)(8676002)(6506007)(33656002)(54906003)(316002)(2906002)(186003)(52536014)(26005)(71200400001)(5660300002)(110136005)(44832011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xS5eu5cv3eUzrSiZh44f8kCjfa+fQtmCBkcb/E7cUzq99VR6/xs0E5UxXK0lQWrkp2Tp+5hxOa8Czlt4BLSzxM7hW6+ZsyTcFk4TEWYoyZyrSnel9dSc0ZI5Fag2mcvs1ukmJyZd+1ECMgCkIvC/++nA24ltU5ySzezZnff+YTH9Z6WraZr38nxo+Uodgf9vxb2i21w8/LV40DGMGa51nSFueTXQtjmgUSe0i7hfrFgFf3On7gkeCimPmCjZU8ECjCIfpeBlImRGCFOMp6zwaWpJ+zYUWf6aF07yFNtLu9F2PNNgA/PynjzbeTZTCsmERpoMhgUJ6Ho84EME57yr3RpaOPiqmiKgw2vNhj8s2MholuZlvmgIN0JdQdbFec0YE5Bs5fjVH14gwZztjuqjQQEtz5jk01ldgqmzcqvN6unie/YxkNlOqiK5ZchKocX
x-ms-exchange-antispam-messagedata: QoTexNhzkvZ5tq6cAX51Na7eZnPDcD3eIItK0VkluMvzE6gsN+Kv29q+8Jj0v4FGyx054mEddLw6qE6wE7rjdCAVzxbfz6ZjhQuoHFPueRZnJX4F8CfIt86zaKyaWjmfsB2y4NekU5QmltHW51SqJg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689cf461-4d5a-4ef8-6ec9-08d7d5d9c43b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 01:12:37.2313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJRDfPnyJppKBmJGs2t0GgFyQMWXdtf5wX2trprjP9xTbz5ONvvyXS/24wFmE+XZTEEUFMnAqP9NDF+yKfYWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5363
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sudeep,

> Subject: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
>=20
> In order to support multiple SMC/HVC transport channels with associated
> shared memory,=20

Does this mean each channel will have its own shared memory? Or
All channels share the same shared memory?

it is better to maintain the mutex per channel instead of
> existing global one.

If all channels shared the same memory, use per channel mutex lock
will not be able to prevent other channels accessing shared memory
at the same time. =20

Thanks,
Peng.
>=20
> Move the smc_mutex into the scmi_smc structure and also rename it to
> shmem_lock which is more appropriate for it's use.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/firmware/arm_scmi/smc.c
> b/drivers/firmware/arm_scmi/smc.c index 336168e40f49..6dc8a88cc91b
> 100644
> --- a/drivers/firmware/arm_scmi/smc.c
> +++ b/drivers/firmware/arm_scmi/smc.c
> @@ -27,11 +27,10 @@
>  struct scmi_smc {
>  	struct scmi_chan_info *cinfo;
>  	struct scmi_shared_mem __iomem *shmem;
> +	struct mutex shmem_lock;
>  	u32 func_id;
>  };
>=20
> -static DEFINE_MUTEX(smc_mutex);
> -
>  static bool smc_chan_available(struct device *dev, int idx)  {
>  	return true;
> @@ -78,6 +77,7 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo,
> struct device *dev,
>=20
>  	scmi_info->func_id =3D func_id;
>  	scmi_info->cinfo =3D cinfo;
> +	mutex_init(&scmi_info->shmem_lock);
>  	cinfo->transport_info =3D scmi_info;
>=20
>  	return 0;
> @@ -102,14 +102,14 @@ static int smc_send_message(struct
> scmi_chan_info *cinfo,
>  	struct scmi_smc *scmi_info =3D cinfo->transport_info;
>  	struct arm_smccc_res res;
>=20
> -	mutex_lock(&smc_mutex);
> +	mutex_lock(&scmi_info->shmem_lock);
>=20
>  	shmem_tx_prepare(scmi_info->shmem, xfer);
>=20
>  	arm_smccc_1_1_invoke(scmi_info->func_id, 0, 0, 0, 0, 0, 0, 0, &res);
>  	scmi_rx_callback(scmi_info->cinfo,
> shmem_read_header(scmi_info->shmem));
>=20
> -	mutex_unlock(&smc_mutex);
> +	mutex_unlock(&scmi_info->shmem_lock);
>=20
>  	return res.a0;
>  }
> --
> 2.17.1

