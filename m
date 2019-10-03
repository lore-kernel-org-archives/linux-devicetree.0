From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: move ltdc pinctrl on stm32mp157a dk1
 board
Date: Thu, 3 Oct 2019 12:05:06 +0200
Message-ID: <05cc08f2-36c8-af75-39f3-7b7f4ac4e671@st.com>
References: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
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
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

SGkgWWFubmljawoKT24gOC8yLzE5IDQ6MDggUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiBU
aGUgbHRkYyBwaW5jdHJsIG11c3QgYmUgaW4gdGhlIGRpc3BsYXkgY29udHJvbGxlciBub2RlIGFu
ZAo+IG5vdCBpbiB0aGUgcGVyaXBoZXJhbCBub2RlIChoZG1pIGJyaWRnZSkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gLS0tCj4g
ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIHwgNiArKystLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzCj4gaW5kZXggZjNmMGUzNy4uMTI4NWNmYyAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzCj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLmR0cwo+IEBAIC05OSw5ICs5OSw2IEBA
Cj4gICAJCXJlc2V0LWdwaW9zID0gPCZncGlvYSAxMCBHUElPX0FDVElWRV9MT1c+Owo+ICAgCQlp
bnRlcnJ1cHRzID0gPDEgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKPiAgIAkJaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3Bpb2c+Owo+IC0JCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7
Cj4gLQkJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47Cj4gLQkJcGluY3RybC0xID0gPCZsdGRj
X3BpbnNfc2xlZXBfYT47Cj4gICAJCXN0YXR1cyA9ICJva2F5IjsKPiAgIAo+ICAgCQlwb3J0cyB7
Cj4gQEAgLTI3Niw2ICsyNzMsOSBAQAo+ICAgfTsKPiAgIAo+ICAgJmx0ZGMgewo+ICsJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKPiArCXBpbmN0cmwtMCA9IDwmbHRkY19waW5z
X2E+Owo+ICsJcGluY3RybC0xID0gPCZsdGRjX3BpbnNfc2xlZXBfYT47Cj4gICAJc3RhdHVzID0g
Im9rYXkiOwo+ICAgCj4gICAJcG9ydCB7Cj4gCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFu
a3MuCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
