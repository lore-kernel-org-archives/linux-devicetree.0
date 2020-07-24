Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B911C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 00:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0F53208A9
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 00:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QKd+p8Y4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vw5BpkVK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgGXAPv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 20:15:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38850 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728065AbgGXAPu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jul 2020 20:15:50 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27F1C405B8;
        Fri, 24 Jul 2020 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595549750; bh=iLKH3U0AWCFKTbDX2ohnt0oMb2RFnKQtEk6doF8INUA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QKd+p8Y4lLdcin4lP+Ji6xsVPZpo1gw7+IGrxBwG/j3sZM1jB6EqTlLRdUkgzF7Wm
         W23aKD+ZWk3hy1EQYnTEEYEbCPFi5T0EKcPkihslThvMzj7xy0hj/U+/MkiUZZsoha
         +8ZTwxFG64QLb5WwdWjzoyp6OXtQ4UJNpZyEdne6VZxp0d3GyDuWSdLHwe/F69TwOy
         lbyunFaHUh4ZUmTGpI2TFkk1ISUFL0d1UdaN5aZNsjcscrkX8NXNIXqK70nBMOo1ER
         IOqC2e/TtIh2mQsVCO8grsrJx2Rk/w7mImHRGl+s8vfxFVYSBCzPExnFmhLsnyoFm3
         0VtJiXqTS3j0w==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7D83AA0255;
        Fri, 24 Jul 2020 00:15:49 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 60B13801BF;
        Fri, 24 Jul 2020 00:15:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vw5BpkVK";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXyH7owN4m2fYDLBSg08jt1P0uqL36k3xWZyOJ1pw+Vfp8cwDxzo6ZOSee4tA3EM848YdDzJwgMMe9U/PZS38ydiTxrivKBcMTrjGv2S5LekccFFoZrbzwzGPv22/5NDAHpQxWVehT4ODbtk7Pg7uAR46Ze+1XVj8EwVcUYw981niq0O0AYwXQ+PR6xYdCBDERqYoh0XksJHHKUz+SZcUXuCkx89tDV79e++uQb4qFtvbmGmY/GI3QSEMlNcPMS7T/tBx0UTrxPzqjFDiu9wvQ0w/0Va/xwc0J+JNn+Miq7CdXEpwREWCDZRDijN+T804BFkpPbXToIRt/4RPpAFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLKH3U0AWCFKTbDX2ohnt0oMb2RFnKQtEk6doF8INUA=;
 b=UmvS6HVJ49NbhpUL3/u+yvKpijmq0n3U3HSGnm4bo64fKyiOqipJU1nf9UMT4YLfFUe1xDtVNGrP4gFg1rUS0+oAGNVmkSj+yr+xVDrdOS+/nvmFoMg5JjPwpmJI7chIL3P6JmTpEjzJxZfq+WGgsm2wWvfj1IRAlEZPAEdAGUGd8VIU7ra5rVhof5XRd9JjZdkjlw9gvQS5axd1ZEq6vyRjQcUiDggue9JOKbrqmlzLml72+1+kHql50kbWmK6okxrh905eqcz/kwXY1nj8kWNBKdbDs01oL8w0IGGfwRGXB55FlcG/M2daudhXkW4HbcmpVf307FScNO/LxI0ZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLKH3U0AWCFKTbDX2ohnt0oMb2RFnKQtEk6doF8INUA=;
 b=vw5BpkVKFqMN3eRf93P8mcbYcQ9PyJ0OxPBFQQmHYLKCwp3YrbFyXfAuLOM0U6NWUAa/180euIRML0yrsIfEwalAMQ5VmbPEigFmquQWbpqL+TgEk7rOK+uqJN51ylS7b61zPgX8MdKMWp+ByIAPqVKYPw4+z1TqfKPbsi0UOOo=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN8PR12MB3187.namprd12.prod.outlook.com (2603:10b6:408:69::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 24 Jul
 2020 00:15:45 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3216.020; Fri, 24 Jul 2020
 00:15:45 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Jun Li <lijun.kernel@gmail.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>, Li Jun <jun.li@nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWNBOcKSGY3EC5WEe37t+laBwpCKkVUfKAgADlCwA=
Date:   Fri, 24 Jul 2020 00:15:45 +0000
Message-ID: <3dec20c0-6fd3-ff40-091c-93cb093a2ff9@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <CAKgpwJX6awJeqVsa_3mX_+UbhC+3ns=dLeiXBz7Na5QkQRZpjQ@mail.gmail.com>
In-Reply-To: <CAKgpwJX6awJeqVsa_3mX_+UbhC+3ns=dLeiXBz7Na5QkQRZpjQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd1aa8b4-785b-4431-4f5d-08d82f66b5ca
x-ms-traffictypediagnostic: BN8PR12MB3187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3187BE428A65A90E47CCBC22A4770@BN8PR12MB3187.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h70WCG0M+kuihYlU8jGf6nEzDkfug+X0y1GpQCNzNlkr0Tb+k52Rk9mwCoIxFPjSPZtcZWvXM4mx50rV0bDB4PXrSpG/8qjYO2qkkO6NA/5lZy3qbnQ3c7Y1LdMstytACyWiPr9DLMymp8TjTnrEzY5GnSJ8LyBCebazA1whc1JyyfcYymFYp77QPr186Xl+dWIiizmSayq1eta+4zf00/lCrG7sH96pAX+Im4/kOf3dTDweQWiFUzx/DsbuvrPVS95MI4c6Hk53kRoccskGk0ivYcdL6r8p8oKgjjizN+LISfErhCbNgBNU0VzgspaY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(366004)(136003)(376002)(396003)(346002)(86362001)(478600001)(55236004)(91956017)(5660300002)(71200400001)(53546011)(107886003)(6506007)(54906003)(36756003)(110136005)(66446008)(2906002)(4326008)(6512007)(76116006)(66476007)(66946007)(316002)(31696002)(64756008)(31686004)(66556008)(2616005)(6486002)(186003)(83380400001)(8676002)(26005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Wphe2bibTQjHuTMA9vYWNQYOka+IFIFpI7xcHPTf7hFYt0z5YPlDBhbktB32gV1UhJBCrdr5OPehYArpqioJ80TSoucEZhW6aC6tzcKLHdJbtMSPTCi8pocMzkyOnuYnRuk2BG+1Xuy/jqNGEt6eK6lQdAf3CfCkJ5eK973WtRXeU/G6o/5Z/QGFn+6R7u49g/jiOnzgoBvn3e4POVqyZga98teN3M3oetr4kETkMZTqEjPkU5/SKZZe0NXPPfgF8K3x4ZfYyIQquDIDT9+z/nCD/vdJbUQvqwXc+OyjA3EecyAeNCh8joQcFGRJHvngoARqlVgDuhBeL80MpITce+vr7B7JqBLvRxZYOyDtkBgMrxLdPCS3OzVltve2iWzksthqwzfskh7lNxVphnMql88WD/tB4XxhyCviYwHWDqF7Qs0YqR5YxQPGAj4VHqYm6GEmDPav3LuxWlDVurB775+lXwZaQ7H9zEEUlRyxlRY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E918CC2E25A4A4D9390468233F22653@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1aa8b4-785b-4431-4f5d-08d82f66b5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 00:15:45.4160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXeS8EkjP86gH1yG3px//YpCmjf4P5tFWaKBT6IhYPMkNz6qVDY2drEXELaHobEaK9tb9LIrWIwD/qs1UzAgVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3187
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGVsbG8sDQpPbiA3LzIzLzIwMjAgNDowNSBQTSwgSnVuIExpIHdyb3RlOg0KPiBUZWphcyBKb2ds
ZWthciA8VGVqYXMuSm9nbGVrYXJAc3lub3BzeXMuY29tPiDkuo4yMDIw5bm0NeaciDI35pel5ZGo
5LiJIOS4i+WNiDc6NTTlhpnpgZPvvJoNCj4+DQo+PiBUaGUgU3lub3BzeXMgeEhDIGhhcyBhbiBp
bnRlcm5hbCBUUkIgY2FjaGUgb2Ygc2l6ZSBUUkJfQ0FDSEVfU0laRSBmb3INCj4+IGVhY2ggZW5k
cG9pbnQuIFRoZSBkZWZhdWx0IHZhbHVlIGZvciBUUkJfQ0FDSEVfU0laRSBpcyAxNiBmb3IgU1Mg
YW5kIDgNCj4+IGZvciBIUy4gVGhlIGNvbnRyb2xsZXIgbG9hZHMgYW5kIHVwZGF0ZXMgdGhlIFRS
QiBjYWNoZSBmcm9tIHRoZQ0KPj4gdHJhbnNmZXIgcmluZyBpbiBzeXN0ZW0gbWVtb3J5IHdoZW5l
dmVyIHRoZSBkcml2ZXIgaXNzdWVzIGEgc3RhcnQNCj4+IHRyYW5zZmVyIG9yIHVwZGF0ZSB0cmFu
c2ZlciBjb21tYW5kLg0KPj4NCj4+IEZvciBjaGFpbmVkIFRSQnMsIHRoZSBTeW5vcHN5cyB4SEMg
cmVxdWlyZXMgdGhhdCB0aGUgdG90YWwgYW1vdW50IG9mDQo+PiBieXRlcyBmb3IgYWxsIFRSQnMg
bG9hZGVkIGluIHRoZSBUUkIgY2FjaGUgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvDQo+PiAx
IE1QUy4gT3IgdGhlIGNoYWluIGVuZHMgd2l0aGluIHRoZSBUUkIgY2FjaGUgKHdpdGggYSBsYXN0
IFRSQikuDQo+Pg0KPj4gSWYgdGhpcyByZXF1aXJlbWVudCBpcyBub3QgbWV0LCB0aGUgY29udHJv
bGxlciB3aWxsIG5vdCBiZSBhYmxlIHRvDQo+PiBzZW5kIG9yIHJlY2VpdmUgYSBwYWNrZXQgYW5k
IGl0IHdpbGwgaGFuZyBjYXVzaW5nIGEgZHJpdmVyIHRpbWVvdXQgYW5kDQo+PiBlcnJvci4NCj4g
DQo+IEhpIFRlamFzIEpvZ2xla2FyDQo+IA0KPiBJIGFtIGRlYnVnZ2luZyAgYSBzaW1pbGFyIGlz
c3VlIG9uIFN5bmlwc3lzIFhIQywgaXQncyBub3QgdGhlIHNhbWUgY2FzZQ0KPiBidXQgSSBhbSB3
b25kZXJpbmcgaWYgaXQgYWxzbyBsaW5rZWQgdG8gdGhpcyBIVyBsaW1pdGF0aW9uLg0KPiANCj4g
TXkgU3lub3BzeXMgWEhDIGJhc2VkIGhvc3QgZW5hYmxlIFVBUywgd2hlbiBlbnVtZXJhdGVzIGEg
VUFTDQo+IEhERCwgb25lIEJVTEstSU4gRVAgd2l0aCBzdHJlYW0gZW5hYmxlZCB3aWxsIG5vdCBn
ZW5lcmF0ZSBldmVudCBmb3INCj4gdHJiKHdpdGggc3RyZWFtIElEIDEpIGFmdGVyIGEgMTYvNDA5
NiBieXRlcyh3aXRoIHN0cmVhbSBJRCAyKSBmaW5pc2hlZCBpbg0KPiBwcmV2aW91cyB0cmIuDQo+
IA0KPiBJZiBJIGNoYW5nZSB0aGUgbGFzdCBPSyB1cmIvdHJiJ3MgYnVmZmVyIGxlbmd0aCBmcm9t
IDQwOTYgdG8gNTEyLCB0aGUgaXNzdWUNCj4gd2lsbCBnb25lLg0KPiANCj4gZm9sbG93aW5nIGlz
IHRoZSBzZXF1ZW5jZSBvZiB0aGUgcXVlc3Rpb24gRVAtSU46DQo+IA0KPiA8aWRsZT4tMCAgICAg
WzAwMF0gZC5oMSAgIDE1NC45NjE3MTA6IHhoY2lfdXJiX2dpdmViYWNrOiBlcDNpbi1idWxrOg0K
PiB1cmIgZmZmZjAwMDE3NzVmNmYwMCBwaXBlIDMyMjEzMjQ2NzIgc2xvdCAxIGxlbmd0aCAzNi8z
NiBzZ3MgMS8xDQo+IHN0cmVhbSAxIGZsYWdzIDAwMDQwMjAwDQo+IDxpZGxlPi0wICAgICBbMDAw
XSBkLmgxICAgMTU0Ljk2MjAyMzogeGhjaV91cmJfZ2l2ZWJhY2s6IGVwM2luLWJ1bGs6DQo+IHVy
YiBmZmZmMDAwMTc3ZDAwNDAwIHBpcGUgMzIyMTMyNDY3MiBzbG90IDEgbGVuZ3RoIDk2Lzk2IHNn
cyAxLzENCj4gc3RyZWFtIDEgZmxhZ3MgMDAwNDAyMDANCj4gPGlkbGU+LTAgICAgIFswMDBdIGQu
aDEgICAxNTQuOTcwMzk1OiB4aGNpX3VyYl9naXZlYmFjazogZXAzaW4tYnVsazoNCj4gdXJiIGZm
ZmYwMDAxNzdkMDA0MDAgcGlwZSAzMjIxMzI0NjcyIHNsb3QgMSBsZW5ndGggMTEvMjU1IHNncyAx
LzENCj4gc3RyZWFtIDEgZmxhZ3MgMDAwNDAyMDANCj4gPGlkbGU+LTAgICAgIFswMDBdIGQuaDEg
ICAxNTQuOTcwNTYyOiB4aGNpX3VyYl9naXZlYmFjazogZXAzaW4tYnVsazoNCj4gdXJiIGZmZmYw
MDAxNzdkMDA0MDAgcGlwZSAzMjIxMzI0NjcyIHNsb3QgMSBsZW5ndGggMjAvMjU1IHNncyAxLzEN
Cj4gc3RyZWFtIDEgZmxhZ3MgMDAwNDAyMDANCj4gPGlkbGU+LTAgICAgIFswMDBdIGQuaDEgICAx
NTQuOTcwNzg2OiB4aGNpX3VyYl9naXZlYmFjazogZXAzaW4tYnVsazoNCj4gdXJiIGZmZmYwMDAx
NzdkMDA0MDAgcGlwZSAzMjIxMzI0NjcyIHNsb3QgMSBsZW5ndGggNjAvMjU1IHNncyAxLzENCj4g
c3RyZWFtIDEgZmxhZ3MgMDAwNDAyMDANCj4gPGlkbGU+LTAgICAgIFswMDBdIGQuaDEgICAxNTUu
ODUxNjAwOiB4aGNpX3VyYl9naXZlYmFjazogZXAzaW4tYnVsazoNCj4gdXJiIGZmZmYwMDAxNzdk
MDAyMDAgcGlwZSAzMjIxMzI0NjcyIHNsb3QgMSBsZW5ndGggMTYvNDA5NiBzZ3MgMS8xDQo+IHN0
cmVhbSAyIGZsYWdzIDAwMDQwMjAwDQo+IA0KPiAvKiB0aGVuIHRoZSBuZXh0IGVwMy1pbiB0cmIg
d2lsbCBub3QgZ2VuZXJhdGUgZXZlbnQgYW5kIHN0b3BwZWQsIHNvDQo+IGRyaXZlciB0aW1lb3V0
IGluIHRoZSBlbmQgKi8NCj4ga3dvcmtlci91ODoyLTM0OSAgIFswMDNdIGQuLjMgICAxNTUuODUx
OTg3OiB4aGNpX3VyYl9lbnF1ZXVlOg0KPiBlcDNpbi1idWxrOiB1cmIgZmZmZjAwMDE3MDQ5MjQw
MCBwaXBlIDMyMjEzMjQ2NzIgc2xvdCAxIGxlbmd0aCAwLzMyDQo+IHNncyAxLzEgc3RyZWFtIDEg
ZmxhZ3MgMDAwNDAyMDANCj4ga3dvcmtlci91ODoyLTM0OSAgIFswMDNdIGQuLjQgICAxNTUuODUx
OTg5OiB4aGNpX3F1ZXVlX3RyYjogU1RSRUFNOg0KPiBCdWZmZXIgMDAwMDAwMDBjMTljZjAwMCBs
ZW5ndGggMzIgVEQgc2l6ZSAwIGludHIgMCB0eXBlICdOb3JtYWwnIGZsYWdzDQo+IGI6aTpJOmM6
czpJOmU6Yw0KPiBrd29ya2VyL3U4OjItMzQ5ICAgWzAwM10gZC4uNCAgIDE1NS44NTE5OTE6IHho
Y2lfaW5jX2VucTogU1RSRUFNDQo+IGZmZmYwMDAxNzdmODZmODA6IGVucSAweDAwMDAwMDAwYmUw
ZWIwNjAoMHgwMDAwMDAwMGJlMGViMDAwKSBkZXENCj4gMHgwMDAwMDAwMGJlMGViMDUwKDB4MDAw
MDAwMDBiZTBlYjAwMCkgc2VncyAyIHN0cmVhbSAxIGZyZWVfdHJicyA1MDgNCj4gYm91bmNlIDEw
MjQgY3ljbGUgMQ0KPiANCj4gRG8geW91IGhhdmUgYW55IGlkZWFzPw0KPiANCkZyb20gaW5pdGlh
bCBvYnNlcnZhdGlvbiBvZiB5b3VyIGlzc3VlIGl0IHNlZW1zIHRvIGJlIHVucmVsYXRlZCB3aXRo
IHRoZQ0KY2hhbmdlcyBpbiBteSBwYXRjaC4gQnV0IGNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSwg
VVNCIGFuYWx5emVyIHRyYWNlIGxvZ3MNCmZvciB0aGUgd29ya2luZyBhbmQgbm9uLXdvcmtpbmcg
Y2FzZT8gQWxzbyBpdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4NCnByb3ZpZGUgZGV2aWNl
IGRldGFpbHMgd2hpY2ggeW91IGFyZSB0ZXN0aW5nLg0KDQo+IHRoYW5rcw0KPiBMaSBKdW4NCg0K
VGhhbmtzICYgUmVnYXJkcywNCiBUZWphcyBKb2dsZWthcg0KDQo=
