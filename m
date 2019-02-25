From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: stm32: Add Vivante GPU support on
 STM32MP157c
Date: Mon, 25 Feb 2019 16:48:34 +0100
Message-ID: <44bb72aa-8e49-4ec5-dd9a-5fce6f0bce29@st.com>
References: <1550246316-9747-1-git-send-email-pierre-yves.mordret@st.com>
 <1550246316-9747-2-git-send-email-pierre-yves.mordret@st.com>
 <1550247118.2546.56.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550247118.2546.56.camel@pengutronix.de>
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
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Philippe Cornu <philippe.cornu@st.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SGkgTHVjYXMKCnNvcnJ5IGZvciB0aGUgZGVsYXkgOiB3aW50ZXIgc2Vhc29uIDopCgpPbiAyLzE1
LzE5IDU6MTEgUE0sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+IEhpIFBpZXJyZS1ZdmVzLAo+IAo+IEFt
IEZyZWl0YWcsIGRlbiAxNS4wMi4yMDE5LCAxNjo1OCArMDEwMCBzY2hyaWViIFBpZXJyZS1ZdmVz
IE1PUkRSRVQ6Cj4+IEFwcGVuZCBWaXZhbnRlIEdQVSBEVCBjb25maWd1cmF0aW9uLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBQaWVycmUtWXZlcyBNT1JEUkVUIDxwaWVycmUteXZlcy5tb3JkcmV0QHN0
LmNvbT4KPj4gLS0tCj4+IMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaSB8IDEw
ICsrKysrKysrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kKPj4gaW5kZXggZjhiYmZmZi4uMjk1NDBiYyAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaQo+PiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpCj4+IEBAIC0xMTA2LDYgKzExMDYsMTYg
QEAKPj4+IMKgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+IMKgCQl9Owo+PiDCoAo+PiArCQln
cHU6IGdwdUA1OTAwMDAwMCB7Cj4+ICsJCQljb21wYXRpYmxlID0gInZpdmFudGUsZ2MiOwo+PiAr
CQkJcmVnID0gPDB4NTkwMDAwMDAgMHg4MDA+Owo+PiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDEwOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gKwkJCWNsb2NrcyA9IDwmcmNjIEdQVT4sIDwm
cmNjIEdQVV9LPjsKPj4gKwkJCWNsb2NrLW5hbWVzID0gImJ1cyIgLCJjb3JlIjsKPiAKPiBJcyB0
aGlzIGEgMkQgb25seSBjb3JlPyBJZiBpdCBpcyBhbHNvIDNEIGNhcGFibGUgdGhlIGJpbmRpbmcg
c2F5cyB5b3UKPiBuZWVkIHRvIHNwZWNpZnkgdGhlIHNoYWRlciBjbG9jayAobWF5IGJlIHRoZSBz
YW1lIGNsb2NrIGZlZWRpbmcgdGhlCj4gY29yZSkuCgpZZXMsIHRoaXMgaXMgYSAzRCBjb3JlLgpB
cyBmb3IgInNoYWRlciIgY2xvY2sgYm90aCAiY29yZSIgYW5kICJzaGFkZXIiIGFyZSBjb25uZWN0
ZWQgaW50ZXJuYWxseS4gVGhpcyBpcwp3aHkgbm8gInNoYWRlciIgaW5wdXQgY2xvY2sgaXMgc2Vl
bi4KTm9uZXRoZWxlc3Mgd2UgbWF5IGFkZCBpdCBmb3IgYmluZGluZ3MgY29tcGxpYW5jZSBidXQg
ZnJvbSBTVE0zMk1QMSBwb3YgdGhpcwp3b24ndCBtYWtlIGFueSBjaGFuZ2VzLgoKSG9wZSBpdCBj
bGFyaWZpZXMuCgpSZWdhcmRzCj4gCj4gUmVnYXJkcywKPiBMdWNhcwo+IAo+PiArCQkJcmVzZXRz
ID0gPCZyY2MgR1BVX1I+Owo+PiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gKwkJfTsKPj4g
Kwo+PiDCoAkJZHNpOiBkc2lANWEwMDAwMDAgewo+PiDCoAkJCWNvbXBhdGlibGUgPSAic3Qsc3Rt
MzItZHNpIjsKPj4gwqAJCQlyZWcgPSA8MHg1YTAwMDAwMCAweDgwMD47CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
