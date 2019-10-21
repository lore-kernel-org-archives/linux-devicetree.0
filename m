Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BF5CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DE022070B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="GUAW8U/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfJUOJK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 10:09:10 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:9734 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728098AbfJUOJK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 10:09:10 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9LE7pOJ022789;
        Mon, 21 Oct 2019 10:07:55 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vqy46bp0q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 21 Oct 2019 10:07:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB68ar1xa3tjAEDp59jVFNtPdqcSUjyGlXICKCruitdumcfvLf4Gj+8gXt+Ps+GgAzLJ0bfKOg0450I2qNtibRu2BdFk46ozXO8lO83Jb/iqiOt5mzQJUC88m49sn+jtiO1ncdNl7PMWT4A5ETPgS+k2yOOOgqFfG5OxdgMSt4TG11WzB7X4qb2C/SgMnhWbrrGAdP5IaOHC4Ry33t3VGsVgYO2ppF7jr+yfnnFzpips9iBJA1jbbHm6BHTMIUEJCmeRQyTsYQnmJPku0GThqFCaKded3BUGXUsTdDebPmLbcLd0AFqfSzbTw53LM/w+SfVdSihv0wbr0e0HBGJk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGSbXNynAXMA9ptwnkHijHRJsBV4HRIBhfEXyIf7Mbk=;
 b=QxJkJ6g8GaWoIrclz/4vaGh4sYgyLvu3U0QHSV1KkbaxaVI0713cM5x/cRJszk015q66Xill9QolTPOemmQA9ALkxlj5UuSC6/nJ88jlmd61163JiOxx/seBai58gZ7oj0kmdRln0LAGW0qcilIM9pOYEF29pZLBx1OGWK0Y2GWW+PG9EmTAzT4JSBtsUzZaQdHf0InB00P12jOYQTmyTUIOcr0a62+/LI6jOQSeFHnZVY0elZVkONcoKoIAvjYWsFo1DHxe6SPrIqVcks0cTiHvZB/JisLjzubj5ge8qrTr2vsLrHSQ85X4l88ArKHK+qwL42K/Yl2SIP82MlhrHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=gmail.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGSbXNynAXMA9ptwnkHijHRJsBV4HRIBhfEXyIf7Mbk=;
 b=GUAW8U/FXwKS45GFsJ4FUG/Mf/qVfKw4vTgjSEHpBok1DxutUz/gxHoQzVcdpv6U1CrqX295jGPR1rMdnAgZHxBkZcvuyS4G87CxqFp8CU6o6+69rE2s2cRBCQ+feXMNhqCbRUzKbea2mS2LZouxnqqCGONTUSH7mHpHV3ZSu98=
Received: from BN3PR03CA0063.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::23) by BN7SPR01MB11.namprd03.prod.outlook.com
 (2603:10b6:406:92::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Mon, 21 Oct
 2019 14:07:53 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by BN3PR03CA0063.outlook.office365.com
 (2a01:111:e400:7a4d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 14:07:53 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Mon, 21 Oct 2019 14:07:53 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9LE7jr9013912
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 21 Oct 2019 07:07:45 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 21 Oct
 2019 10:07:52 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] ASOC: adau7118: Change regulators id
Date:   Mon, 21 Oct 2019 16:08:16 +0200
Message-ID: <20191021140816.262401-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021140816.262401-1-nuno.sa@analog.com>
References: <20191021140816.262401-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(8936002)(11346002)(246002)(6666004)(8676002)(126002)(3846002)(486006)(356004)(476003)(2870700001)(76176011)(478600001)(86362001)(5820100001)(50226002)(47776003)(53416004)(446003)(45776006)(70206006)(2616005)(70586007)(23676004)(6116002)(426003)(7736002)(36756003)(5660300002)(16526019)(1076003)(316002)(2906002)(50466002)(186003)(4744005)(7636002)(336012)(106002)(26005)(110136005)(54906003)(4326008)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7SPR01MB11;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c094fbb-4a3d-4224-848b-08d7563010a3
X-MS-TrafficTypeDiagnostic: BN7SPR01MB11:
X-Microsoft-Antispam-PRVS: <BN7SPR01MB110AC7DF25C42248D2701E99690@BN7SPR01MB11.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zR178IdzXK7eHerLCMauKEeWxjUFUo+CRrBV4vYaGTS3FIddgr5QkFBThV33dIsJ1gLL2ijvWHHDWThPpev5yRtnLCSH/WqqrXYV+gYfZZRY8NLKZ75l2Pk34tEY4Ma5lsLQKiLlHfJBidhTYjY102E5waN4LUwXtry5ve/5HYVDJKpuMxiy+omPJwrB1pZsTN7vKwvh5NyQ5DpjQJ0U/GQFxtux+m5rDDDemXP3btoZS8vRCT1/IrJ2tylhPxzal47TaQiOEVBOde//qcMihNWsCUx3whB71ppnmv03AosPuGsJ55kUoxHmk/W2bHKFRDggVpf9TW58ngCEPl1ofD05GHAVJqUEKLzUGvkq6ecrD8spfdOUIcO0tjq57Y0XoFJ+FnMf49eGtPNBysP0n5vKiO2PJLGaIgOskpM4FA1bAO+HkDZi59gSL39LqxOf
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:07:53.2614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c094fbb-4a3d-4224-848b-08d7563010a3
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7SPR01MB11
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210134
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Change the regulators id in accordance with b670e44fc3bd.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 sound/soc/codecs/adau7118.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index bf5a5d75f81a..841229dcbca1 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -463,14 +463,14 @@ static void adau7118_regulator_disable(void *data)
 
 static int adau7118_regulator_setup(struct adau7118_data *st)
 {
-	st->iovdd = devm_regulator_get(st->dev, "IOVDD");
+	st->iovdd = devm_regulator_get(st->dev, "iovdd");
 	if (IS_ERR(st->iovdd)) {
 		dev_err(st->dev, "Could not get iovdd: %ld\n",
 			PTR_ERR(st->iovdd));
 		return PTR_ERR(st->iovdd);
 	}
 
-	st->dvdd = devm_regulator_get(st->dev, "DVDD");
+	st->dvdd = devm_regulator_get(st->dev, "dvdd");
 	if (IS_ERR(st->dvdd)) {
 		dev_err(st->dev, "Could not get dvdd: %ld\n",
 			PTR_ERR(st->dvdd));
-- 
2.23.0

