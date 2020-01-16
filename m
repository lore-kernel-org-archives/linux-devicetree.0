Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PI_IMPORTANCE_HIGH,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA00C33CB1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 11:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D47F820730
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 11:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORGFT5553580.onmicrosoft.com header.i=@NETORGFT5553580.onmicrosoft.com header.b="XbVA8P14"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgAPLiu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 06:38:50 -0500
Received: from mail-eopbgr1380095.outbound.protection.outlook.com ([40.107.138.95]:48485
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725999AbgAPLiu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 06:38:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RumLsT1Vz4IFzwe6Koj1X9VsG4Q4Q2GRY/J9tC2KYKr8sw/e83GqaJSP2YZU98HDruDjT8YnUyQ0mwlfS7Nk0W725DefM+3e1DGgoFGkXlj2S6bAPowaxg0PMGUV5KhxuNp2My90VYM6q9kO5C9O/XZLeMmZ40wN+DEoYjIa8XW6sWWWBC+Fz8BjZmD01kfqVA+3fhIVb7n4kFERGTAS27F0OKpJWcrGar4AR+xvoqxY76x1NNqL5NapuzjcGpPVCl4MjwgvX68NSnzEju4mD0dBW6lY8Y3L/Hmb+yeXDHd67sHQC00XkSkHmRPHH1UJHT7cU1+a+KVyuTPT7El6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0MmcKB8ErdZr1OYaeaDqFajhH9KIMis02vXGCbfmO0=;
 b=mPvMMYSggODfkmjBNURE0DkoyGpAfZFBvb3RZxxkK0CNnLe41F4ggSwxeF9gW9F70oY+9KUbkqYgZ2JCXD0oZBvv7C2Q7iR4V3tjZZB7hjysFuV45tfKtRqDXXWtZFbvC8nDBgS4RNyWVMca2iidkNYaTe2WiN+0Ndqi/kpp36RLq+Y3R4FoPOCAvSRcumN9xuC4qQBn4qOeBZ5FZkYk61R+K4MD7msRqAVF9kxwmsUsj0FQxehptbgDJMIc82E9zyJhlmUl3Mi0mAE9IeLlNtRNrxX3nKzAhK84lH+PnxCEzKZ1sW7wGmy+KLZkG9vpiodA8Y3+9qK0x02RhcRUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oceanedigitaldata.com; dmarc=pass action=none
 header.from=oceanedigitaldata.com; dkim=pass header.d=oceanedigitaldata.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT5553580.onmicrosoft.com;
 s=selector1-NETORGFT5553580-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0MmcKB8ErdZr1OYaeaDqFajhH9KIMis02vXGCbfmO0=;
 b=XbVA8P14iWezvQ1JNkDmKMjTFLMu1CNbmcDQXcBnWuxEPMzPqIjr5yU5otvSSh3rs7Xgd1XqLXrm/DdAc/Sm2kJGEEXcctRBFgBSC2T726SuedFp+Tr5f9nrh4TOCjkJztzNjPf/Uix4R/9C2FF+OewI7dp8mMzYv7HZuGUZ9zM=
Received: from BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM (52.133.239.87) by
 BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM (10.174.211.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 11:38:45 +0000
Received: from BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7815:ea:4d7e:7f52]) by BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7815:ea:4d7e:7f52%7]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 11:38:45 +0000
Received: from DESKTOPMPN5UI4 (49.207.50.126) by MAXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Thu, 16 Jan 2020 11:38:45 +0000
From:   Brenda Lane <brenda.lane@oceanedigitaldata.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: 2020 Embedded World 
Thread-Topic: 2020 Embedded World 
Thread-Index: AdXMYYHCV0poCW/hRIKbITUmZam+Qg==
Importance: high
X-Priority: 1
Date:   Thu, 16 Jan 2020 11:38:45 +0000
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAMeItoodLbBEhAG+Fnluak7CgAAAEAAAAAwC77gZLpBMjdhEyFtkuhUBAAAAAA==@oceanedigitaldata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:76::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brenda.lane@oceanedigitaldata.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Microsoft Outlook 15.0
x-originating-ip: [49.207.50.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e7723e7-fa26-4336-5f0e-08d79a78a548
x-ms-traffictypediagnostic: BM1PR01MB0932:
x-microsoft-antispam-prvs: <BM1PR01MB093254ED99B343107D7F1B60EA360@BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(346002)(136003)(39850400004)(199004)(189003)(26005)(2616005)(66556008)(66446008)(64756008)(956004)(36756003)(2906002)(186003)(16526019)(66476007)(86362001)(55236004)(66946007)(44832011)(6486002)(1006002)(7116003)(508600001)(4743002)(8676002)(81156014)(8936002)(5660300002)(71200400001)(6916009)(52116002)(316002)(81166006)(4744005)(6496006)(130950200001);DIR:OUT;SFP:1102;SCL:1;SRVR:BM1PR01MB0932;H:BM1PR01MB3362.INDPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: oceanedigitaldata.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4msnF/oQDk2FjXm8HDMLA6BcJqHgGFRbAI0s/pE+R9ouMryjG8ciGLd5OsDCNoZrW3ndHhFgF2V1+XiCZ/9DgOcmLOf6mU8j/gYAk5qqY8mYBwQRjixl4m/9kSLo+OWgzejCosYaDIqWsz+Q5dZzzmmfYlG77xFIExeknoO/B+3vQy/6xa6D8eeE6YGYpINsJ4Ao8lXN5N88ZjwDMJOcNOjDT/5KeFDhcbqqbb1qfKxN+GhZQRP50p//18lBxv4rUadfibLPw4YSTOVRJuG47fh0xOfmQpE6L9ogcfAWCyV+/F2DmI3KxHxdJrX+7XU6BWkGekJkoLtqZ7cDXPaW8xUtXnzrp+ILD2lVR2qFvZkYHQTf2ANQK73cDHLfH5dwDjV0DE/4PQKWsLREyTeNuuPNEuDz6HeaatediRKOQGb6VitjfEcKlLi7FZAxdFvnxNHsvbVwVSTbHTOsaldqRzjZN1Wi45UIDKVqrJydEqQnTI1bh+jaKIzDTMoXQll
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34F212BCF249A543AEFA5EFF8E258BC5@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oceanedigitaldata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7723e7-fa26-4336-5f0e-08d79a78a548
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 11:38:45.7380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d88f05e-781c-4247-92e4-bd9439b8070f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exuSGWJLa5nCzM7fhZ/VxzzAI7kQadWqKJadomuUY6z52DIAhm5eKQzvqMvdoSqLcvVhn1qv9P3nztcjdthnrHfMvGMk0mIV4N6wETuqzspwcBYuFk7u3bkKhaVr+KRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0932
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

I'm wondering if you would be interested in purchasing Embedded World 2020
Attendees List.

Target Audience: Electronic Systems, Embedded Technology, Embedded Systems,
E-mobility and Distributed Intelligence

Venue:  Nuremberg, Germany

Please let me know your thoughts, So that I can send you the Number of
Contacts available and the Cost for it.

Best Regards,
Brenda Lane
B2B Tradeshow Specialist

If you're not interested kindly reply with the subject line "Opt-Out".

