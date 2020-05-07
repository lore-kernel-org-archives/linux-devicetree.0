Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1359FC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE1B220659
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hiGkxGRg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f2DfcA41"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgEGQDV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 12:03:21 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51220 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbgEGQDP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 12:03:15 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 46BC5401AD;
        Thu,  7 May 2020 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588867395; bh=DA0L3msOnqGzByJexYlqIFGDMzEM2mMJGgyjyc1fkOs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hiGkxGRgoIu7xzXAa9WThnWbQVS+vMKk+Q22yLAsu+zdkCC3mxwAv41L+CaAM+E6N
         BFeSibTm/8g/GT25Da1XdVSfhx04M3IVzWpz0IlbvsSoa0Fh42qIvPyJBYbEnU/DXM
         l08ZNN3eeMp3dtap8FrnZXFSOBxNCQNNFZYGSFAG65ZrnRfcy9UIvzrxjPaO+VhzQd
         QltSdcxgVu6HMA5z4Yq4IUKib0GjU4TrY3U65NqeNVJxjzkuBgkMqWZ7yOQy5ejc1t
         YSZWEJuv6HphUEHCNk7UWGfdv1itQqnN9z/6srDz5gxtdjfrBffaytkEZOJlqsOVU8
         2zFpAsiVHMOjg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 834B6A006E;
        Thu,  7 May 2020 16:03:14 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 7 May 2020 09:03:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 7 May 2020 09:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOzRUusIgD41l1/M1bCDTJ2mdG1gOGB/Y8zEGRzU7fgCEP+GjxHZuub4IVPofLaSpK2hmwGwyDoH1Oq4GU4EU0WHsA5nqXAUsttmkyeRzW1IREjUiJHgRAS/sMZPgaXacX/9Y2SF9F6EkXAHtJyfcpdSAaZgbQhKl9UcKcsQUUvNMeFbHvx46cOpzlJ6+iWztAmFdhylfKja+h0b/Lpzh3022iIU9Dayhx/68xg7Ji/GSUZYRGo3/ko2zLzCyHhjDtmxmuht8wP3MmrUtiSDsWfk97E2OiuRgDEG2H0Kk36qnupT67SBoZO/bNBmVqy8NmKr+A+WlAEd2nU6MwuyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA0L3msOnqGzByJexYlqIFGDMzEM2mMJGgyjyc1fkOs=;
 b=PyAaLDcs6cURNnSdhlU8oVPABUmhjm33Zyqbd3rgVpJUxT/Brl+Uk+2aNfqfexHh3zGKIUSqWuuFMTfUmYGVZAunOTgaWsuVq3+CmK7GAc/s68AiXeghlN7T84RepmJBSCtYZKGJMKe/q0sEVjJVIvs7kZKUMV1g8epJ31CTrCUWT2D3xAbJbKLn0t9CuiB01rKE1yYeoFHnAPSAcdJN5iYYFoHnExRWMtNT8HvJy6bFD9U02IAO291NW6ZZY//Z4gpXgXXFujSyuGs+bRXfC4sgBAIWagRHWv7ocPdsS3Q/XUHoj6iIcONW1CiyHevXJlMNEorM8wPzYBbGRyMA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA0L3msOnqGzByJexYlqIFGDMzEM2mMJGgyjyc1fkOs=;
 b=f2DfcA41ID+JI0EmGVUPv8li5v/318qCwHbf2Wvb7Hj0h+I+5W3HtNER6yf4o01DLyD0R2ZYp37aBOVLBfwNWwURutIpQrkb69D7jy7V7XM9eh4vSdxE6dGk1qhApdHFpiBS59H/hNeAhkrn9yy+SV+H4bRl8eEssASe/gkV5cg=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3973.namprd12.prod.outlook.com (2603:10b6:610:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 16:03:09 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%5]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 16:03:09 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG trb
 cache size quirk
Thread-Topic: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG
 trb cache size quirk
Thread-Index: AQHWF8IOTUVfYLHIw0a2UHIrWHIpCaiblsoAgAFLsIA=
Date:   Thu, 7 May 2020 16:03:09 +0000
Message-ID: <b8da2b82-b230-3e50-5c6b-95d4536f2523@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
 <20200506201558.GA15090@bogus>
