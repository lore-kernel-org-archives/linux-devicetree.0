Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E25C10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9B13206FA
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rpJNaq4K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgCLKQk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 06:16:40 -0400
Received: from mail-eopbgr60072.outbound.protection.outlook.com ([40.107.6.72]:4526
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbgCLKQk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 06:16:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIn49Xwi2tom52nHUgm/BY+OEjOqs6lLZt72v6Aph1amAoQAdRPgbizM+59DVhnAEvtakkXdn6iXXxA0/1yB5GqQsCahpzrdUDftLlGoz4tq5z8MOH+/ofjNDSkmg81LDDFmZBtCjLi7LV4Dm5dNDA1EReGovfWViBo7cb05aTMgydpbsz3VECajY+NJonb/3Qs6c9b6QvLlborcH90T9f9M4Y1UIo3/kXRN693j+JT2/nBufBsw2KN3e3In5Eb0dNkHIxY4q+Ud80GJFtG69ofcU6z1Ug96Qq3lk2nMPIKLYGPBfyboQpTjMcw1cCXWknTZtRhoqaWG6HmGC2d6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGQzAJ7myTwy/33TfUg4U6zu3DB9CDUJzSaG+bELDQU=;
 b=lcTJy0zKPAqyBfYKs3xN6W/WIm//ZW6aRijcGpzijLVH+O43fCmPcj44zivnNGVTtdnxRThvF0zdMFuyOepUrw3HlLMK2OgtzUwhcVT6J3JLpz9tXzZMPK2/cQmDHk4no1h+pNGRNaUBLx5GKmP962zmPCvJor/1MpmLgzrz37Jg+8R9X30ZEQfbkLsmMy65HIM0um8+3LeZ9Rar64XSpczomU3rwXM+NaJzpM+sE7S6PQn3owJgFjyK2WJuoGb/HBezs+27tBGJE6JHk6o596sNoqi8CXXiChMjKJS8PJQw3sqeKnp/VPZR8TaCDm2Fq0AW1ueTOTqSsBgJm4ar9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGQzAJ7myTwy/33TfUg4U6zu3DB9CDUJzSaG+bELDQU=;
 b=rpJNaq4KEE6pere2IEVjnmG1bpbF5um52YYDJlWIsYJfpS2TP7D9UxBk4FCtS31wT+bmMpGK+CYtka3LEqotpCDU76pU+YlkcCqF3psTctxG2NNOZc2j9G7PH1N/S87rfcJG0iO0SrqOntrJkTMJZWwYfbzXl+jPb3ET3TjsBHw=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4208.eurprd04.prod.outlook.com (52.133.14.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 12 Mar 2020 10:16:36 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 10:16:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] phy: cadence: salvo: add salvo phy driver
Thread-Topic: [PATCH 1/2] phy: cadence: salvo: add salvo phy driver
Thread-Index: AQHV7TcXb9iHNZWeYkKIQzM3z7DzvahE1BIA
Date:   Thu, 12 Mar 2020 10:16:36 +0000
Message-ID: <VI1PR04MB5327384B8FE2CC716FDFFFD78BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200227062754.19131-1-peter.chen@nxp.com>
In-Reply-To: <20200227062754.19131-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ccb0880a-008a-49ca-1d60-08d7c66e7239
x-ms-traffictypediagnostic: VI1PR04MB4208:|VI1PR04MB4208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB420889C5663F066589D5846D8BFD0@VI1PR04MB4208.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(30864003)(71200400001)(478600001)(7696005)(52536014)(8676002)(81166006)(44832011)(4326008)(81156014)(86362001)(26005)(186003)(66476007)(64756008)(66556008)(66446008)(5660300002)(2906002)(110136005)(54906003)(8936002)(9686003)(6506007)(76116006)(316002)(33656002)(66946007)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4208;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wIXwXqcgxwXu41CmTo4917cG3PTdyrArQ/5odJmmLokboPGKajQtUyu+BOLwYb/9Q3xNp9ylQKFTyDTkvx8yx+x/wsq8x6p8ZnYxwVsP49nUvccSDARf4NfwZj4BSPmHSM2tltlpoLkregrBRrGlK9LSJRCmp7gd9jNlZf5TN/ke+3dr78qymJa6F6j4XepVt/qyB5HnGOxJGQIjG2BXCuMHk0nec24bscX5Ps1rvMVfvzoroPEvjeYonxJ6NK2WKhh1JtK4cAg4Pdr1padJeNUOxTogd6cJEeet/AqwkczEmzLZPAN4r33ZZ20MhAvkimlhLUqoQX5FjNFQb3Hb4IRrioKEUiig+KLUtpaZuj39fwnh6+kUIRtfc+q/t7eyKyUuAo4seQqbKxxGLITIeh/p4RBisihhTX+4laBZWm4yQawardQgoz7Hxoj6eUo7
x-ms-exchange-antispam-messagedata: //WFHgnulh5qion9I16wl2xVjqtb5Isdgcvd+rS88+J4aGU0ekGw1AZ6GV2wnnsn46wrH5jKLcgQAtCj0bOJAOhKfU7FHMfvsWAx9E6GwAYRzUGfcfWxJzGQYbMy48Qgc8/sDLZhJOfDzY9onB8GOg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb0880a-008a-49ca-1d60-08d7c66e7239
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 10:16:36.0582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjOQlKd3PcppywnIZf7QAcw62Vz9apCTp9cY5O31IY8Cf2ORmU/xMIo4Jwd/NNsu4ZarwOcnzjOyMAVd1Qa6mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4208
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=20
>=20
> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
> According to the Cadence, this PHY is a legacy Module, and Sierra and Tor=
rent are
> later evolutions from it, and their sequence overlap is minimal, meaning =
we cannot
> reuse either (Sierra & Torrent) of the PHY drivers.
>=20
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

A gentle ping...

Peter

> ---
>  drivers/phy/cadence/Kconfig             |   9 +
>  drivers/phy/cadence/Makefile            |   1 +
>  drivers/phy/cadence/phy-cadence-salvo.c | 316 ++++++++++++++++++++++++
>  3 files changed, 326 insertions(+)
>  create mode 100644 drivers/phy/cadence/phy-cadence-salvo.c
>=20
> diff --git a/drivers/phy/cadence/Kconfig b/drivers/phy/cadence/Kconfig in=
dex
> b2db916db64b..eca272b227b7 100644
> --- a/drivers/phy/cadence/Kconfig
> +++ b/drivers/phy/cadence/Kconfig
> @@ -27,3 +27,12 @@ config PHY_CADENCE_SIERRA
>  	select GENERIC_PHY
>  	help
>  	  Enable this to support the Cadence Sierra PHY driver
> +
> +config PHY_CADENCE_SALVO
> +	tristate "Cadence Salvo PHY Driver"
> +	depends on OF && HAS_IOMEM
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the Cadence SALVO PHY driver,
> +	  this PHY is a legacy PHY, and only are used for USB3
> +	  and USB2.
> diff --git a/drivers/phy/cadence/Makefile b/drivers/phy/cadence/Makefile =
index
> 8f89560f1711..7c7d13c0c647 100644
> --- a/drivers/phy/cadence/Makefile
> +++ b/drivers/phy/cadence/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_PHY_CADENCE_DP)	+=3D phy-cadence-dp.o
>  obj-$(CONFIG_PHY_CADENCE_DPHY)	+=3D cdns-dphy.o
>  obj-$(CONFIG_PHY_CADENCE_SIERRA)	+=3D phy-cadence-sierra.o
> +obj-$(CONFIG_PHY_CADENCE_SALVO)	+=3D phy-cadence-salvo.o
> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadenc=
e/phy-
> cadence-salvo.c
> new file mode 100644
> index 000000000000..fa666527356d
> --- /dev/null
> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Salvo PHY is a 28nm PHY, it is a legacy PHY, and only
> + * for USB3 and USB2.
> + *
> + * Copyright (c) 2019-2020 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +
> +/* PHY register definition */
> +#define PHY_PMA_CMN_CTRL1			0xC800
> +#define TB_ADDR_CMN_DIAG_HSCLK_SEL		0x01e0
> +#define TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR	0x0084
> +#define TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR	0x0085
> +#define TB_ADDR_CMN_PLL0_INTDIV	                0x0094
> +#define TB_ADDR_CMN_PLL0_FRACDIV		0x0095
> +#define TB_ADDR_CMN_PLL0_HIGH_THR		0x0096
> +#define TB_ADDR_CMN_PLL0_SS_CTRL1		0x0098
> +#define TB_ADDR_CMN_PLL0_SS_CTRL2		0x0099
> +#define TB_ADDR_CMN_PLL0_DSM_DIAG		0x0097
> +#define TB_ADDR_CMN_DIAG_PLL0_OVRD		0x01c2
> +#define TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD		0x01c0
> +#define TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD		0x01c1
> +#define TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE          0x01C5
> +#define TB_ADDR_CMN_DIAG_PLL0_CP_TUNE           0x01C6
> +#define TB_ADDR_CMN_DIAG_PLL0_LF_PROG           0x01C7
> +#define TB_ADDR_CMN_DIAG_PLL0_TEST_MODE		0x01c4
> +#define TB_ADDR_CMN_PSM_CLK_CTRL		0x0061
> +#define TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR	0x40ea
> +#define TB_ADDR_XCVR_PSM_RCTRL	                0x4001
> +#define TB_ADDR_TX_PSC_A0		        0x4100
> +#define TB_ADDR_TX_PSC_A1		        0x4101
> +#define TB_ADDR_TX_PSC_A2		        0x4102
> +#define TB_ADDR_TX_PSC_A3		        0x4103
> +#define TB_ADDR_TX_DIAG_ECTRL_OVRD		0x41f5
> +#define TB_ADDR_TX_PSC_CAL		        0x4106
> +#define TB_ADDR_TX_PSC_RDY		        0x4107
> +#define TB_ADDR_RX_PSC_A0	                0x8000
> +#define TB_ADDR_RX_PSC_A1	                0x8001
> +#define TB_ADDR_RX_PSC_A2	                0x8002
> +#define TB_ADDR_RX_PSC_A3	                0x8003
> +#define TB_ADDR_RX_PSC_CAL	                0x8006
> +#define TB_ADDR_RX_PSC_RDY	                0x8007
> +#define TB_ADDR_TX_TXCC_MGNLS_MULT_000		0x4058
> +#define TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY	0x41e7
> +#define TB_ADDR_RX_SLC_CU_ITER_TMR		0x80e3
> +#define TB_ADDR_RX_SIGDET_HL_FILT_TMR		0x8090
> +#define TB_ADDR_RX_SAMP_DAC_CTRL		0x8058
> +#define TB_ADDR_RX_DIAG_SIGDET_TUNE		0x81dc
> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE2		0x81df
> +#define TB_ADDR_RX_DIAG_BS_TM	                0x81f5
> +#define TB_ADDR_RX_DIAG_DFE_CTRL1		0x81d3
> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM4		0x81c7
> +#define TB_ADDR_RX_DIAG_ILL_E_TRIM0		0x81c2
> +#define TB_ADDR_RX_DIAG_ILL_IQ_TRIM0		0x81c1
> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM6		0x81c9
> +#define TB_ADDR_RX_DIAG_RXFE_TM3		0x81f8
> +#define TB_ADDR_RX_DIAG_RXFE_TM4		0x81f9
> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE		0x81dd
> +#define TB_ADDR_RX_DIAG_DFE_CTRL3		0x81d5
> +#define TB_ADDR_RX_DIAG_SC2C_DELAY		0x81e1
> +#define TB_ADDR_RX_REE_VGA_GAIN_NODFE		0x81bf
> +#define TB_ADDR_XCVR_PSM_CAL_TMR		0x4002
> +#define TB_ADDR_XCVR_PSM_A0BYP_TMR		0x4004
> +#define TB_ADDR_XCVR_PSM_A0IN_TMR		0x4003
> +#define TB_ADDR_XCVR_PSM_A1IN_TMR		0x4005
> +#define TB_ADDR_XCVR_PSM_A2IN_TMR		0x4006
> +#define TB_ADDR_XCVR_PSM_A3IN_TMR		0x4007
> +#define TB_ADDR_XCVR_PSM_A4IN_TMR		0x4008
> +#define TB_ADDR_XCVR_PSM_A5IN_TMR		0x4009
> +#define TB_ADDR_XCVR_PSM_A0OUT_TMR		0x400a
> +#define TB_ADDR_XCVR_PSM_A1OUT_TMR		0x400b
> +#define TB_ADDR_XCVR_PSM_A2OUT_TMR		0x400c
> +#define TB_ADDR_XCVR_PSM_A3OUT_TMR		0x400d
> +#define TB_ADDR_XCVR_PSM_A4OUT_TMR		0x400e
> +#define TB_ADDR_XCVR_PSM_A5OUT_TMR		0x400f
> +#define TB_ADDR_TX_RCVDET_EN_TMR	        0x4122
> +#define TB_ADDR_TX_RCVDET_ST_TMR	        0x4123
> +#define TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR	0x40f2
> +#define TB_ADDR_TX_RCVDETSC_CTRL	        0x4124
> +
> +/* TB_ADDR_TX_RCVDETSC_CTRL */
> +#define RXDET_IN_P3_32KHZ			BIT(1)
> +
> +struct cdns_reg_pairs {
> +	u16 val;
> +	u32 off;
> +};
> +
> +struct cdns_salvo_data {
> +	u8 reg_offset_shift;
> +	struct cdns_reg_pairs *init_sequence_val;
> +	u8 init_sequence_length;
> +};
> +
> +struct cdns_salvo_phy {
> +	struct phy *phy;
> +	struct clk *clk;
> +	void __iomem *base;
> +	struct cdns_salvo_data *data;
> +};
> +
> +static const struct of_device_id cdns_salvo_phy_of_match[]; static u16
> +cdns_salvo_read(struct cdns_salvo_phy *salvo_phy, u32 reg) {
> +	return (u16)readl(salvo_phy->base +
> +		reg * (1 << salvo_phy->data->reg_offset_shift));
> +}
> +
> +static void cdns_salvo_write(struct cdns_salvo_phy *salvo_phy,
> +		u32 reg, u16 val)
> +{
> +	writel(val, salvo_phy->base +
> +		reg * (1 << salvo_phy->data->reg_offset_shift));
> +}
> +
> +/*
> + * Below bringup sequence pair are from Cadence PHY's User Guide
> + * and NXP platform tuning results.
> + */
> +static struct cdns_reg_pairs cdns_nxp_sequence_pair[] =3D {
> +	{0x0830, PHY_PMA_CMN_CTRL1},
> +	{0x0010, TB_ADDR_CMN_DIAG_HSCLK_SEL},
> +	{0x00f0, TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR},
> +	{0x0018, TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR},
> +	{0x00d0, TB_ADDR_CMN_PLL0_INTDIV},
> +	{0x4aaa, TB_ADDR_CMN_PLL0_FRACDIV},
> +	{0x0034, TB_ADDR_CMN_PLL0_HIGH_THR},
> +	{0x01ee, TB_ADDR_CMN_PLL0_SS_CTRL1},
> +	{0x7f03, TB_ADDR_CMN_PLL0_SS_CTRL2},
> +	{0x0020, TB_ADDR_CMN_PLL0_DSM_DIAG},
> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_OVRD},
> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD},
> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD},
> +	{0x0007, TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE},
> +	{0x0027, TB_ADDR_CMN_DIAG_PLL0_CP_TUNE},
> +	{0x0008, TB_ADDR_CMN_DIAG_PLL0_LF_PROG},
> +	{0x0022, TB_ADDR_CMN_DIAG_PLL0_TEST_MODE},
> +	{0x000a, TB_ADDR_CMN_PSM_CLK_CTRL},
> +	{0x0139, TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR},
> +	{0xbefc, TB_ADDR_XCVR_PSM_RCTRL},
> +
> +	{0x7799, TB_ADDR_TX_PSC_A0},
> +	{0x7798, TB_ADDR_TX_PSC_A1},
> +	{0x509b, TB_ADDR_TX_PSC_A2},
> +	{0x0003, TB_ADDR_TX_DIAG_ECTRL_OVRD},
> +	{0x509b, TB_ADDR_TX_PSC_A3},
> +	{0x2090, TB_ADDR_TX_PSC_CAL},
> +	{0x2090, TB_ADDR_TX_PSC_RDY},
> +
> +	{0xA6FD, TB_ADDR_RX_PSC_A0},
> +	{0xA6FD, TB_ADDR_RX_PSC_A1},
> +	{0xA410, TB_ADDR_RX_PSC_A2},
> +	{0x2410, TB_ADDR_RX_PSC_A3},
> +
> +	{0x23FF, TB_ADDR_RX_PSC_CAL},
> +	{0x2010, TB_ADDR_RX_PSC_RDY},
> +
> +	{0x0020, TB_ADDR_TX_TXCC_MGNLS_MULT_000},
> +	{0x00ff, TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY},
> +	{0x0002, TB_ADDR_RX_SLC_CU_ITER_TMR},
> +	{0x0013, TB_ADDR_RX_SIGDET_HL_FILT_TMR},
> +	{0x0000, TB_ADDR_RX_SAMP_DAC_CTRL},
> +	{0x1004, TB_ADDR_RX_DIAG_SIGDET_TUNE},
> +	{0x4041, TB_ADDR_RX_DIAG_LFPSDET_TUNE2},
> +	{0x0480, TB_ADDR_RX_DIAG_BS_TM},
> +	{0x8006, TB_ADDR_RX_DIAG_DFE_CTRL1},
> +	{0x003f, TB_ADDR_RX_DIAG_ILL_IQE_TRIM4},
> +	{0x543f, TB_ADDR_RX_DIAG_ILL_E_TRIM0},
> +	{0x543f, TB_ADDR_RX_DIAG_ILL_IQ_TRIM0},
> +	{0x0000, TB_ADDR_RX_DIAG_ILL_IQE_TRIM6},
> +	{0x8000, TB_ADDR_RX_DIAG_RXFE_TM3},
> +	{0x0003, TB_ADDR_RX_DIAG_RXFE_TM4},
> +	{0x2408, TB_ADDR_RX_DIAG_LFPSDET_TUNE},
> +	{0x05ca, TB_ADDR_RX_DIAG_DFE_CTRL3},
> +	{0x0258, TB_ADDR_RX_DIAG_SC2C_DELAY},
> +	{0x1fff, TB_ADDR_RX_REE_VGA_GAIN_NODFE},
> +
> +	{0x02c6, TB_ADDR_XCVR_PSM_CAL_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A0BYP_TMR},
> +	{0x02c6, TB_ADDR_XCVR_PSM_A0IN_TMR},
> +	{0x0010, TB_ADDR_XCVR_PSM_A1IN_TMR},
> +	{0x0010, TB_ADDR_XCVR_PSM_A2IN_TMR},
> +	{0x0010, TB_ADDR_XCVR_PSM_A3IN_TMR},
> +	{0x0010, TB_ADDR_XCVR_PSM_A4IN_TMR},
> +	{0x0010, TB_ADDR_XCVR_PSM_A5IN_TMR},
> +
> +	{0x0002, TB_ADDR_XCVR_PSM_A0OUT_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A1OUT_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A2OUT_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A3OUT_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A4OUT_TMR},
> +	{0x0002, TB_ADDR_XCVR_PSM_A5OUT_TMR},
> +	/* Change rx detect parameter */
> +	{0x0960, TB_ADDR_TX_RCVDET_EN_TMR},
> +	{0x01e0, TB_ADDR_TX_RCVDET_ST_TMR},
> +	{0x0090, TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR},
> +};
> +
> +
> +static int cdns_salvo_phy_power_on(struct phy *phy) {
> +	struct cdns_salvo_phy *salvo_phy =3D phy_get_drvdata(phy);
> +	struct cdns_salvo_data *data =3D salvo_phy->data;
> +	int ret, i;
> +	u16 value;
> +
> +	ret =3D clk_prepare_enable(salvo_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < data->init_sequence_length; i++) {
> +		struct cdns_reg_pairs *reg_pair =3D data->init_sequence_val + i;
> +
> +		cdns_salvo_write(salvo_phy, reg_pair->off, reg_pair->val);
> +	}
> +
> +	/* RXDET_IN_P3_32KHZ, Receiver detect slow clock enable */
> +	value =3D cdns_salvo_read(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL);
> +	value |=3D RXDET_IN_P3_32KHZ;
> +	cdns_salvo_write(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL,
> +			RXDET_IN_P3_32KHZ);
> +
> +	udelay(10);
> +
> +	return ret;
> +}
> +
> +static int cdns_salvo_phy_power_off(struct phy *phy) {
> +	struct cdns_salvo_phy *salvo_phy =3D phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(salvo_phy->clk);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops cdns_salvo_phy_ops =3D {
> +	.power_on	=3D cdns_salvo_phy_power_on,
> +	.power_off	=3D cdns_salvo_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static int cdns_salvo_phy_probe(struct platform_device *pdev) {
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct cdns_salvo_phy *salvo_phy;
> +	struct resource *res;
> +	const struct of_device_id *match;
> +	struct cdns_salvo_data *data;
> +
> +	match =3D of_match_device(cdns_salvo_phy_of_match, dev);
> +	if (!match)
> +		return -EINVAL;
> +
> +	data =3D (struct cdns_salvo_data *)match->data;
> +	salvo_phy =3D devm_kzalloc(dev, sizeof(*salvo_phy), GFP_KERNEL);
> +	if (!salvo_phy)
> +		return -ENOMEM;
> +
> +	salvo_phy->data =3D data;
> +	salvo_phy->clk =3D devm_clk_get_optional(dev, "salvo_phy_clk");
> +	if (IS_ERR(salvo_phy->clk))
> +		return PTR_ERR(salvo_phy->clk);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	salvo_phy->base =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(salvo_phy->base))
> +		return PTR_ERR(salvo_phy->base);
> +
> +	salvo_phy->phy =3D devm_phy_create(dev, NULL, &cdns_salvo_phy_ops);
> +	if (IS_ERR(salvo_phy->phy))
> +		return PTR_ERR(salvo_phy->phy);
> +
> +	phy_set_drvdata(salvo_phy->phy, salvo_phy);
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct cdns_salvo_data cdns_nxp_salvo_data =3D {
> +	2,
> +	cdns_nxp_sequence_pair,
> +	ARRAY_SIZE(cdns_nxp_sequence_pair),
> +};
> +
> +static const struct of_device_id cdns_salvo_phy_of_match[] =3D {
> +	{
> +		.compatible =3D "nxp,salvo-phy",
> +		.data =3D &cdns_nxp_salvo_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cdns_salvo_phy_of_match);
> +
> +static struct platform_driver cdns_salvo_phy_driver =3D {
> +	.probe	=3D cdns_salvo_phy_probe,
> +	.driver =3D {
> +		.name	=3D "cdns-salvo-phy",
> +		.of_match_table	=3D cdns_salvo_phy_of_match,
> +	}
> +};
> +module_platform_driver(cdns_salvo_phy_driver);
> +
> +MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
> MODULE_LICENSE("GPL
> +v2"); MODULE_DESCRIPTION("Cadence SALVO PHY Driver");
> --
> 2.17.1

