Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC978C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 830702176B
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YmiMwWrZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ccVi11bT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgGUFBT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 01:01:19 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42256 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725294AbgGUFBS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 01:01:18 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1864C008A;
        Tue, 21 Jul 2020 05:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595307677; bh=7ZXk723N8ZznFHwj/eX4mSs0gmVcyPW0u8fgzgqbnus=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YmiMwWrZxZ1msD6nMlOSnQrQlwIZ+QwjykvRooI1vXEB8TRDABUx4bkWuKn7GrcL7
         TUXPCNGCq42qxbW1U49gGavEDpWx9uwg/DVrtNACt+Ivzh1u+yfRx1BPMTevmzgdHo
         mvz8JC6Qf1Qb85SG20Csx3jKCZBJos0w4QqVGt8s3sH+UbHPXd/FDd5R/zlh7QTHYP
         9jqTU3AbXMUXGDSWrTBUguBek1L2fbU1AZ4ZtB/K0+KAMJ1zQB5Yo/v2l90kyWH99S
         uxdRCg/aHN7lb+JAlvA30fF1J63aypdcpcKfm5aSqTJ6OrCumEDKwCMd7P8YQP5Gak
         AZhQMYPmzqnIQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 03853A005A;
        Tue, 21 Jul 2020 05:01:15 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7FA49800CC;
        Tue, 21 Jul 2020 05:01:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ccVi11bT";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMU2iVU7H/kgOvetD4Mb5ToM8di2xm49iudWybKdWQukVAnD94Iyo71msupqtkfLZkaysLK2GRwq+0pwPTmMvlJG+nVYvfjVV+RLniIHNfkEdyhDrqxj8o+ysyH3NFNxqFM3KaLnFd2NK7bVhO1Fi/EIfRHXSlcFBEnjHZ7q7WldBMO5NHhiLkXi5kGcYyvz8+8zlkOUClhJVbGK0KVpV29R94p/FFdO8TTKmDT6vgj9HMz0GLkzoOU1nV/yqB+8SEzCuYiWpEGNytz3DFHwSis76IheS0UjG0BSUkuNjOCOSAfTq4S9fKpxsNX1K/8BEw9Iw9EQYsEWWfeaiSMq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZXk723N8ZznFHwj/eX4mSs0gmVcyPW0u8fgzgqbnus=;
 b=con/BQabu+nXmcjyEDQ0i2+d9GzCZ70n8D77XZPWk6uDKjAChzHxo6KBqTeHM5614ZN7tJs4P3OUxZa0E17c36iBlyapJcQIxwwkADeeLFUpxFgL36zvnP8Wr1nCE+NIUC6ITzTKnDK/MQVy7xmykIQU9hee1kv9COMZ0qRqxKZHOLXRTOjMKeuMOhVtYX3rttpHS/S1h5/53xqMLI2bCJsJlIENLUMCqPI43VWlGIJ54iIAEKgSgeDIHUsMjkeHwdvQTjsX2os7IdvM7efAFicJLtYNUC0bdi5E5Dj2/vQ9b9nMNluE8j2/PzJq4nb72TJhy/Y8h5az1yaXknWpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZXk723N8ZznFHwj/eX4mSs0gmVcyPW0u8fgzgqbnus=;
 b=ccVi11bTsJ0t3HGHXL96wTU/yg+4t8MqxE4tFYAI5lSIo+s2g410qBRhQLR6SObDaMEJ7zBlNEkfZo7CBAy29+InTkIv4We4FOHJDCrwddDpbXXsnc+8Nzb+0SL9sadh7tBnXHH4hEvINqQIzuNafEAlr49BvJMxgLkAR7ytxPQ=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3874.namprd12.prod.outlook.com (2603:10b6:a03:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 05:01:12 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 05:01:12 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Topic: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Index: AQHWW7xVn29tfo9/DkKD4yu8ygVtF6kRaYEAgAAW7YA=
Date:   Tue, 21 Jul 2020 05:01:12 +0000
Message-ID: <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus>
In-Reply-To: <20200721033908.GA3508628@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8ea21ef-3996-466d-0a8f-08d82d3316cc
x-ms-traffictypediagnostic: BY5PR12MB3874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3874EA166EA827EE4CC4AB7BAA780@BY5PR12MB3874.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M677x6Yx63DCik7b8882OzJdC0S7L9ggUe+cQsAmQvLjLOxNHmQpTNpKFQvK/x87AfwJMLAgdu5LfXoecHcvDUZSYEvYkZzzX2bOd7GfE0P8SBvQHQYE6qlrYC5aD9KHm88Bmyn8V/WGi5zvuF91v8XGS8JxPXze/4Ok2MYXyuzkqYooyQvnm1Bs6cMJVEiUTB4iwPWoew4coKIqHRMp8p52rTNmoyGxbOCv5eM4BsmwOyNFcYGS6lTlvvlRTT7bk0WkuWLkrUSBDrjnTwHZws2mI5XNcg5n2R9c3Rrt9ooUR/OHKhTxDNjim7rH4ySE99eUb7bYQCYDIDgsCmb7F4jXzREoGEt1VzZcOQhSKH6G7DmCDSxmyTcliblDz1o6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(346002)(136003)(376002)(366004)(2906002)(110136005)(8676002)(54906003)(316002)(5660300002)(478600001)(6512007)(71200400001)(64756008)(86362001)(31686004)(66476007)(66946007)(2616005)(76116006)(26005)(6486002)(31696002)(8936002)(107886003)(66556008)(6506007)(186003)(4326008)(36756003)(66446008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: LnxhuYjrl8MCFgRjD5m/d+YcXL7Zc6k6HmOx3qBIF0tEz1yowKuTfshyVrC73ri4fKQ7u8YcVI/0HQ6LVG3d05sldoKsmCOa1cHXVguljmpytZ5m3nfboojgT5UZ6/AgpgMtnkCfWxb9eaxBcUl1U7D+/x8SGDD4FU4S8S5zs0RUIo49ti9NGErdPi5vsaKcX39pYHuOSZ+DD1gpu8TAM1R5yY8m+W55ZdwoPhhgCXjlAVx1WPBqtMDr/TgZme+pD6ic6aNUc/qR4f773Nf6usRFgOEO3VZc8UErKQiLcok35YogkudtlqbsnoMy6m28IsdavDLDrnOvmOhrcIYM0pCX5TFzkcYAubaUN+o4x5chXK2VT5rgvyS5/k0tM3g0TyimwSsAlR+B7OQmnYjDVHZ510Q5NthPxjxAj6f02RuLq10zhBjTIWPeJlYExsG4Sh0CGmtgpVcEPJHFSO74jv258NSvR082FSzc7HpISHY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C52CE87183CC484FB872E40582AFD84D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ea21ef-3996-466d-0a8f-08d82d3316cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 05:01:12.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2P+fCXvaBYdZuBcdC5lxsIJ1Hn4MMFTTA5gy0hSVTnd+ngU4FP7YYtsBMRtFvke6eI87MpSnJ81dtt5PsuFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3874
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDAyOjU5OjA4UE0g
LTA3MDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEludHJvZHVjZSBudW0tbGFuZXMgYW5kIGxh
bmUtc3BlZWQtbWFudGlzc2EtZ2JwcyBmb3IgZGV2aWNlcyBvcGVyYXRpbmcNCj4+IGluIHN1cGVy
LXNwZWVkLXBsdXMuIERXQ191c2IzMiBJUCBzdXBwb3J0cyBtdWx0aXBsZSBsYW5lcyBhbmQgY2Fu
DQo+PiBvcGVyYXRlIGluIGRpZmZlcmVudCBzdWJsaW5rIHNwZWVkcy4gQ3VycmVudGx5IHRoZSBk
ZXZpY2UgY29udHJvbGxlcg0KPj4gZG9lcyBub3QgaGF2ZSB0aGUgaW5mb3JtYXRpb24gb2YgdGhl
IHBoeSdzIG51bWJlciBvZiBsYW5lcyBzdXBwb3J0ZWQuIEFzDQo+PiBhIHJlc3VsdCwgdGhlIHVz
ZXIgY2FuIHNwZWNpZnkgdGhlbSB0aHJvdWdoIHRoZXNlIHByb3BlcnRpZXMgaWYgdGhleSBhcmUN
Cj4+IGRpZmZlcmVudCB0aGFuIHRoZSBkZWZhdWx0IHNldHRpbmcuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4gLS0tDQo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgfCA5ICsrKysrKysr
Kw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+PiBpbmRleCBkMDNl
ZGY5ZDM5MzUuLjRlYmEwNjE1NTYyZiAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+IEBAIC04Niw2ICs4NiwxNSBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOg0KPj4gICAgLSBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3Rt
ZW50OiBWYWx1ZSBmb3IgR0ZMQURKXzMwTUhaIGZpZWxkIG9mIEdGTEFESg0KPj4gICAJcmVnaXN0
ZXIgZm9yIHBvc3Qtc2lsaWNvbiBmcmFtZSBsZW5ndGggYWRqdXN0bWVudCB3aGVuIHRoZQ0KPj4g
ICAJZmxhZGpfMzBtaHpfc2RibmQgc2lnbmFsIGlzIGludmFsaWQgb3IgaW5jb3JyZWN0Lg0KPj4g
KyAtIHNucHMsbnVtLWxhbmVzOiBzZXQgdG8gc3BlY2lmeSB0aGUgbnVtYmVyIG9mIGxhbmVzIHRv
IHVzZS4gVmFsaWQgaW5wdXRzIGFyZQ0KPj4gKwkJCTEgb3IgMi4gQXBwbHkgaWYgdGhlIG1heGlt
dW0tc3BlZWQgaXMgc3VwZXItc3BlZWQtcGx1cw0KPj4gKwkJCW9ubHkuIERlZmF1bHQgdmFsdWUg
aXMgMiBmb3IgRFdDX3VzYjMyLiBGb3IgRFdDX3VzYjMxLA0KPj4gKwkJCWl0IGlzIGFsd2F5cyAx
IGF0IHN1cGVyLXNwZWVkLXBsdXMuDQo+PiArIC0gc25wcyxsYW5lLXNwZWVkLW1hbnRpc3NhLWdi
cHM6IHNldCB0byBzcGVjaWZ5IHRoZSBzeW1tZXRyaWMgbGFuZSBzcGVlZA0KPj4gKwkJCW1hbnRp
c3NhIGluIEdicHMuIFZhbGlkIGlucHV0cyBhcmUgNSBvciAxMC4gQXBwbHkgaWYNCj4+ICsJCQl0
aGUgbWF4aW11bS1zcGVlZCBpcyBzdXBlci1zcGVlZC1wbHVzIG9ubHkuIERlZmF1bHQNCj4+ICsJ
CQl2YWx1ZSBpcyAxMC4gRm9yIERXQ191c2IzMSwgaXQncyBhbHdheXMgMTAgYXQNCj4+ICsJCQlz
dXBlci1zcGVlZC1wbHVzLg0KPiBUaGlzIGlzIGFsbCBjb21tb24gVVNCIHRoaW5ncyBhbmQgc2hv
dWxkIGJlIGNvbW1vbiBwcm9wZXJ0aWVzICh3aGljaCB3ZQ0KPiBtYXkgYWxyZWFkeSBoYXZlKS4N
Cg0KU3VyZS4gRm9yICJudW0tbGFuZXMiIGlzIHNpbXBsZSwgYW55IG9iamVjdGlvbiBpZiB3ZSB1
c2UgDQoibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzIj8gT3Igc2hvdWxkIHdlIGFkZCAibGFuZS1z
cGVlZC1leHBvbmVudCI/DQoNClRoYW5rcywNClRoaW5oDQo=
