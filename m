Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0E3C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAF3920678
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 15:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="T6zMoFmv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgA3PH7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 10:07:59 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26148 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726996AbgA3PH7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 10:07:59 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00UF3ZMl015109;
        Thu, 30 Jan 2020 16:07:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xyxcZaoAfvSQh3zX7fH3Tu17xHjmlTcBlramWG+lPic=;
 b=T6zMoFmvTRYiTOguFS3mL4002JGuzIhB5dsCOGJGJusq5DAn9D1R4qJKWs24It9XbvXK
 PwBon78NsqA3gv4KGmKReRBR6DgSBBJ0QDxPja4mlxmkHLA7RrJg6LOJsQmfHNZwv6OW
 C9kvig0HVXaGoMVf3U1AvMb4pf4O3Txnt/jN4+GT17jwSx2AV8K9FSvRMrWAfiHEIs14
 EfG2nIjBZkPku2nxFeIP7r5aK4UjvjkNKZBr1GaRcs1Yfzq3vyMf7SFR58f1k+/8gTfs
 b1kDsgpDlar7xrnqrJtCRyVfu3HIHL8vMfnKFLqu+2qtP1x0SqBc4BMe91M4S2SaqR4x 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrbpb98hg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Jan 2020 16:07:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCEFD100034;
        Thu, 30 Jan 2020 16:07:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7C292D792D;
        Thu, 30 Jan 2020 16:07:32 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 16:07:32 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 30 Jan 2020 16:07:32 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Rob Herring <robh@kernel.org>
CC:     Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        "Yannick FERTRE" <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: one file of all simple DSI panels
Thread-Topic: [PATCH v3] dt-bindings: one file of all simple DSI panels
Thread-Index: AQHV10mLDU78tIWhRkerqIj/vXieLqgDOUiAgAAFXAA=
Date:   Thu, 30 Jan 2020 15:07:32 +0000
Message-ID: <4e517adb-d364-96e9-bc12-a44685db399b@st.com>
References: <20200130084430.20966-1-benjamin.gaignard@st.com>
 <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C0564F6B925484C8E2F6999278E69F1@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-30_04:2020-01-28,2020-01-30 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQpPbiAxLzMwLzIwIDM6NDggUE0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBUaHUsIEphbiAz
