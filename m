Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE95C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 01:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F19208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 01:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="P3IYe87q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgHUBjx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 21:39:53 -0400
Received: from mail-am6eur05on2062.outbound.protection.outlook.com ([40.107.22.62]:44672
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726819AbgHUBjs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Aug 2020 21:39:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCrg/RBoBu+fr7ETMOLkJcDRag8BXsiYEcIxIBog7JZEjAzaElqrPGiVjw6owu70yqEHDWbM+jvyXK/CF4QEBaoPkZ2Nigq0LW9tr/p2WG5tk8TI+Qc1/A9tega0rZclU+//ndjF9HBjSwmB98+29NrpoGzlrbDZski6bkM8gMC+3PWTiMmHFPWvA3ykFYCUfTNCKmGuPCpOhRNpGcvCT4J/Fs2lRhn2ZTkal1siSdyOHnq8l/FIOC/EEE6QbID0+Z90OXjT4JIwt1V3q5hVkeFQ/E/6MA1uzReDLOdlHvtvrTvUDtp5p9aW2qH87ByvoSa8zdTLglQ8pQigP315NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E26P83qh6qUHmDG++MBPWcTeXfxsHO9ucmb063ch6I=;
 b=kCzzoQzLrlqHSXYr//q2JDVcBvkzzvcftXvmwcErI2gYXVpR3HKHaJN6evr5zZCING1MgBbZhijgrr1eBJcNLY9KPme7Bqbu6iEm6BH4+8/4eOTwjSqyOT8qUUS3vLj+t1gawRJS65KrPGCyGZMWrAB9nFnrb+Njs+aFMfUgwq1cw2UpC1MVZaPI2XLz1v7bylBgpYO38/JUGzaaOaKD0qDn198u2hBwyNd4QV11UiBh9vwCpwB75AHUbq2GXZjC/mSpLHLTpoNSIRIbHDoJCp5JvwhC1fFi55qN2wH98X7rZZvuKhE92to7eit7Oxx059y96aDSAYnqsvepRHHBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E26P83qh6qUHmDG++MBPWcTeXfxsHO9ucmb063ch6I=;
 b=P3IYe87qOlx+gsfZttnqsbJ8QliWEmALTb8OAQlvvDNICuG43UphQ+yjYpcbGUu4JDnG/SO4+MXyW8IxxqAqtlE/9qht562lN2F3uIPJA8A8N2o3SHLi3XQW3N/bisXptAfWEDUeqnDBZs4tQCKBw6IdkOYFQgRA6KcdBF8mL1o=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4856.eurprd04.prod.outlook.com (2603:10a6:20b:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 01:39:44 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Fri, 21 Aug 2020
 01:39:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: imx8mm-evk: add two parameters for
 samsung picophy tuning
Thread-Topic: [PATCH v3 3/4] arm64: dts: imx8mm-evk: add two parameters for
 samsung picophy tuning
Thread-Index: AQHWYYCFfcI/EL75wkqE5gg4u6HvralB9JWA
Date:   Fri, 21 Aug 2020 01:39:44 +0000
Message-ID: <20200821013839.GA24960@b29397-desktop>
References: <20200724060532.3878-1-peter.chen@nxp.com>
 <20200724060532.3878-3-peter.chen@nxp.com>
In-Reply-To: <20200724060532.3878-3-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a18fd7c-86c7-41cd-c43c-08d8457314b2
x-ms-traffictypediagnostic: AM6PR04MB4856:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB48563F778474358ABB14B99F8B5B0@AM6PR04MB4856.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EAkR3N4dGvJd19kf+QkkJLaN/Kgmf9/rPXeHWXi3PA+4NzQl6X0xdFT2mw5EO5fDJiHX99CZma033GXdo/pCFgCibkTtoDyh/13xaXfhFAG2CFqfmkqPgP6Lhg85E2VFEssX781H+UojXF7A+mL6DqtSu3rG4UPorkMbZirdzIy+tMir7hREuu9OkEc/LXuvg8xg4mIRoj2WFhKVuMcTp5Z3qGuc9qz00B5KVKZbgJ9pW1ePtiPiFZXeihiZaOx3UoRdjEsvI6yIHk1jTJHnde41MDmRGhjEG73qeu32STI4oI1syDpObBEctg79229WffqqEEE+fj3qNxD9Zw+rQhb0MZTeyxByvD1r4DgMlTgqy+HwpwquYVa3t8CzNVqW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(71200400001)(64756008)(66556008)(66446008)(66946007)(66476007)(53546011)(8676002)(478600001)(4326008)(91956017)(6486002)(76116006)(8936002)(33716001)(9686003)(33656002)(6512007)(6506007)(86362001)(1076003)(44832011)(316002)(26005)(4744005)(110136005)(2906002)(54906003)(186003)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cPMUF5UBsdLbPNe5g1zvVhMSq+2tlcD9mY+do06GZ9G8eybqWoBUA+mEYMAWOdEVksPkYrw9rffHDjAKHU07q9a8RI5Y+KOyTpZbQMif9Gq5uQkFEkKGRSx6gGxw3jPVWjNVcV69jC5H/y0R5OhBL6Lz44NcDL5NQZvxYSlc4akkRGp0GMXwkR+nAJ8M4YYPA6/i5OQedSuUtaDuf+oqM5k7C0xYR8Ji2yIVS3OI78pTus9PWt3a52MLQfciIIYohNqpwfF082DZ+/hV4z43yoBkp222BqM4ubrKZ7Osj2IZFH/QYakzsQkgVrumDlTXsZCy4TXUSYfgO+JJz90X3MM18H8yglST31mx9o+J2zPnaaLbUyjukRPfJ1U5Xug6fp0F2UQxLp6DmGMe5IPbRpFXtrT6XrQnEqBZomr7V3i3+5wpenKwmRbRsY3uc+c5pkBycOOEqcnnDjz9au5D08ulqieTePARzp0grF6MpQjNtrAXbHm+kD92eajVXp/CMAJTa+jq+Pk4yrJnps1RKfgRtLZ1mi16lBhi3/INZfsLQN/LVvhjgTtBWf/U8lqwp7RepgkXYZ58J1lI2kffUd/O9Uu4DIe4TfiLQ49n0m50f0YVpV9Fbo6b7Epd7cJzYWKN7E+apfcAFG4fg58HUg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7FAC2D6C90BAE468A8E5158C48F9009@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a18fd7c-86c7-41cd-c43c-08d8457314b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 01:39:44.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jITiqyNNN3Jz7EmhtRRNDC/ptoCcCHPbxZiV3ap1GYk0ruPbdcFKhbpizCdGPnp7ZtZTZ4QuMpemRQ5JU2lyow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4856
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-07-24 14:05:31, Peter Chen wrote:
> With these two parameters tuning, it can pass USB eye diagram at evk boar=
d.
>=20
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Using the new property name
> Changes for v2
> - Address Shawn's comment to change subject.
>=20
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mm-evk.dts
> index 0f1d7f8aeac4..7c652b898114 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -324,6 +324,8 @@
>  	srp-disable;
>  	adp-disable;
>  	usb-role-switch;
> +	samsung,picophy-pre-emp-curr-control =3D <3>;
> +	samsung,picophy-dc-vol-level-adjust =3D <7>;
>  	status =3D "okay";
> =20
>  	port {
> --=20

Hi Shawn,

Rob has already acked the binding-doc changes, would you please queue
these two dts changes?

--=20

Thanks,
Peter Chen=