In-Reply-To: <20200506201558.GA15090@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.49.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f39229c-ae34-4d28-21a4-08d7f2a0235c
x-ms-traffictypediagnostic: CH2PR12MB3973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3973E15DB4B96DDB8FEEC45CA4A50@CH2PR12MB3973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GLBxzUyugOEh+jB9pYKwxSn6+OMdgtdHcMo4XYvCQBmW8FgML4W+mLv+D6uZRZpQHtX09belQQas9z2jCWrFztl6+fpPRkidpErhL4dF1OsW+jiB1EuLUKgTzPdCXThzRIVBcS1611pjVCOlt1tVwQ4RLyP2v1ye4kYRwh8FdTnzTlFdLeRcivibkSwiKNB9qIVzVDqgeXb4PAc+vcyMIxZx+ZcWGKOKkR4evtaNWTAa8BSYTa4u+PQjym0bc/N04JFswC2s4+/rYSXesKZPFONttFhzOqm9QiNKY/Uq+vy/DjrFi376hdOCaZd1Mwr+/FxCKo8nQlqJldaL8E436Id8r6eEusiJkATE3nAtgPIk2IiDyxVji7/csAWCZYkswv8s43CmveLVojPpLrZcCSbAGAZ1AkHG0YRRqIh7eyi28jW0sDX3TK+JUP6yRCdXG8IyHnLxUhoXggXbELDcPzFG6xJnvSRM1L2szyjG8sQVZ3IT255uAdIDcZ/djOVE4o+CAlLBE/6lGugoaeQlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(33430700001)(71200400001)(110136005)(54906003)(2906002)(5660300002)(316002)(66556008)(478600001)(66946007)(66476007)(76116006)(91956017)(64756008)(6506007)(8676002)(2616005)(55236004)(186003)(53546011)(26005)(6512007)(66446008)(107886003)(4326008)(83280400001)(83320400001)(83290400001)(6486002)(83310400001)(31696002)(86362001)(31686004)(8936002)(83300400001)(33440700001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: seXNYgzHqNQAthj8K0HAlV4hsthyZ9BY1AFK3BG4OZQ9Yy8o6yOPJL3ynUSS4E19Zbh8htcRACNbfI4HOh6rqQ/KaskoG5qfwvJs2oYX41pzJufu7H4zRJnRk89+6aAwsD5U8xBE836YLTn39AtqnhwLlm6cT8DAORAPfLkrncqmqbdmk8xTDT+hZvcYh4/8IG4pfcDA/n1JtmozhV5pWx5jDSmtJ3fDMz0MjLdmNqn8eU45wyScjj2/YB6x1BCEFnKq2mgdB2S1KDf2kShBEA+1wDrMA8PZfxChCOxZpXxIIjbc8HLMQuVpfQc+QLLpYgNuGBk5cFlIHJAGm6mZywjGxYy+e3wKKPmj/RHjFhYjEvRUCwRbrczaiY5eAmb5NO67QzlyfR0N37TMo0W2vWzj8OouEMiR1jm8yik7ZPfmgz2+28OzDj/ZgZgnenZWtpzrmLSwZJJCSFPepSQHG2j+kPwtNWmsmdMAJu2r9AZGCDcNPgdfy7JiXCpcOPMVbi5VhoRTBEStB1ZR83HX6JDBOe4gM/kSoSkL+qN/t1s+G+r8/ykslu6MffstLHfCkW4aXqVIBtTwjPrf6MOyCzAtg+HckOMVSHCOnplDwrBoI2nHFpsb9dn8BPaC1LjW+p/M99zdvR4vhLSmzjnMkWq/Whngmy/Rj7fbUg6ijKY+ziXlI3825tGa/E4ziv2eXuiBfvj13bZb0D6IuikZBfEl2JvumcSyWRNLHaavqKBTWdWDT2hfIkcVf6znJYYWwEtQJ1oCjuvxdR7rf5tYk3BlpbkvluOL2hFE0aua4vs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF56F6C4D603AB42AAE96FD22C47FAC0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f39229c-ae34-4d28-21a4-08d7f2a0235c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 16:03:09.7347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tg2fpytfVDcQpGdSh/y2h0faImE1PhcouHjTMJNkYzzpEY30LGwkvy65kBmZY+32WnrZHouJbMSJSOFV6R4W/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3973
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQpPbiA1LzcvMjAyMCAxOjQ1IEFNLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gVHVlLCBB
cHIgMjEsIDIwMjAgYXQgMDM6MTg6MDlQTSArMDUzMCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+
PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBkb2N1bWVudGF0aW9uIGZvciBzZ2wtdHJiLWNhY2hlLXNp
emUtcXVpcmssIGFuZA0KPj4gc25wcyxzZ2wtdHJiLWNhY2hlLXNpemUtcXVpcmsgcHJvcGVydHku
IFRoZXNlIHdoZW4gc2V0IGVuYWJsZXMgdGhlDQo+PiBxdWlyayBmb3IgWEhDSSBkcml2ZXIgZm9y
IGNvbnNvbGlkYXRpb24gb2Ygc2cgbGlzdCBpbnRvIGEgdGVtcG9yYXJ5DQo+PiBidWZmZXIgd2hl
biBzbWFsbCBidWZmZXIgc2l6ZXMgYXJlIHNjYXR0ZXJlZCBvdmVyIHRoZSBzZyBsaXN0IG5vdA0K
Pj4gbWFraW5nIHVwIHRvIE1QUyBvciB0b3RhbCB0cmFuc2ZlciBzaXplIHdpdGhpbiBUUkIgY2Fj
aGUgc2l6ZSB3aXRoDQo+PiBTeW5vcHN5cyB4SEMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgSm9nbGVrYXIgPGpvZ2xla2FyQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gIENoYW5nZXMg
aW4gdjI6DQo+PiAgLSBSZW5hbWVkIHRoZSBwcm9wZXJ0eQ0KPj4NCj4+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0ICAgICB8IDQgKysrKw0KPj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLXhoY2kudHh0IHwgMyArKysNCj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4gaW5kZXggOTk0NmZmOWJh
NzM1Li42ZDA0MThlZTRkYmQgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+PiBAQCAtMTA0LDYgKzEwNCwxMCBAQCBPcHRpb25h
bCBwcm9wZXJ0aWVzOg0KPj4gIAkJCXRoaXMgYW5kIHR4LXRoci1udW0tcGt0LXByZCB0byBhIHZh
bGlkLCBub24temVybyB2YWx1ZQ0KPj4gIAkJCTEtMTYgKERXQ191c2IzMSBwcm9ncmFtbWluZyBn
dWlkZSBzZWN0aW9uIDEuMi4zKSB0bw0KPj4gIAkJCWVuYWJsZSBwZXJpb2RpYyBFU1MgVFggdGhy
ZXNob2xkLg0KPj4gKyAtIHNucHMsc2dsLXRyYi1jYWNoZS1zaXplLXF1aXJrOiBlbmFibGUgc2cg
bGlzdCBjb25zb2xpZGF0aW9uIC0gaG9zdCBtb2RlDQo+PiArCQkJb25seS4gU2V0IHRvIHVzZSBT
RyBidWZmZXJzIG9mIGF0IGxlYXN0IE1QUyBzaXplDQo+PiArCQkJYnkgY29uc29saWRhdGluZyBz
bWFsbGVyIFNHIGJ1ZmZlcnMgbGlzdCBpbnRvIGENCj4+ICsJCQlzaW5nbGUgYnVmZmVyLg0KPj4g
IA0KPj4gICAtIDxERVBSRUNBVEVEPiB0eC1maWZvLXJlc2l6ZTogZGV0ZXJtaW5lcyBpZiB0aGUg
RklGTyAqaGFzKiB0byBiZSByZWFsbG9jYXRlZC4NCj4+ICAgLSBzbnBzLGluY3ItYnVyc3QtdHlw
ZS1hZGp1c3RtZW50OiBWYWx1ZSBmb3IgSU5DUiBidXJzdCB0eXBlIG9mIEdTQlVTQ0ZHMA0KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLXho
Y2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2IteGhjaS50
eHQNCj4+IGluZGV4IDNmMzc4OTUxZDYyNC4uMTRkOTAwNDc0ODk0IDEwMDY0NA0KPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2IteGhjaS50eHQNCj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLXhoY2kudHh0DQo+
PiBAQCAtNDMsNiArNDMsOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4gICAgLSBxdWlyay1i
cm9rZW4tcG9ydC1wZWQ6IHNldCBpZiB0aGUgY29udHJvbGxlciBoYXMgYnJva2VuIHBvcnQgZGlz
YWJsZSBtZWNoYW5pc20NCj4+ICAgIC0gaW1vZC1pbnRlcnZhbC1uczogZGVmYXVsdCBpbnRlcnJ1
cHQgbW9kZXJhdGlvbiBpbnRlcnZhbCBpcyA1MDAwbnMNCj4+ICAgIC0gcGh5cyA6IHNlZSB1c2It
aGNkLnlhbWwgaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5DQo+PiArICAtIHNnbC10cmItY2FjaGUt
c2l6ZS1xdWlyazogc2V0IGlmIHlvdSBuZWVkIHRvIGNvbnNvbGlkYXRlIHNnIGxpc3QgaW50byBh
DQo+PiArICAgIHRlbXBvcmFyeSBidWZmZXIgd2hlbiBzbWFsbCBTRyBidWZmZXIgc2l6ZXMgZG9l
cyBub3QgbWFrZSB1cHRvIE1QUw0KPj4gKyAgICBzaXplIG9yIHRvdGFsIHRyYW5zZmVyIHNpemUg
YWNyb3NzIHRoZSBUUkIgY2FjaGUgc2l6ZS4NCj4gDQo+IFdoeSBkbyB3ZSBoYXZlIDIgZGlmZmVy
ZW50IG5hbWVzPw0KPiANCkkgdHJpZWQgdG8gZm9sbG93IHRoZSB1c2IyLWxwbS1kaXNhYmxlIHBy
b3BlcnR5IGltcGxlbWVudGF0aW9uIHdoZXJlIGluIHVzYi14aGNpDQp0aGUgc25wcyBpcyBub3Qg
YWRkZWQgdG8gdGhlIHByb3BlcnR5IG5hbWUuIFNob3VsZCBJIHVzZSBzbnBzLHNnbC10cmItY2Fj
aGUtc2l6ZS1xdWlyaw0KaW4gdXNiLXhoY2kgdG9vID8NCj4+ICANCj4+ICBhZGRpdGlvbmFsbHkg
dGhlIHByb3BlcnRpZXMgZnJvbSB1c2ItaGNkLnlhbWwgKGluIHRoZSBjdXJyZW50IGRpcmVjdG9y
eSkgYXJlDQo+PiAgc3VwcG9ydGVkLg0KPj4gLS0gDQo+PiAyLjExLjANCj4+DQoNClRoYW5rcyAm
IFJlZ2FyZHMsDQogIFRlamFzIEpvZ2xla2FyDQoNCg==
