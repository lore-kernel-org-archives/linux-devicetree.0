Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50EAC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 06:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C3CA20759
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 06:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B5aGauhF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AV3sOX7i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgF3G3F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 02:29:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:43084 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730112AbgF3G3F (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 30 Jun 2020 02:29:05 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CD3FC008F;
        Tue, 30 Jun 2020 06:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593498544; bh=1fQMEFZoJcYRFsIO7C0NfNLCjRNMxIPupYS54zYrDJc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=B5aGauhFsRYlcStFJracep7NtyG1bJ4tYzP2emmfzUKfQd3JXRDHzMhOwwQ2rdrdA
         JB+ZNe1FryeNuZlKItZHY1EgJ0/8cLYimVOOvVMQdhl8A/c8Afs8P0tCoiMqv4JhDT
         vbdGUc2bMraxXWwKxK5qdZHNWGNCrc8mzkjGXIbzEdVjLw7zSK+ITnTsgqRZfCJNVt
         UKYmnmuY2BoDqqlXD1XlTqY9EbyIr9q3BE0VjjeYwTM6BigEV6dkoJkhfRm2yO/NQX
         6gRxx20+aoBI+OlBxCG8MbxOxyZTw+QcbqmbKW3KVwFvMmz1VswbgaeVTeSw1tO8FT
         aJo5lehTx1K1A==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 96C07A0081;
        Tue, 30 Jun 2020 06:29:02 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0294E40032;
        Tue, 30 Jun 2020 06:29:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AV3sOX7i";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aO2YDquH9goqW78hJoHu1JJoMRWSXkiy3UMtrVfoWjAP6GXbmEhNTSOR6ouMrjGU6On66M+xL4Nfcib0ZHl0vAvP/MU36VMinAFHMXlEbVHRLLQdQzmJh2egXCVB9zgcrh/05AfDzJHhTbjmwUPkRi9J37lay7uEVtcEtmAWiRd2SZbT2cCpiknj902MZrvMdkZTiuTMQdmj+cZ1aJznARepKl0nQwDCCwb8VRjMiHWZk7a65oe6sbWRaFFsZ9H46EJJs4Bv5BHJvCYrLtEvoHpUHRvj+BE9PXwxkTdNe8vESwTRjiIPLUsUABzV9TW6MhLKUxYATCgAjwjfqtn+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fQMEFZoJcYRFsIO7C0NfNLCjRNMxIPupYS54zYrDJc=;
 b=AQtKEZOJogoOTLh9vaM+m0Cs80o/4NZOh6wwtJCOGgEhDCNLFviRGEU87JGTSGCKe43uloFPNR6M69z2Wa1Z9l+Q+iBuy3FJ5ZET+xxMgW1ap2e4K8nznhT1i7i15K2kqtbszlq5lwIEFny0ip6h8hIj9W4/sBiIwebMI6lZYaz5f2avpBfLaCKP/DJ+6DUoXvtPrRsURb80QwoC9nQDQNahCucNWMlqY6vFO1zgN7C8Y8kNH0BN5osl7E7BlZWfqbExxORkVVf2oV3XIc/yJuMN1IdvSuz6XUI2fDT/5UHr7amV5GPNvkcnLmHIu5tXrb8ODoZ6vdLt1K1e5ncYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fQMEFZoJcYRFsIO7C0NfNLCjRNMxIPupYS54zYrDJc=;
 b=AV3sOX7iqOIC9ddl64Ogj5tSwbYx11ZgpYbbBZiMSReD1IRI7mtDsYF+TzW+ZPghjj7CxihKKsabHlJxFGadTFFOSaifsKXNwN0YDoklQfqi2c9aOJxG/PALrd7DyTtyq33ZB321oZx3y/w17IBpUeryE4OGBAU3+0kHgxMPMv4=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN8PR12MB3554.namprd12.prod.outlook.com (2603:10b6:408:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 06:28:57 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::3489:4bde:b7b9:3aec]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::3489:4bde:b7b9:3aec%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 06:28:57 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWNBOcKSGY3EC5WEe37t+laBwpCKjOM4yAgAHcZoCAA75DAIAdGRoA
Date:   Tue, 30 Jun 2020 06:28:57 +0000
Message-ID: <3682fc3e-a8e6-5655-d5d4-f7e18309b684@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <ba1eb639-7c58-c2b2-1bd9-dacec5d1092b@synopsys.com>
 <0083681d-6f68-918a-8109-75e511ef8bf5@linux.intel.com>
 <c5a28e78-eaa0-92f7-f865-09b37974f101@synopsys.com>
In-Reply-To: <c5a28e78-eaa0-92f7-f865-09b37974f101@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 342b46e2-6fcc-45ab-96f5-08d81cbedea4
x-ms-traffictypediagnostic: BN8PR12MB3554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3554AD16C6367672DE98F99CA46F0@BN8PR12MB3554.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNbyN2o62HI4Y5nK3hiqfwRbzu8XQc17yvt0O+soQkqW0yk6y2ZFu3wTUmGS9ZNNpTOD+OnCGhg42CQzIPV+PYOgBK+4oThgFDzu/+zIYjmKBeWLCub3cvTFcXqKv3oY8pQ2rNuBh9LwPuRdjx3Dt/t8QqFvwRN3l+lx6jsf1J4EwCkZqtXOCLS20x3RVeAC/vfsCbgk55CSGAfnm9kabfJ20RzAR8VrYDD6ZV7QNrH+Vg1aB6GreTafqNsNPCrq6GtnL9SGZf8uz0+ZcruU/eUIAwkOLynnKz4Q1EZObht2py6YWEnqGkcW61jkrBd9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(366004)(136003)(376002)(346002)(186003)(107886003)(8676002)(6506007)(2616005)(86362001)(53546011)(76116006)(66556008)(26005)(2906002)(8936002)(4744005)(66446008)(66476007)(64756008)(66946007)(6512007)(91956017)(31686004)(36756003)(110136005)(478600001)(316002)(31696002)(71200400001)(4326008)(6486002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NHuPeqXGKK0PCdwZcEADPJJ3KlPO2HnGfJuHp9aEs3k6Issw87kYv8bRpONKy6VWmHJJ1XOsERhNcD4K8ydKvt2Hms/QG3PTNA9eRWn4CdCKiXutqeM1lerY20qPYxYKff4OOFp8ujZpS8hURURI6mY2XqnMrXhCEgz2MqCBL0d8bJYRR/3EMmk7Z3QaBE49SZ0v36gJAJ0Yq2BW6XkDzPBj6c13KOPPT0pJtSV3Ob9VkaH0fdbqRzyEmCvH1m0ujhVzdiPM0ns0s6HdK1WC9DFOA7ekQ1AHIrTkJP8V20Xgq7lHukRGKp+QSQ5+DJhtneE4rZYAUTZDd7Qd8L2sFf8/2ztc7hyhhi+7Rio3MuP8K9daNsn11cFn0B584iBklxnUOT4wIBkA6VPmstvgzYwCtKElTIsufk0fJI8Y8YEn8P6qiyEANVu9coasRgYmnPTDFklRVD7ccdiwN4cl2ZiAZoU3UDNhvXuIzNb63/c=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35A9CBF6ADF0DD438CDB7B838DEB7944@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342b46e2-6fcc-45ab-96f5-08d81cbedea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 06:28:57.5788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PV9Ej1W151o2kjuY2BQqN0CSW05rTZnIHvDaQH98sE01iTYGlrnaIW49WX8aKKKYRDyp+ReGepCMjXi0Uv4I6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3554
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgRmVsaXBlLA0KT24gNi8xMS8yMDIwIDExOjM3IFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToN
Cj4gSGksDQo+IE9uIDYvOS8yMDIwIDI6MjcgUE0sIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+PiBP
biA4LjYuMjAyMCA3LjMyLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+PiBIaSBNYXRoaWFzLA0K
Pj4+ICAgIFdpbGwgdGhpcyBiZSBhZGRlZCB0byB5b3VyIG5leHQgYnJhbmNoID8NCj4+DQo+PiBU
aGVyZSBhcmUgc3RpbGwgc29tZSBvcGVucyBSb2IgSGVycmluZyBwb2ludGVkIG91dCByZWdhcmRp
bmcgZGV2aWNldHJlZS4NCj4+IEFkZGluZyBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgc3lu
b3BzeXMgeGhjaSBhbmQgc2V0dGluZyBxdWlyayBiYXNlZA0KPj4gb24gdGhhdCBzb3VuZHMgZ29v
ZCB0byBtZS4NCj4+DQo+PiBOb3Qgc3VyZSBob3cgdGhhdCB3b3JrcyBpbiBjYXNlcyB3aGVyZSB0
aGUgeGhjaSBkZXZpY2UgaXMgY3JlYXRlZCBieSB0aGUgRFdDMyBkcml2ZXIuDQo+PiBPbmNlIHdl
IGhhdmUgYSBzb2x1dGlvbiB0aGF0IEZlbGlwZSBhbmQgUm9iIGFncmVlcyB3aXRoIEkgY2FuIHRh
a2UgdGhlIHdob2xlDQo+PiBzZXJpZXMuICANCj4+DQo+IEBGZWxpcGU6IENhbiB5b3UgcGxlYXNl
IGhhdmUgYSBsb29rIGFuZCBzZWUgaWYgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgb2sg
b3IgYW55dGhpbmcgdG8gYmUgY2hhbmdlZD8NCj4gDQpDYW4geW91IHBsZWFzZSBoYXZlIHJldmll
dyBteSBwYXRjaCBhbmQgc3VnZ2VzdCB0aGUgY2hhbmdlcyByZXF1aXJlZCwgc28gTWF0aGlhcyBj
YW4gYWNjZXB0IHRoZSBzZXJpZXM/DQoNCj4+IFRoZSB4aGNpIHBhcnRzIGFuZCBQQ0kgY2FzZSBs
b29rcyBnb29kIHRvIG1lLg0KPj4NCj4+IC1NYXRoaWFzDQo+Pg0KPj4NCj4gVGhhbmtzICYgUmVn
YXJkcywNCj4gIFRlamFzIEpvZ2xla2FyDQo+IA0KDQpUaGFua3MgJiBSZWdhcmRzLA0KICBUZWph
cyBKb2dsZWthcg0K
