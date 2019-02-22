From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Fri, 22 Feb 2019 12:10:13 +0200
Message-ID: <69b430b2-42a8-4c5a-0a6c-a05f2416fa0b@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <41a9780b-d971-2b20-1ecb-c55852292563@ti.com>
 <20190218143508.GD15711@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218143508.GD15711@atomide.com>
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
To: Tony Lindgren <tony@atomide.com>, Lokesh Vutla <lokeshvutla@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, marc.zyngier@arm.com, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgpPbiAxOC8wMi8yMDE5IDE2LjM1LCBUb255IExpbmRncmVuIHdyb3RlOgo+ICogTG9rZXNoIFZ1
dGxhIDxsb2tlc2h2dXRsYUB0aS5jb20+IFsxOTAyMTYgMDM6MzBdOgo+PiBPbiAyLzEyLzIwMTkg
MToxMiBQTSwgTG9rZXNoIFZ1dGxhIHdyb3RlOgo+Pj4gK1RJU0NJIEludGVycnVwdCBSb3V0ZXIg
Tm9kZToKPj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiArLSBjb21wYXRpYmxl
OgkJTXVzdCBiZSAidGksc2NpLWludHIiLgo+Pj4gKy0gaW50ZXJydXB0LWNvbnRyb2xsZXI6CUlk
ZW50aWZpZXMgdGhlIG5vZGUgYXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIKPj4+ICstICNpbnRl
cnJ1cHQtY2VsbHM6CVNwZWNpZmllcyB0aGUgbnVtYmVyIG9mIGNlbGxzIG5lZWRlZCB0byBlbmNv
ZGUgYW4KPj4+ICsJCQlpbnRlcnJ1cHQgc291cmNlLiBUaGUgdmFsdWUgc2hvdWxkIGJlIDQuCj4+
PiArCQkJRmlyc3QgY2VsbCBzaG91bGQgY29udGFpbiB0aGUgVElTQ0kgZGV2aWNlIElEIG9mIHNv
dXJjZQo+Pj4gKwkJCVNlY29uZCBjZWxsIHNob3VsZCBjb250YWluIHRoZSBpbnRlcnJ1cHQgc291
cmNlIG9mZnNldAo+Pj4gKwkJCXdpdGhpbiB0aGUgZGV2aWNlCj4+PiArCQkJVGhpcmQgY2VsbCBz
cGVjaWZpZXMgdGhlIHRyaWdnZXIgdHlwZSBhcyBkZWZpbmVkCj4+PiArCQkJaW4gaW50ZXJydXB0
cy50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCj4+PiArCQkJRm91cnRoIGNlbGwgc2hvdWxkIGJlIDEg
aWYgdGhlIGlycSBpcyBjb21pbmcgZnJvbQo+Pj4gKwkJCWludGVycnVwdCBhZ2dyZWdhdG9yIGVs
c2UgMC4KPj4+ICstIHRpLHNjaToJCVBoYW5kbGUgdG8gVEktU0NJIGNvbXBhdGlibGUgU3lzdGVt
IGNvbnRyb2xsZXIgbm9kZS4KPj4+ICstIHRpLHNjaS1kc3QtaWQ6CVRJU0NJIGRldmljZSBJRCBv
ZiB0aGUgZGVzdGluYXRpb24gSVJRIGNvbnRyb2xsZXIuCj4+Cj4+IFBsZWFzZSBoZWxwIG1lIGhl
cmUuIEFzIHNhaWQgdGhpcyBpcyB0aGUgVElTQ0kgZGV2aWNlIGlkIGZvciB0aGUgaG9zdAo+PiBp
bnRlcnJ1cHQgY29udHJvbGxlci4gV2hpbGUgc2VuZGluZyBtZXNzYWdlIHRvIHRoZSBzeXN0ZW0g
Y28tcHJvY2Vzc29yCj4+IHRoaXMgSUQgbmVlZHMgdG8gYmUgc3BlY2lmaWVkIHNvIHRoYXQgdGhl
IGlycSByb3V0ZSBnZXRzIGRpc2NvdmVyZWQgYW5kCj4+IGNvbmZpZ3VyZWQuIEF0bGVhc3Qgd2l0
aCB0aGUgY3VycmVudCBkZXNpZ24gZGV2aWNlIElkcyBhcmUgbm90Cj4+IGRpc2NvdmVyYWJsZS4g
Q2FuIHlvdSBtZW50aW9uIHdoYXQgY2FuIGJlIGltcHJvdmVkIGhlcmU/IElzIHRoZXJlIGFueQo+
PiBzdWNoIGV4YW1wbGUgd2hlcmUgYSBmaXJtd2FyZSBzdXBwb3J0cyBxdWVyeWluZyB0aGUgZGVp
dmNlIGlkcz8KPj4KPj4gQWxzbyBkbyB5b3UgaGF2ZSBhbnkgZnVydGhlciBjb21tZW50cyBvbiB0
aGlzIHBhdGNoPwo+IAo+IE5vIHJlZyBwcm9wZXJ0eSBhYm92ZS4gU28gaWYgdGhlIGludGVycnVw
dCByb3V0ZXIgaXMgbm90IGFjY2Vzc2libGUKPiBieSBMaW51eCBsaWtlIHlvdSdyZSBzYXlpbmcs
IHlvdSBzaG91bGQgbm90IHNldCB1cCBhIGR0cyBub2RlIGZvcgo+IGl0IGF0IGFsbC4KCkl0IGlz
IGFjY2Vzc2libGUgdmlhIHRpc2NpIGJ1dCBubyBkaXJlY3QgcmVnaXN0ZXIgYWNjZXNzLgoKPiAK
PiBSZWdhcmRzLAo+IAo+IFRvbnkKPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
