From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH RESEND V2 1/3] clocksource/drivers/sysctr: Add optional
 clock-frequency property
Date: Wed, 26 Jun 2019 12:37:52 +0200
Message-ID: <9c017ba9-ac6b-480b-d1f3-120289343101@linaro.org>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
 <55abafbd-c010-32b5-6d76-26040830d5b0@linaro.org>
 <DB3PR0402MB3916AB9F2260B0E46CCDDEC0F5E20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB3PR0402MB3916AB9F2260B0E46CCDDEC0F5E20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gMjYvMDYvMjAxOSAwMzo0MiwgQW5zb24gSHVhbmcgd3JvdGU6Cj4gSGksIERhbmllbAo+IAo+
PiBPbiAyMy8wNi8yMDE5IDE0OjM4LCBBbnNvbi5IdWFuZ0BueHAuY29tIHdyb3RlOgo+Pj4gRnJv
bTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+Cj4+Pgo+Pj4gU3lzdGVtcyB3aGlj
aCB1c2UgcGxhdGZvcm0gZHJpdmVyIG1vZGVsIGZvciBjbG9jayBkcml2ZXIgcmVxdWlyZSB0aGUK
Pj4+IGNsb2NrIGZyZXF1ZW5jeSB0byBiZSBzdXBwbGllZCB2aWEgZGV2aWNlIHRyZWUgd2hlbiBz
eXN0ZW0gY291bnRlcgo+Pj4gZHJpdmVyIGlzIGVuYWJsZWQuCj4+Pgo+Pj4gVGhpcyBpcyBuZWNl
c3NhcnkgYXMgaW4gdGhlIHBsYXRmb3JtIGRyaXZlciBtb2RlbCB0aGUgb2ZfY2xrCj4+PiBvcGVy
YXRpb25zIGRvIG5vdCB3b3JrIGNvcnJlY3RseSBiZWNhdXNlIHN5c3RlbSBjb3VudGVyIGRyaXZl
ciBpcwo+Pj4gaW5pdGlhbGl6ZWQgaW4gZWFybHkgcGhhc2Ugb2Ygc3lzdGVtIGJvb3QgdXAsIGFu
ZCBjbG9jayBkcml2ZXIgdXNpbmcKPj4+IHBsYXRmb3JtIGRyaXZlciBtb2RlbCBpcyBOT1QgcmVh
ZHkgYXQgdGhhdCB0aW1lLCBpdCB3aWxsIGNhdXNlIHN5c3RlbQo+Pj4gY291bnRlciBkcml2ZXIg
aW5pdGlhbGl6YXRpb24gZmFpbGVkLgo+Pj4KPj4+IEFkZCB0aGUgb3B0aW5hbCBjbG9jay1mcmVx
dWVuY3kgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIG9mIHRoZSBOWFAKPj4+IHN5c3RlbSBj
b3VudGVyLCBzbyB0aGUgZnJlcXVlbmN5IGNhbiBiZSBoYW5kZWQgaW4gYW5kIHRoZSBvZl9jbGsK
Pj4+IG9wZXJhdGlvbnMgY2FuIGJlIHNraXBwZWQuCj4+Cj4+IElzbid0IGl0IHBvc3NpYmxlIHRv
IGNyZWF0ZSBhIGZpeGVkLWNsb2NrIGFuZCByZWZlciB0byBpdD8gU28gbm8gbmVlZCB0byBjcmVh
dGUgYQo+PiBzcGVjaWZpYyBhY3Rpb24gYmVmb3JlIGNhbGxpbmcgdGltZXJfb2ZfaW5pdCgpID8K
Pj4KPiAKPiBBcyB0aGUgY2xvY2sgbXVzdCBiZSByZWFkeSBiZWZvcmUgdGhlIFRJTUVSX09GX0RF
Q0xBUkUsIHNvIGFkZGluZyBhIENMS19PRl9ERUNMQVJFX0RSSVZFUiBpbgo+IGNsb2NrIGRyaXZl
ciB0byBPTkxZIHJlZ2lzdGVyIGEgZml4ZWQtY2xvY2s/IFRoZSBzeXN0ZW0gY291bnRlcidzIGZy
ZXF1ZW5jeSBhcmUgZGlmZmVyZW50IG9uIGRpZmZlcmVudAo+IHBsYXRmb3Jtcywgc28gYWRkaW5n
IGZpeGVkIGNsb2NrIGluIHN5c3RlbSBjb3VudGVyIGRyaXZlciBpcyBOT1QgYSBnb29kIGlkZWEs
IE9OTFkgdGhlIERUIG5vZGUgb3IgdGhlCj4gY2xvY2sgZHJpdmVyIGNhbiBjcmVhdGUgdGhpcyBm
aXhlZCBjbG9jayBhY2NvcmRpbmcgdG8gcGxhdGZvcm1zLCBjYW4geW91IGFkdmlzZSB3aGVyZSB0
byBjcmVhdGUgdGhpcyBmaXhlZAo+IGNsb2NrIGlzIGJldHRlcj8KCkNhbiB5b3UgcG9pbnQgbWUg
dG8gYSBEVCB3aXRoIHRoZSAibnhwLHN5c2N0ci10aW1lciIgPwoKCi0tIAogPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
