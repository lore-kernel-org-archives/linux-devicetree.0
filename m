Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89597C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64A622070C
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="nR5D7eL9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgGAHWH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 03:22:07 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:50022 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728065AbgGAHWG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 03:22:06 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0617Hv6J007048;
        Wed, 1 Jul 2020 09:21:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Fqmgqga7p2xlC5BiTeb3k17/KtVTjMNwbFVFawb4x7s=;
 b=nR5D7eL9XpRFGaQ3n2Kj9aQi2Krz0FV8izzxrZnISlkjN9LPUTy7/rzbHiqIHpE/p/ff
 3oFKoDVUgj+TB9sgElbiyNKcHY4llIQQMnisg0F+aqpu/Q36A/HHMJpYufmMIYVkwknO
 6YE5YBVosCNSzHZBLJEd31wkAYTbsqzdlM3jUuThwHXxdvxuqqwLj0/SwS+owGqC4LRq
 wrsU1L4FBEjxMMBM4njK0SblMerWQAsHo5jK06hZ4hvFlrNhapBgoQHrMQf7E7axzKhV
 sweOsaXFyDC1c+Dx7U1sNr0Drwdvhpdsyo6sco9Atz4jVNQP++OO8bPAvFmuXgKPSmLs Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1g3ad-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 09:21:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0029410002A;
        Wed,  1 Jul 2020 09:21:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7E94210F81;
        Wed,  1 Jul 2020 09:21:58 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 09:21:58 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 1 Jul 2020 09:21:58 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Fabio Estevam <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC] dt-bindings: mfd: st,stmfx: Remove extra
 additionalProperties
Thread-Topic: [RFC] dt-bindings: mfd: st,stmfx: Remove extra
 additionalProperties
Thread-Index: AQHWTkrSTJHqoDOlXEWFBhpGidYzp6jyMn8A
Date:   Wed, 1 Jul 2020 07:21:58 +0000
Message-ID: <18c2405c-3c9d-58e0-c5ab-61a214341322@st.com>
References: <20200629192335.24622-1-festevam@gmail.com>
In-Reply-To: <20200629192335.24622-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <71BB0AF4334288459BD49C56CBA98190@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_03:2020-07-01,2020-07-01 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQoNCk9uIDYvMjkvMjAgOToyMyBQTSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToNCj4gVGhlIGZvbGxv
d2luZyBidWlsZCBlcnJvciBpcyBzZWVuIHdpdGggJ21ha2UgZHRfYmluZGluZ19jaGVjayc6DQo+
DQo+ICAgIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxz
dG1meC55YW1sDQo+IC9ob21lL2ZhYmlvL2xpbnV4LW5leHQvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9zdCxzdG1meC55YW1sOiBwcm9wZXJ0aWVzOnBpbmN0cmw6cGF0dGVy
blByb3BlcnRpZXM6IHsnZW51bSc6IFsnJHJlZicsICdhZGRpdGlvbmFsSXRlbXMnLCAnYWRkaXRp
b25hbFByb3BlcnRpZXMnLCAnYWxsT2YnLCAnYW55T2YnLCAnY29uc3QnLCAnY29udGFpbnMnLCAn
ZGVmYXVsdCcsICdkZXBlbmRlbmNpZXMnLCAnZGVwcmVjYXRlZCcsICdkZXNjcmlwdGlvbicsICdl
bHNlJywgJ2VudW0nLCAnaWYnLCAnaXRlbXMnLCAnbWF4SXRlbXMnLCAnbWF4aW11bScsICdtaW5J
dGVtcycsICdtaW5pbXVtJywgJ211bHRpcGxlT2YnLCAnbm90JywgJ29uZU9mJywgJ3BhdHRlcm4n
LCAncGF0dGVyblByb3BlcnRpZXMnLCAncHJvcGVydGllcycsICdwcm9wZXJ0eU5hbWVzJywgJ3Jl
cXVpcmVkJywgJ3RoZW4nLCAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJ119IGlzIG5vdCBhbGxvd2Vk
IGZvciAnYWRkaXRpb25hbFByb3BlcnRpZXMnDQo+DQo+IFJlbW92ZSB0aGUgZXh0cmEgJ2FkZGl0
aW9uYWxQcm9wZXJ0aWVzJyB0byBwYXNzIHRoZSBidWlsZC4NClJldmlld2VkLWJ5OiBCZW5qYW1p
biBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbCB8IDIgLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbA0KPiBpbmRleCAwY2U1NmEw
ZGE1NTMuLmJlZDIyZDRhYmZmYiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9zdCxzdG1meC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbA0KPiBAQCAtNzMsOCArNzMsNiBAQCBw
cm9wZXJ0aWVzOg0KPiAgICAgICAgICAgICBvdXRwdXQtaGlnaDogdHJ1ZQ0KPiAgICAgICAgICAg
ICBvdXRwdXQtbG93OiB0cnVlDQo+ICAgDQo+IC0gICAgICBhZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UNCj4gLQ0KPiAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gICANCj4g
ICAgICAgcmVxdWlyZWQ6DQo=
