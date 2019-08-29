From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: stm32: add ddrperfm on stm32mp157c
Date: Thu, 29 Aug 2019 10:48:45 +0200
Message-ID: <8e3170a3-c814-d06e-f1f9-6d4e6a4bed71@st.com>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
 <1566918464-23927-6-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566918464-23927-6-git-send-email-gerald.baeza@st.com>
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
To: Gerald BAEZA <gerald.baeza@st.com>, "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VyYWxkCgpPbiA4LzI3LzE5IDU6MDggUE0sIEdlcmFsZCBCQUVaQSB3cm90ZToKPiBUaGUg
RERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVkZGVkCj4gaW4gU1RN
MzJNUDEgU09DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmFsZCBCYWV6YSA8Z2VyYWxkLmJhZXph
QHN0LmNvbT4KPiAtLS0KPiAgwqBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIHwg
OCArKysrKysrKwo+ICDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaSAKPiBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kKPiBpbmRleCAwYzRlNmViLi42ZWE2OTMzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpCj4gQEAgLTEzNzgsNiArMTM3OCwxNCBAQAo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZHJwZXJmbTogcGVyZkA1YTAwNzAwMCB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItZGRy
LXBtdSI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDVhMDA3MDAwIDB4NDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZyY2MgRERSUEVSRk0+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXNldHMgPSA8JnJjYyBERFJQRVJGTV9S
PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVz
ID0gIm9rYXkiOwoKTm8gbmVlZCB0byBhZGQgInN0YXR1cyA9ICJva2F5IiIgaGVyZS4KCnJlZ2Fy
ZHMKQWxleAoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ICsKPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXNhcnQxOiBzZXJpYWxANWMwMDAwMDAgewo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMmg3LXVhcnQiOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NWMwMDAwMDAgMHg0MDA+Owo+IC0tIAo+IDIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
