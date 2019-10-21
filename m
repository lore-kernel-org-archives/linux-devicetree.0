Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA824CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3C232166E
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="APbbG7Zn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbfJUOJQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 10:09:16 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:16468 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728098AbfJUOJQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 10:09:16 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9LE7umk018477;
        Mon, 21 Oct 2019 10:07:58 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vqyd6uc1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Oct 2019 10:07:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQVCgIOpKvXGuNbLKuBfUL+FdvzdNCZ8VFzC+i/qmNiIbRBZgqQqha1nm4bWNqFRdPJrWLo0se48X+SLurNKYTG7k61PeKxH4u/5v4XHHqyaZuW13I+lQWXWRdM8kbEYCXKzwzxNLo1p2VgfEitKKFKiNbzV1q8zBDfrDGjPQT/XGy8XMNLUblaQ90o7DDPfVdtF3FlhOy6YHG+WJPfxwpuYnaOtenil6T5iO1zasihv/jFf8Xqm43aoqPws4SvZQ2oCMW23ICy8Dt4KXvM6gQ+gEIHGBU5NlCsO58I9ddBhT6caonTuIAE0L1+rUpsQGN3KTbxs43OvId9VsfLn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwR4opXVca7mRnWp48Rd5AyHjB0VLg8qiiKJ1YwYdKY=;
 b=CgLDIq6UN6YwNTVdI3RnaCoo4N7XtLgjQadgJ3+aEL7kJwaTISRuLmIo5ku1tWn+GJV4tKYE65UxLTgKZaEzfcr2uLxPTW1vQIXrZDDvqvJGjOlSQhme7bM4GWY8I/CEbPqUJs1aVQpqpyEGdbjOFwdOQ/qJk3SzpnTXahiAOeyPyb+EAD5Lnfygrq/dooMQn1yOY9QFb05QbjQfHvgL8Jx+Td6DlyR8qLaxKuaj2GtW4NHyJet1NuGSOXv3oqW9zxXShvKRsFXKEiGGFz7uYLrsgWvd/rFnNXOLCFUOV2QeXCf7gPyakJm7OaLvpiyyvjHIeXGayu/go3EcSWPKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=gmail.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwR4opXVca7mRnWp48Rd5AyHjB0VLg8qiiKJ1YwYdKY=;
 b=APbbG7Zna+5t8Ta0lCqqIVpVbf1u5sDsnaa7yVb1C4G9nW+a2cv+OCPLHlOIvv/JlWKpb1lYXZME1yyDgwVmIGc8tszEmQkYpFtDb5gazYiKWrUIGWSqsns/2aHsC5QF1M9XWfLwyBGD5a4+cJVq1Tytqa5nj3OVW/pbtEslFt4=
Received: from DM6PR03CA0058.namprd03.prod.outlook.com (2603:10b6:5:100::35)
 by BY5PR03MB5267.namprd03.prod.outlook.com (2603:10b6:a03:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Mon, 21 Oct
 2019 14:07:50 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by DM6PR03CA0058.outlook.office365.com
 (2603:10b6:5:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.22 via Frontend
 Transport; Mon, 21 Oct 2019 14:07:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Mon, 21 Oct 2019 14:07:50 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9LE7gqJ013891
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 21 Oct 2019 07:07:42 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 21 Oct
 2019 10:07:49 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] Update adau7118 dt-bindings
Date:   Mon, 21 Oct 2019 16:08:14 +0200
Message-ID: <20191021140816.262401-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(1076003)(50466002)(106002)(316002)(426003)(54906003)(53416004)(5820100001)(8936002)(47776003)(4744005)(5660300002)(6666004)(356004)(70206006)(70586007)(110136005)(45776006)(2616005)(246002)(2870700001)(36756003)(126002)(3846002)(486006)(26005)(86362001)(6116002)(476003)(23676004)(6306002)(966005)(336012)(478600001)(50226002)(16526019)(186003)(7736002)(305945005)(7636002)(2906002)(4326008)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR03MB5267;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ab5f28-0d95-4b9b-e630-08d756300eb4
X-MS-TrafficTypeDiagnostic: BY5PR03MB5267:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BY5PR03MB52674A67CB7FA1B65BC4654199690@BY5PR03MB5267.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZreHuvVK5wlymkFIYl/37E8saJ7nOeoXBvThKOdEaw16qBX1TIPjvIMkpsyCdAG+fO7hzb8Hop2ls0lSXuIsEd9eXfmviBLQwS6oqT+Hx6oBAeQ0n2juffwzomBgfa2FxYYEhcATnDSAEM042Ai1oVlW86X8VY+4DMF2KBKCCU8OQ9TJ6vkYEJH6/J4OMY8J+YM57z1iUtlOolZsdtI7phejZ4Mm93g4QeN+MRZuPv2vZEKV0KhgoVCPpQ9IYwNDt8ucj/Aaos4dnb1xwAkneP64oEBnmN70m1uDv06k/mLJF40CuMRhbAZv5pcfaOiy4zkwyLgfP8hb8WxIjWBNpzYmZFBsZFj8RVVNMkUEjRT5X5xg0DdP2yBpPT9NxNrDNHh3TTg2+nFCo9Qh22lZHhC5WztJzUy4GpUiI1Bw+eaLBg51SsS4xypk8oWM5Rq8ttpSIHacM93RPddoS5bBwu/JDoZyLIpcLj2YaWyd5ZQ=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:07:50.0208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ab5f28-0d95-4b9b-e630-08d756300eb4
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5267
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=799 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210134
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is a follow-up patch as requested by Rob. The dt-bindings patch for
this device was applied before Rob's review. Here is the link to the review:

https://lore.kernel.org/alsa-devel/20191010210850.GA20184@bogus/

Nuno Sá (2):
  dt-bindings: asoc: adau7118: Cleanup
  ASOC: adau7118: Change regulators id

 .../bindings/sound/adi,adau7118.yaml          | 25 ++++++++-----------
 sound/soc/codecs/adau7118.c                   |  4 +--
 2 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.23.0

