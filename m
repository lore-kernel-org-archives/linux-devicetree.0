Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98716C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6185620784
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hQXkreA/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbgDAJPC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 05:15:02 -0400
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:61405
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731870AbgDAJPB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 05:15:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi/N1vgkLWwb14+uk/Akjw9WCc7/C233Aujxn10SGKd3tAAHEN0VlSQyLK2TLAicc1NYzy8/rSFJlhdEm+1lR9mAGvVlN/0vTSHHNqgPaUxX2Loz6Rbd3TWePH85K6u6KRNNFpxU3KOkMq0I4o2+vJIVBvLY82IVtnpMyNtzoP9d4OXF5CeLlDzVQiPSQ4bV/+MiPT62TgOz68ls6yyKMrcIR+2hvkPIvEyEs5lznwY5RrNhMCpjQXM7YAgz1uo/jRcvNCuTAi+RzzqwX+nLpkdZD/W7iMJtAi2p0kyxJ8pnyZyMdpLLs76AQ3Qw6G3fNzqDoeAGwsuu/deH3Ho7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34PtxPYZuL/fgtgYD3K4LX6UvbqcV4OJeuW4+Ro4pew=;
 b=f7xLquayGq+9usUMhZjuiNhEJPDrt0LXmJcG/hNmuNr8+8zqUjx8tMrkYOw7qr6XwNvXUrT2Ty7PUsVt1UIycvjwWG8CrnDHqYtsj8q+lnRdTbuR5wwZ/HaW6JZ7OmQd9BTLc8pnkB9crOp9pz9wNodqOIbCE4rI2RDqlgLys0HZwsqWyWYFEklWfkhxcyGLUs/BLAMBUqr8+XzrRoD4URBbQ+w+ZKw/4pyVAZSIs+I8hKF102QhB6VX9/wdX5KT5CpeCTSvIWG7+uoXE9qqTh7dGUYwZDmiaghv8NkeEC3oTDZHkI49Y5iHtM/ulzxgUbgDnJiSJQu3rFioRtG80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34PtxPYZuL/fgtgYD3K4LX6UvbqcV4OJeuW4+Ro4pew=;
 b=hQXkreA/R8KA3OBiPJDtTOM2OtGQpUG+gOqKWnHimWxgMDbcxQ5RNVh/V3YhYxzuZMClongVHmrDGajkJAdkeGw9s3R6sljxYNCYPyTVRb/WCUbSNHn42flb4zNsjrlnqrugEMw/9wkAc4y1U7xBYFUGtUAl5a1NWIAgr77k+hE=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6324.eurprd04.prod.outlook.com (20.179.34.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Wed, 1 Apr 2020 09:14:58 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 09:14:58 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Index: AQHWBFX27nJMU2DyaUm7ucC0dRZvA6hkA0GQ
Date:   Wed, 1 Apr 2020 09:14:58 +0000
Message-ID: <AM0PR04MB44810BFD8448E450AD0D833F88C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 33ed5842-52be-43ff-f4a6-08d7d61d26be
x-ms-traffictypediagnostic: AM0PR04MB6324:|AM0PR04MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB632431C27D3E6DB89B36BAFA88C90@AM0PR04MB6324.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(52536014)(26005)(5660300002)(66946007)(71200400001)(66446008)(4326008)(2906002)(33656002)(76116006)(186003)(316002)(8936002)(44832011)(86362001)(66556008)(7696005)(110136005)(54906003)(66476007)(81156014)(9686003)(55016002)(6506007)(478600001)(64756008)(81166006)(8676002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5SYaxfGw6sm1pNUuZZ8vonm9p8SOchVIhW8UGLZ04IMTEmCgeuW7010EwKl/xCQsy7lngxWDqtYP2vzUIorKeLyz6T4/3pdGu8vEQ1qnWXZ29Z4zdL2wgAhT0vUk4LksWlxmztEarZnL3aZ7Cct2OpG4daDEl4iMlGpDg284YXDYdqTNXZ2RxzFJs43X102/3RFkfUPR1XnIEAnVgdCd9fbKIn1xSmWOzGWRZaBLtCGX6NPsWYDeeFkG71tIHihKTc9o4wBt0JltL3AFJmHql2CTZospA4WPpEbTnu7zVD9IZ7FLMD/+WvPZURt5dR+1qykWJudSwpI61/pXlz3k304nyDWwhvFPO//Ms1uuD5Rs0sXf318TMGCFJmNARq2eIr6jvHOo9xCEH7pXCYmJC99AMlDnuDW/BUvIepzZMMTv4FHI1OME1y7k29JYics
x-ms-exchange-antispam-messagedata: uZRQinW8RKmX0c2BhbMOLUzDzvNKVWX2aApra2w9WeC9TNgn8cmO7Ju0yea9OHAEe+1DzJcJ+yh+lIHh4MsLY69NRDXbV1fv2aOXp3uJ/OB/kWLC69xcMkX8MMsy0TZ5c2YHqseQadMNlv0piTdf8Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed5842-52be-43ff-f4a6-08d7d61d26be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 09:14:58.7739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrR108zEi1uLqaeWWrmf3FKhW/N+WTobjo0ZTYC4tXa/EDZyhZt9wg5+teT76y0lyZDB6mRVEOps5tWv9orRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6324
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
>=20
> In order to support multiple SMC/HVC transport channels with associated
> shared memory, it is better to maintain the mutex per channel instead of
> existing global one.
>=20
> Move the smc_mutex into the scmi_smc structure and also rename it to
> shmem_lock which is more appropriate for it's use.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

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

