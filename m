Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF54C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:16:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF4DF20786
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 01:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MHXWwrup"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgDABQB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 21:16:01 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:31397
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731470AbgDABQB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 21:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O65SxPterHzq4ihHQ59EsE6lLgRiJFiPOpAf7sM5fDEe8heFIt2FXdRymOwqwbJpoXKdlB09hdBzVm6NVyutmy/llPHU5SDJicbnPgOw4QGdtxJLuRmJunuCdY7AUwCQJFB7TTwHyGmpJg4/dHjS6a0h9j9+RKqe1Ltw1FKmAQGDf9093KoROX1XBpI+zwzyQk6Ps8O8eQRK3VTRQC/8nlrL9l2wajv8ovNujTp7YOVpJnSO/uNtVHr5USdpYuw1EFTO9Zyscw/AhuKHVpenZo1p6OfWhkcjdBCPU7J4rAKtsK92jsfGNFKlFVcjwNrYuxFR2mVwva65l/4pRw42xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8Ey9joXklJ9loEB8ol/VwM7WAlMrIp4jPw5ovqpz8A=;
 b=YeDtupZtSyMmWxd4e5qRNiFOtAfkO90SepVTAjrW2x3dUZ4ovHWacTwssXqcPCTUHiw22YrLLWw3jFv1QEpPg4DtOwGnVhwlj37C0U98p3Qzzpgorpq19PqUmC22aNvGhA9WwmpXdwa2WSS4Ju858DHvwcCfLdHV0jiwDu48Mo0g0ymc51qlJr4aawAIH6H4DKGDH8oQuUu4NAHwPnyk26QDH/T7h+FOUC4T28s5Ia4noBMxfryNP7kgQCQw//ThflgfKyjrMWYHtyUwikgyfRK7IouC48pYeuWhDof6TIZTaQkHzBjuYsnMihgyTSCBLbvuBQ7Gs309gdmHiy34LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8Ey9joXklJ9loEB8ol/VwM7WAlMrIp4jPw5ovqpz8A=;
 b=MHXWwrupEZdwxrM3EbacLvamu0zwBxcSfvFA8yBlmGM0JmkUkZWoWJJAh+PwaYybkchOzgsLQ94PhguerNID1BlXZoqA/whnqtgewn/XW+RSM5oeMT6DyztByYhZAP0YxNAb0/4474+Pfhw6Xbal7DrjTrTqOPCE9YKZOYaIflU=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5041.eurprd04.prod.outlook.com (20.176.214.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 01:15:57 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 01:15:57 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/4] firmware: arm_scmi: Drop empty stub for
 smc_mark_txdone
Thread-Topic: [PATCH 2/4] firmware: arm_scmi: Drop empty stub for
 smc_mark_txdone
Thread-Index: AQHWBFX3DyXK4dtxUEKnfVv96JS4QKhjfVoA
Date:   Wed, 1 Apr 2020 01:15:57 +0000
Message-ID: <AM0PR04MB4481618539BBF11EAE49BFD488C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-3-sudeep.holla@arm.com>
In-Reply-To: <20200327163654.13389-3-sudeep.holla@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e6794681-0028-45ee-fedd-08d7d5da3ba1
x-ms-traffictypediagnostic: AM0PR04MB5041:|AM0PR04MB5041:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB504171868D02EC7F7DD01E6588C90@AM0PR04MB5041.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(86362001)(52536014)(81166006)(81156014)(64756008)(66446008)(316002)(66476007)(4326008)(54906003)(66946007)(110136005)(66556008)(9686003)(8676002)(8936002)(7696005)(26005)(5660300002)(44832011)(2906002)(186003)(55016002)(478600001)(33656002)(71200400001)(76116006)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXuV1V5HidS+ouwvdcCkWAEy8JNMU0LskqMhbmc6sn61v4A81B597NcttAKHLhALJxjLoqNvgKsQdmxRujJL7Qv7EYQvUtQ5S7hsqMZvYuooCGLd/rMcY8HJSzF734rlCq6svu0mSrUqN2y+Zf5z/yqXLmR7vOckN087WrM79alIQfzqXVn9MzXON6JjZrkslL8ymmvFkxqFTIMiBmRnHahaKbJNLyO81AE5TEwWdrIsMchZwUhWbZ1wVMfvhGNa+1LK0GrN0malHvEfVUEGkyqq9aiUfSeL9I3QUvQy/Np6AQ6wgSF9C39sDjebmm38LuMsT+mf4gFqDi0i6fYUxkOMdsqiKqFDIjVUFyXfGEtB6w50uW1mK4mIdBY/9euu/pFkTSL0JgvX11Y68We3xqpQOigaSMHkzgpr8GGwKjtiMqiemgehxtQDIbueufYp
x-ms-exchange-antispam-messagedata: HJsBLH3ShJsxZfu6OnUznLDaJXz0ISX+SwbCCer8ZBHgyWvnzDdNynZXt974ZssrfJShadzJHrFzM/HWglNPkDuzRxeR0gZ1z4LtSH1gCUhh+lhTRckYXvlUQAkCvRlZSdE+AqsglW34nUuw3pnFQQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6794681-0028-45ee-fedd-08d7d5da3ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 01:15:57.4884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCvdext7fnHFq1doTtj+kYutR5F9YPBk7J/ua2rSMOndasfUbqQqYPgulgtiht0JaxRcfYqObG58D2WcVbhkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5041
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject: [PATCH 2/4] firmware: arm_scmi: Drop empty stub for
> smc_mark_txdone
>=20
> The scmi protocol core driver check for non NULL mark_txdone before
> invoking the same. There is no need to provide a empty stub. SMC/HVC call=
s
> are synchronous and the call return indicates the completion.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
>  drivers/firmware/arm_scmi/smc.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/firmware/arm_scmi/smc.c
> b/drivers/firmware/arm_scmi/smc.c index 6dc8a88cc91b..dd4b54c29679
> 100644
> --- a/drivers/firmware/arm_scmi/smc.c
> +++ b/drivers/firmware/arm_scmi/smc.c
> @@ -114,10 +114,6 @@ static int smc_send_message(struct scmi_chan_info
> *cinfo,
>  	return res.a0;
>  }
>=20
> -static void smc_mark_txdone(struct scmi_chan_info *cinfo, int ret) -{ -}
> -
>  static void smc_fetch_response(struct scmi_chan_info *cinfo,
>  			       struct scmi_xfer *xfer)
>  {
> @@ -139,7 +135,6 @@ static struct scmi_transport_ops scmi_smc_ops =3D {
>  	.chan_setup =3D smc_chan_setup,
>  	.chan_free =3D smc_chan_free,
>  	.send_message =3D smc_send_message,
> -	.mark_txdone =3D smc_mark_txdone,
>  	.fetch_response =3D smc_fetch_response,
>  	.poll_done =3D smc_poll_done,
>  };
> --
> 2.17.1

