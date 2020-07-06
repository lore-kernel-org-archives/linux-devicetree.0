Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D82C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1277A2074F
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cbbrFIHO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgGFJsL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:11 -0400
Received: from mail-am6eur05on2072.outbound.protection.outlook.com ([40.107.22.72]:56940
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727973AbgGFJsL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amupD1tI16MX3/ZdcxcCRX7Fopsiu7q16TJZB+PoJvd0ejDE3LvuKa+0apzvQhbBdinB98rj34leyMJhjF6Zu4StI6l/27kcsjt8pWNXBP4w7miOG+OsObp6fPADDHGVxVgcFyQmRGN/RyzQLO8EGO0HaN3znZ2HshXCkmTfuwXooqghBdfCofOs/pLSKx9mmieuVtrdJYYE682e5gW59CB6re/RGjImx9XaSc2ScR2Y+5Ip/joE3C76yTwxb63farkp/O0JG9GEYp25BYdtn6qsrJePPOdA4p4sFiB0fZ66SEYeiT+qLzPAQ16KqPB+s3aaax9pw/EORjURfl00Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9XOVFxS6hVtLqoS3s5STCm0Zn3zTowG3uOfnwRZMwE=;
 b=G1udlfvphD/WgjBylwwOO4dgcrB0VH9NU+pdBrjV641YQq4Qu/NcMH+xuGU0Oefa3n1JplXOtE/yD5arL/DJcdaJRef/vyZ/ar7fRkPc99xcg0pj53jVIsLLCJmXdsAxXKkZFedTPhYzCJWStyUJXYZefKvj9LH9/EaSUbbUNXJ9gq2LB6dn8YdV/ULNGh9+ixTo15CX5SKUqQd7fwnz3Byr94bCxnBwFhm5+vKJkzW2M5agsxJUsoSkVk5bLAfkC72kAC+mplkxPDm/zpz62YsZRitZqeOkCroMAk56bpAvJuBESnLwpMUNIiVyUzjVLgjY1sKIWPlq720bR+1VRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9XOVFxS6hVtLqoS3s5STCm0Zn3zTowG3uOfnwRZMwE=;
 b=cbbrFIHOufecIdjRV0G5RJ8xKmHZNR7WtwE3LkFpPUjNY0XVtDY7UZ2amlvqTVvJwMANhXjQcS+8jkfuqo9TlRm9y5HL5Z1VOIemky5R5RtNgMZeJQly4OfKjWfQ9e+0lH03wOk06CzFfbqpOVhn6ncEQZ/jA4pQ9Mjquz/uWLo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:07 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:07 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 0/5] add NXP imx8mp usb support
Date:   Mon,  6 Jul 2020 17:44:54 +0800
Message-Id: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:03 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ebebf69-9f85-4095-d22f-08d82191af79
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35200D84092CDDC71BA24BAC89690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42+opubEzsyrxdzgrA7R9ReKWIACb1QCbTrOfQMA72fFS9R/9ezGxfxpx3ykoy5kNy3DfrR3Tu0a9IPIK3JCWVyrNpd//AtHjGfKMQOM7AyZmuUinIjsQE3NiS1njBmrYs9CpK11ptw9pj2cjLLm/OV80MOU314W/L6fYN3cRO7PCM+seaq7Szqn1DruraCpCK3PRNCi/7DEp35+zqShyHWjIWyOI1i9h5IBYjLcKGZq9Ej710LdKSa/pQJFk88mMzMTMma/GTmeZ10EG62PMfXZ1syDnSj1/zGViFVuKHT0zmK91YBhssXgzl4F6fM0Omm/7cwcqCVRCSUmcGKmsmy6AZu54EsAn5+Hi63EIWKK71ng6zCYvdgCoKzlndgm5D2k+8UxRFgidT8IzovZhIGxGl6fwNF8zdZqC7ZLM7SQx+OOYhshoFIwePbcw0l+6skYisFzjUpSW1N6V+bV1vC/EmV08YXbQYNMof4/Uf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(83380400001)(478600001)(5660300002)(36756003)(316002)(966005)(7416002)(6666004)(6486002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dhA8RWlIXx+oJg8n5SXfpmisLuNV3nPj32FAQUNNulYdmWri+AUsQMYBQQhQwgjmhU3iYnnOo+4oU2UcMtj8qL2+DHW0qhCWR7V4WpUfSWn7Mkrt+aIJHJG6eAiogIhxMtL7UXaSlxdX/ZptdO7myyJ41DHHfy5Ia0Xx9FU0k2ryG9e8GBy0WBPOvAlJqTzGUBeHOGoQ2jba0wNanLsDaK9kfem8EdMz5e819rp0J4/+Z6lQsMmf7tazh5fcuk83r5/vNTU2qjO0no0HxpbiMX+p5Uys2NGrEg6mDOZ+6HCufz0XZ/Qb3oP4hnQLEHJSQxO7S3IHWNco6I29u5BmbMmm9cQRU5Gh1VsHMdRc2ifAvG7Nfb9P0cxN7sugvLNGC3Je/zQaI4FKIk7fW3In9858WOVf+H1yztWsNta5GQs8IOt++WvfDzxNbA+2Uxnhpuo2NbbIYBOOCRQBQOcLtJ7oDGaX3Yf00GsfWCjaUEo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebebf69-9f85-4095-d22f-08d82191af79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:07.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu4RT+rrdNYAx4bHTwkYdijVwOyxttn1ksTmZnu7hAOZ+/JDR244uTVwMmprpDCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

NXP imx8MPlus integrates 2 indentical dwc3 3.30b IP with additional wakeup
logic to support low power, this wakeup logic has a separated interrupt
which can generate events with suspend clock(32K); due to SoC integration
limitation, a few quriks required, instead of create new properties flags,
introduce platform data and pass it from glue layer to dwc3 core, those xhci
private data can further pass to xhci-plat.

Changes for v2:
- Drop the 2 patches for new property("snps,xhci-dis-64bit-support-quirk")
  introduction, as suggested, imply by SoC compatible string, this is done
  by introduce dwc3 core platform data and pass the xhci_plat_priv to
  xhci-plat for those xhci quirks, so a new patch added:
  [1/5] usb: dwc3: add platform data to dwc3 core device to pass data.
  this patch is based on Peter's one patch which is also in review:
  https://patchwork.kernel.org/patch/11640945/
- dts change, use the USB power function of TRL logic instead of a always-on
  regulator to control vbus on/off.
- Some changes to address Peter's command on patch [2/5].

Li Jun (5):
  usb: dwc3: add platform data to dwc3 core device to pass data
  usb: dwc3: add imx8mp dwc3 glue layer driver
  arm64: dtsi: imx8mp: add usb nodes
  arm64: dts: imx8mp-evk: enable usb1 as host mode
  dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  87 +++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  21 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  77 +++++
 drivers/usb/dwc3/Kconfig                           |  10 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.h                            |   5 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     | 374 +++++++++++++++++++++
 drivers/usb/dwc3/host.c                            |   9 +
 8 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-imx8mp.c

-- 
2.7.4

