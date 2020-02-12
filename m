Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B6CC2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 17:08:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76DFC206D7
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 17:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="yHLVovXE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgBLRIP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 12:08:15 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:40031 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728098AbgBLRIO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 12:08:14 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01CGwfID011572;
        Wed, 12 Feb 2020 18:07:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xrbRWyg0D4q5eEPIH0r1B8C3kSO9phO+KLwzSaQYec4=;
 b=yHLVovXExQw1APYQpnN4nqcUrSA/3LPowdOd4HSTE07PC3N96Dabw4dK0gRR3qyFQdHe
 ifMQsURbHly4TcE/aXbuc2cfjRVVvc0dS6ZtmiiXwZyPGUMRK0Krn9zxBAUCm78WceiL
 aTORRBymFHqI0+RGu+wviMIm1/0HPLPvgL0Id79/yZDpzo/09k+uqrXoryIM7PA1jcfs
 p1hssJkHeNOX0Koiqf+Utb6iJrpukBloH1DDmaAzR7xUciXazuJjaHzKBZGdBSqbAyN9
 Va7lUZ9eRQXaF4JwecL4LdJIOYOmWd9Ok2UMwfhxBC3bPgmc4GR7pZ5x4vmncPHUcaEc NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1urhftnv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Feb 2020 18:07:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FA6310002A;
        Wed, 12 Feb 2020 18:07:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BE852BF9C4;
        Wed, 12 Feb 2020 18:07:50 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 18:07:49 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 12 Feb 2020 18:07:49 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low power
 clkevent bindings
Thread-Topic: [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low power
 clkevent bindings
Thread-Index: AQHV1dN1SufRLAitBUGp4OAGtW3SUqgXzN0AgAAEoIA=
Date:   Wed, 12 Feb 2020 17:07:49 +0000
Message-ID: <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
 <20200212165116.GA2949@linaro.org>
In-Reply-To: <20200212165116.GA2949@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C493ABCE6CA6CB4FB177F0711786531B@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-12_08:2020-02-12,2020-02-12 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQpPbiAyLzEyLzIwIDU6NTEgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOg0KPiBPbiBUdWUsIEph
biAyOCwgMjAyMCBhdCAwMTowNzowMVBNICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToN
Cj4+IEFkZCBhIHN1Ym5vZGUgdG8gU1RNIGxvdyBwb3dlciB0aW1lciBiaW5kaW5ncyB0byBzdXBw
b3J0IGNsa2V2ZW50IGRyaXZlcg0KPiBjbGtldmVudCBpcyBMaW51eCBzcGVjaWZpYy4NCkRvZXMg
J2V2ZW50JyBvciAnYnJvYWRjYXN0JyB3b3VsZCBzb3VuZCBiZXR0ZXIgPw0KPg0KPj4gU2lnbmVk
LW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4NCj4+
IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55
YW1sICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi1scHRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbA0KPj4gaW5kZXggMWE0
Y2M1ZjNmYjMzLi41MzVlMGI0MGNkZjkgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbA0KPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi1scHRpbWVyLnlhbWwN
Cj4+IEBAIC04MSw2ICs4MSwxNiBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4+ICAgICAgIHJlcXVp
cmVkOg0KPj4gICAgICAgICAtIGNvbXBhdGlibGUNCj4+ICAgDQo+PiArICBjbGtldmVudDoNCj4+
ICsgICAgdHlwZTogb2JqZWN0DQo+PiArDQo+PiArICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAg
Y29tcGF0aWJsZToNCj4+ICsgICAgICAgIGNvbnN0OiBzdCxzdG0zMi1jbGtldmVudC1scA0KPj4g
Kw0KPj4gKyAgICByZXF1aXJlZDoNCj4+ICsgICAgICAtIGNvbXBhdGlibGUNCj4+ICsNCj4+ICAg
cmVxdWlyZWQ6DQo+PiAgICAgLSAiI2FkZHJlc3MtY2VsbHMiDQo+PiAgICAgLSAiI3NpemUtY2Vs
bHMiDQo+PiBAQCAtMTE1LDYgKzEyNSwxMCBAQCBleGFtcGxlczoNCj4+ICAgICAgICAgY291bnRl
ciB7DQo+PiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1scHRpbWVyLWNvdW50ZXIi
Ow0KPj4gICAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgIGNsa2V2ZW50IHsNCj4+ICsgICAgICAg
IGNvbXBhdGlibGUgPSAic3Qsc3RtMzItY2xrZXZlbnQtbHAiOw0KPj4gKyAgICAgIH07DQo+PiAg
ICAgICB9Ow0KPj4gICANCj4+ICAgLi4uDQo+PiAtLSANCj4+IDIuMTUuMA0KPj4=
