From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 0/4] media: sun6i: Add support for the H3 CSI controller
Date: Tue, 26 Jun 2018 11:41:56 +0530
Message-ID: <CAMty3ZBQXyvOnzy_9RLDW-QO9qnAC4SR5UJnWYmhiPrP23z_vg@mail.gmail.com>
References: <20180305100432.15009-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180305100432.15009-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mylene Josserand <mylene.josserand@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBNYXIgNSwgMjAxOCBhdCAzOjM0IFBNLCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiBIaSwKPgo+IFRoZSBIMyBhbmQgSDUgaGF2ZSBhIENT
SSBjb250cm9sbGVyIGJhc2VkIG9uIHRoZSBvbmUgcHJldmlvdXNseSBmb3VuZAo+IGluIHRoZSBB
MzEsIHRoYXQgaXMgY3VycmVudGx5IHN1cHBvcnRlZCBieSB0aGUgc3VuNmktY3NpIGRyaXZlci4K
Pgo+IEFkZCB0aGUgY29tcGF0aWJsZXMgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGFuZCB0
byB0aGUgZHJpdmVyIHRvCj4gbWFrZSBpdCB3b3JrIHByb3Blcmx5Lgo+Cj4gVGhpcyBvYnZpb3Vz
bHkgZGVwZW5kcyBvbiB0aGUgc2VyaWUgIkluaXRpYWwgQWxsd2lubmVyIFYzcyBDU0kKPiBTdXBw
b3J0IiBieSBZb25nIERlbmcuCj4KPiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluaywKPiBNYXhp
bWUKPgo+IE1heGltZSBSaXBhcmQgKDIpOgo+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiBzdW42aTog
QWRkIEEzMSBhbmQgSDMgY29tcGF0aWJsZXMKPiAgIG1lZGlhOiBzdW42aTogQWRkIEEzMSBjb21w
YXRpYmxlCj4KPiBNeWzDqG5lIEpvc3NlcmFuZCAoMik6Cj4gICBBUk06IGR0czogc3VuOGk6IEFk
ZCB0aGUgSDMvSDUgQ1NJIGNvbnRyb2xsZXIKPiAgIFtETyBOT1QgTUVSR0VdIEFSTTogZHRzOiBz
dW44aTogQWRkIENBTTUwMEIgY2FtZXJhIG1vZHVsZSB0byB0aGUgTmFubwo+ICAgICBQaSBNMSsK
Ckp1c3QgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hhdCBpbnRlcmZhY2UgaGFzIGJlZW4gdGVzdGVk
IHdpdGggbnBpLW0xKywKaXMgaXQgRFZQIChwYXJhbGxlbCkgaW50ZXJmYWNlPyBJJ3ZlIEJhbmFu
YXBpIDVNUFsxXSBhbmQgdHJ5aW5nIHRvCnRlc3Qgb24gdG9wLCBhbmQgbG9vayBsaWtlIGl0cyBN
SVBJIENTSTIuIEkgZ3Vlc3MgWW9uZyBwYXRjaFsyXQpkb2Vzbid0IHN1cHBvcnQgQ1NJMiB5ZXQs
IGFtIEkgY29ycmVjdD8KClsxXSBodHRwczovL3d3dy5hbWF6b24uaW4vR2VuZXJpYy1WMy0wLUJQ
SS1NMy1jYW1lcmEtY2hpcHNldC9kcC9CMDcyN041Q0QxClsyXSBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzEwMzgwMDY3LwoKSmFnYW4uCgotLSAKSmFnYW4gVGVraQpTZW5pb3Ig
TGludXggS2VybmVsIEVuZ2luZWVyIHwgQW1hcnVsYSBTb2x1dGlvbnMKVS1Cb290LCBMaW51eCB8
IFVwc3RyZWFtIE1haW50YWluZXIKSHlkZXJhYmFkLCBJbmRpYS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