MCwgMjAyMCBhdCAyOjQ1IEFNIEJlbmphbWluIEdhaWduYXJkDQo+IDxiZW5qYW1pbi5nYWlnbmFy
ZEBzdC5jb20+IHdyb3RlOg0KPj4gRnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pg0KPj4NCj4+IFRvIGNvbXBsZW1lbnQgcGFuZWwtc2ltcGxlLnlhbWwsIGNyZWF0ZSBwYW5lbC1z
aW1wbGUtZHNpLnlhbWwuDQo+PiBwYW5lbC1zaW1wbGUtZHNpLXlhbWwgYXJlIGZvciBhbGwgc2lt
cGxlIERTUCBwYW5lbHMgd2l0aCBhIHNpbmdsZQ0KPj4gcG93ZXItc3VwcGx5IGFuZCBvcHRpb25h
bCBiYWNrbGlnaHQgLyBlbmFibGUgR1BJTyAvIHJlc2V0IEdQSU8uDQo+Pg0KPj4gTWlncmF0ZSBw
YW5hc29uaWMsdnZ4MTBmMDM0bjAwLCBvcmlzZXRlY2gsb3RtODAwOWEgYW5kIHJheWRpdW0scm02
ODIwMCBvdmVyIHRvIHRoZSBuZXcgZmlsZS4NCj4+DQo+PiBUaGUgb2JqZWN0aXZlcyB3aXRoIG9u
ZSBmaWxlIGZvciBhbGwgdGhlIHNpbXBsZSBEU0kgcGFuZWxzIGFyZToNCj4+ICAgICAgLSBNYWtl
IGl0IHNpbXBsZXIgdG8gYWRkIGJpbmRpbmdzIGZvciBzaW1wbGUgRFNJIHBhbmVscw0KPj4gICAg
ICAtIEtlZXAgdGhlIG51bWJlciBvZiBiaW5kaW5ncyBmaWxlIGxvd2VyDQo+PiAgICAgIC0gS2Vl
cCB0aGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBzaW1wbGUgRFNJIHBhbmVscyBtb3JlIGNv
bnNpc3RlbnQNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAc3QuY29tPg0KPj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFp
bC5jb20+DQo+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4+IENjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+PiBDYzogWWFubmljayBGZXJ0cmUgPHlh
bm5pY2suZmVydHJlQHN0LmNvbT4NCj4+IENjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBh
cm0uY29tPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcNCj4+IC0tLQ0KPj4gdmVyc2lvbiAzOg0KPj4gLSBhZGQgb3Jpc2V0ZWNoLG90bTgw
MDlhIGFuZCByYXlkaXVtLHJtNjgyMDAgY29tcGF0aWJsZXMNCj4+IC0gYWRkIHJlc2V0LWdwaW9z
IG9wdGlvbmFsIHByb3BlcnR5DQo+PiAtIGZpeCBpbmRlbnRhdGlvbiBvbiBjb21wYXRpYmxlIGVu
dW1lcmF0aW9uDQo+PiA9PiBSb2IgaGFkIHJldmlld2VkIHRoZSBzZWNvbmQgdmVyc2lvbiBidXQs
IGdpdmVuIHRoZSBjaGFuZ2VzIGluIHZlcnNpb24gMw0KPj4gICAgIEkgaGF2ZW4ndCBhZGRlZCBo
ZXJlLg0KPj4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEu
dHh0ICB8IDIzIC0tLS0tLS0NCj4+ICAgLi4uL2Rpc3BsYXkvcGFuZWwvcGFuYXNvbmljLHZ2eDEw
ZjAzNG4wMC50eHQgICAgICAgfCAyMCAtLS0tLS0NCj4+ICAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysr
DQo+PiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC50eHQgICAg
IHwgMjUgLS0tLS0tLS0NCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCA2
OCBkZWxldGlvbnMoLSkNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQNCj4+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BhbmFzb25pYyx2dngxMGYwMzRuMDAudHh0DQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC1zaW1wbGUtZHNpLnlhbWwNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC50eHQN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQNCj4+IGRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMjAzYjAzZWVmYjY4Li4wMDAwMDAwMDAw
MDANCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQNCj4+ICsrKyAvZGV2L251bGwNCj4+IEBAIC0xLDIz
ICswLDAgQEANCj4+IC1PcmlzZSBUZWNoIE9UTTgwMDlBIDMuOTciIDQ4MHg4MDAgVEZUIExDRCBw
YW5lbCAoTUlQSS1EU0kgdmlkZW8gbW9kZSkNCj4+IC0NCj4+IC1UaGUgT3Jpc2UgVGVjaCBPVE04
MDA5QSBpcyBhIDMuOTciIDQ4MHg4MDAgVEZUIExDRCBwYW5lbCBjb25uZWN0ZWQgdXNpbmcNCj4+
IC1hIE1JUEktRFNJIHZpZGVvIGludGVyZmFjZS4gSXRzIGJhY2tsaWdodCBpcyBtYW5hZ2VkIHRo
cm91Z2ggdGhlIERTSSBsaW5rLg0KPj4gLQ0KPj4gLVJlcXVpcmVkIHByb3BlcnRpZXM6DQo+PiAt
ICAtIGNvbXBhdGlibGU6ICJvcmlzZXRlY2gsb3RtODAwOWEiDQo+PiAtICAtIHJlZzogdGhlIHZp
cnR1YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbA0KPj4gLQ0KPj4gLU9wdGlv
bmFsIHByb3BlcnRpZXM6DQo+PiAtICAtIHJlc2V0LWdwaW9zOiBhIEdQSU8gc3BlYyBmb3IgdGhl
IHJlc2V0IHBpbiAoYWN0aXZlIGxvdykuDQo+PiAtICAtIHBvd2VyLXN1cHBseTogcGhhbmRsZSBv
ZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2b2x0YWdlLg0KPj4gLQ0K
Pj4gLUV4YW1wbGU6DQo+PiAtJmRzaSB7DQo+PiAtICAgICAgIC4uLg0KPj4gLSAgICAgICBwYW5l
bEAwIHsNCj4+IC0gICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9yaXNldGVjaCxvdG04MDA5
YSI7DQo+PiAtICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPj4gLSAgICAgICAgICAgICAgIHJl
c2V0LWdwaW9zID0gPCZncGlvaCA3IEdQSU9fQUNUSVZFX0xPVz47DQo+PiAtICAgICAgICAgICAg
ICAgcG93ZXItc3VwcGx5ID0gPCZ2MXY4PjsNCj4+IC0gICAgICAgfTsNCj4+IC19Ow0KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3BhbmFzb25pYyx2dngxMGYwMzRuMDAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuYXNvbmljLHZ2eDEwZjAzNG4wMC50eHQNCj4+IGRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMzdkZWRmNmE2NzAyLi4wMDAwMDAwMDAwMDAN
Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3BhbmFzb25pYyx2dngxMGYwMzRuMDAudHh0DQo+PiArKysgL2Rldi9udWxsDQo+PiBAQCAtMSwy
MCArMCwwIEBADQo+PiAtUGFuYXNvbmljIDEwIiBXVVhHQSBURlQgTENEIHBhbmVsDQo+PiAtDQo+
PiAtUmVxdWlyZWQgcHJvcGVydGllczoNCj4+IC0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAicGFu
YXNvbmljLHZ2eDEwZjAzNG4wMCINCj4+IC0tIHJlZzogRFNJIHZpcnR1YWwgY2hhbm5lbCBvZiB0
aGUgcGVyaXBoZXJhbA0KPj4gLS0gcG93ZXItc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0
b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IHZvbHRhZ2UNCj4+IC0NCj4+IC1PcHRpb25hbCBw
cm9wZXJ0aWVzOg0KPj4gLS0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2
aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbA0KPj4gLQ0KPj4gLUV4YW1wbGU6DQo+PiAtDQo+PiAt
ICAgICAgIG1kc3NfZHNpQGZkOTIyODAwIHsNCj4+IC0gICAgICAgICAgICAgICBwYW5lbEAwIHsN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicGFuYXNvbmljLHZ2eDEw
ZjAzNG4wMCI7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47DQo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkgPSA8JnZyZWdfdnNwPjsNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmbHA4NTY2X3dsZWQ+Ow0KPj4gLSAgICAg
ICAgICAgICAgIH07DQo+PiAtICAgICAgIH07DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwt
c2ltcGxlLWRzaS55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xMTY4YjgxODY0OTANCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2ku
eWFtbA0KPj4gQEAgLTAsMCArMSw3NCBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgb3IgQlNELTItQ2xhdXNlKQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0K
Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9wYW5l
bC1zaW1wbGUtZHNpLnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IFNpbXBsZSBEU0kgcGFuZWxz
IHdpdGggYSBzaW5nbGUgcG93ZXItc3VwcGx5DQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiAr
ICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+PiArICAtIFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjogfA0K
Pj4gKyAgVGhpcyBiaW5kaW5nIGZpbGUgaXMgYSBjb2xsZWN0aW9uIG9mIHRoZSBEU0kgcGFuZWxz
IHRoYXQNCj4+ICsgIHJlcXVpcmVzIG9ubHkgYSBzaW5nbGUgcG93ZXItc3VwcGx5Lg0KPj4gKyAg
VGhlcmUgYXJlIG9wdGlvbmFsbHkgYSBiYWNrbGlnaHQgYW5kIGFuIGVuYWJsZSBHUElPLg0KPj4g
KyAgVGhlIHBhbmVsIG1heSB1c2UgYW4gT0YgZ3JhcGggYmluZGluZyBmb3IgdGhlIGFzc29jaWF0
aW9uIHRvIHRoZSBkaXNwbGF5LA0KPj4gKyAgb3IgaXQgbWF5IGJlIGEgZGlyZWN0IGNoaWxkIG5v
ZGUgb2YgdGhlIGRpc3BsYXkuDQo+PiArDQo+PiArICBJZiB0aGUgcGFuZWwgaXMgbW9yZSBhZHZh
bmNlZCBhIGRlZGljYXRlZCBiaW5kaW5nIGZpbGUgaXMgcmVxdWlyZWQuDQo+PiArDQo+PiArYWxs
T2Y6DQo+PiArICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIw0KPj4gKw0KPj4gK3Byb3BlcnRp
ZXM6DQo+PiArDQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAgICBlbnVtOg0KPj4gKyAgICAgICMg
Y29tcGF0aWJsZSBtdXN0IGJlIGxpc3RlZCBpbiBhbHBoYWJldGljYWwgb3JkZXIsIG9yZGVyZWQg
YnkgY29tcGF0aWJsZS4NCj4+ICsgICAgICAjIFRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWVu
dCBpcyBtYW5kYXRvcnkgZm9yIGVhY2ggY29tcGF0aWJsZS4NCj4+ICsNCj4+ICsgICAgICAgICMg
T3Jpc2UgVGVjaCBPVE04MDA5QSBpcyBhIDMuOTciIDQ4MHg4MDAgVEZUIExDRA0KPj4gKyAgICAg
IC0gb3Jpc2V0ZWNoLG90bTgwMDlhDQo+PiArICAgICAgICAjIFBhbmFzb25pYyAxMCIgV1VYR0Eg
VEZUIExDRCBwYW5lbA0KPj4gKyAgICAgIC0gcGFuYXNvbmljLHZ2eDEwZjAzNG4wMA0KPj4gKyAg
ICAgICAgIyBSYXlkaXVtIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24gUk02ODIwMCBpcyBhIDUu
NSIgNzIweDEyODAgVEZUIExDRA0KPj4gKyAgICAgIC0gcmF5ZGl1bSxybTY4MjAwDQo+PiArDQo+
PiArICByZWc6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArICAgIGRlc2NyaXB0aW9uOiBEU0kg
dmlydHVhbCBjaGFubmVsDQo+PiArDQo+PiArICByZXNldC1ncGlvczoNCj4+ICsgICAgbWF4SXRl
bXMgOiAxDQo+IENhbiB3ZSBrZWVwIHdoZXRoZXIgdG8gYWRkICdyZXNldC1ncGlvcycgYSBzZXBh
cmF0ZSBkaXNjdXNzaW9uLiBJZiB3ZQ0KPiBkbyBhZGQgaXQsIHRoZW4gaXQgc2hvdWxkIGdvIGlu
IHBhbmVsLWNvbW1vbi55YW1sIGFuZA0KPiBwYW5lbC1zaW1wbGUueWFtbC4NCg0KcmVzZXQtZ3Bp
b3MgaXMgbmVlZGVkLCBhdCBsZWFzdCwgZm9yIG9yaXNldGVjaCxvdG04MDA5YSBhbmQgcmF5ZGl1
bSxybTY4MjAwDQptYXliZSB0aGF0IG1lYW5zIHRoZXNlIHR3byBkaXNwbGF5cyBhcmUgbm90IHNp
bXBsZSBkc2kgcGFuZWxzLg0KSXQgaXMgdGhlIGNhc2UgSSBjb3VsZCBjcmVhdGUgZGVkaWNhdGVk
IGZpbGVzIGZvciB0aGVtLg0KDQpCZW5qYW1pbg0KDQo+IFJvYg==
