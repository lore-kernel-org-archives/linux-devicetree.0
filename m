From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v3 3/5] Documentation: DT: add i.MX EPIT timer binding
Date: Wed, 30 May 2018 10:38:23 +0300
Message-ID: <5d71aced-cd2f-3f01-25b0-d87788f22c32@mentor.com>
References: <20180529170436.22711-1-peron.clem@gmail.com>
 <20180529170436.22711-4-peron.clem@gmail.com>
 <7f2f8b6b-b7f6-99c1-fc5f-a7628a751fdc@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7f2f8b6b-b7f6-99c1-fc5f-a7628a751fdc@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gMDUvMzAvMjAxOCAxMDoyNyBBTSwgVmxhZGltaXIgWmFwb2xza2l5IHdyb3RlOgo+IEhpIENs
w6ltZW50LAo+IAo+IE9uIDA1LzI5LzIwMTggMDg6MDQgUE0sIENsw6ltZW50IFDDqXJvbiB3cm90
ZToKPj4gRnJvbTogQ2zDqW1lbnQgUGVyb24gPGNsZW1lbnQucGVyb25AZGV2aWFsZXQuY29tPgo+
Pgo+PiBBZGQgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50IGZvciBOWFAncyBpLk1YIFNvQyBz
cGVjaWZpYwo+PiBFUElUIHRpbWVyIGRyaXZlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgUGVyb24gPGNsZW1lbnQucGVyb25AZGV2aWFsZXQuY29tPgo+PiAtLS0KPj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDZxLGVwaXQudHh0ICB8IDI0ICsrKysrKysrKysrKysr
KysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDZxLGVw
aXQudHh0Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svaW14NnEsZXBpdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svaW14NnEsZXBpdC50eHQKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5hODRhNjBjNmFlMzUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14NnEsZXBpdC50eHQKPiAKPiBU
aGUgZmlsZSBzaG91bGQgYmUgcmVuYW1lZCB0byBhIG1vcmUgZ2VuZXJpYyBuYW1lIGxpa2UgJ2lt
eCxlcGl0LnR4dCcKPiBvciAnaW14MzEsZXBpdC50eHQnLgo+IAo+IEFsc28gbm90ZSB0aGF0IHRo
ZSBmb2xkZXIgaXMgaW5jb3JyZWN0bHkgc2VsZWN0ZWQsIGl0IG11c3QgYmUKPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvCj4gCgpBbmQgbGludXgtY2xrIG1haWxpbmcg
bGlzdCBmb3IgcHVibGlzaGluZyBzZWVtcyB0byBiZSBpbXByb3BlciBvbmUsCmluc3RlYWQgcGxl
YXNlIGFkZCBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gYW5kClRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB0byB0aGUgbGlzdCBvZiBhZGRyZXNz
ZWVzLAphbmQgdGhlIHByb3BlciBtYWlsaW5nIGxpc3QgYWRkcmVzcyBpcyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCgotLQpXaXRoIGJlc3Qgd2lzaGVzLApWbGFkaW1pcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
