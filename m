From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
Date: Fri, 10 Feb 2017 08:23:15 +0000
Message-ID: <1486714994.7530.11.camel@synopsys.com>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20170210060606.GO19244@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170210060606.GO19244@localhost>
Content-Language: en-US
Content-ID: <9225940094A559439E8A81D2067EA431@internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: "vinod.koul@intel.com" <vinod.koul@intel.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

SGkgVmlub2QsDQoNCk9uIEZyaSwgMjAxNy0wMi0xMCBhdCAxMTozNiArMDUzMCwgVmlub2QgS291
bCB3cm90ZToNCj4gT24gV2VkLCBKYW4gMjUsIDIwMTcgYXQgMDY6MzQ6MTdQTSArMDMwMCwgRXVn
ZW5peSBQYWx0c2V2IHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZv
ciB0aGUgRFcgQVhJIERNQUMgY29udHJvbGxlci4NCj4gPiANCj4gPiBEVyBBWEkgRE1BQyBpcyBh
IHBhcnQgb2YgdXBjb21pbmcgZGV2ZWxvcG1lbnQgYm9hcmQgZnJvbSBTeW5vcHN5cy4NCj4gDQo+
IEhvdyBkaWZmZXJlbnQgaXMgQVhJIGZyb20gRFcgU3lub3BzeXM/DQoNClRoZXNlIGFyZSAyIGNv
bXBsZXRlbHkgdW5yZWxhdGVkIHByb2R1Y3RzIGZyb20gU3lub3BzeXMsIHNlZToNCsKgYSnCoGh0
dHBzOi8vd3d3LnN5bm9wc3lzLmNvbS9kdy9pcGRpci5waHA/ZHM9YW1iYV9haGJfZG1hDQrCoGIp
wqBodHRwczovL3d3dy5zeW5vcHN5cy5jb20vZHcvaXBkaXIucGhwP2RzPWFtYmFfYXhpX2RtYQ0K
DQo+IElzIHRoZSBzcGVjIHB1YmxpY2x5IGF2YWlsYWJsZT8NCg0KSSdtIGFmcmFpZCBub3QuIFN5
bm9wc3lzIGN1c3RvbWVycyBtYXkgZ2V0IERXIEFYSSBETUFDIGRhdGFib29rIGhlcmU6DQpodHRw
czovL3d3dy5zeW5vcHN5cy5jb20vZHcvZG9jLnBocC9paXAvRFdfYXhpX2RtYWMvbGF0ZXN0L2Rv
Yy9EV19heGlfZG1hY19kYXRhYm9vay5wZGYNCg0KSnVzdCBhIHNpZGUgbm90ZSAiRFciIHByZWZp
eCBzdGFuZHMgZm9yIERlc2lnbldhcmUgYW5kIGFwcGxpY2FibGUNCnRvIG1vc3QgaWYgbm90IGFs
bCBJUCBsaWJzIGZyb20gU3lub3BzeXMgc28gaGVyZSB3ZSdyZSB0YWxraW5nIGFib3V0DQpBSEIg
RE1BQyB2cyBBWEkgRE1BQy4gU3RpbGwgbXkgdW5kZXJzdGFuZGluZyBpcyBkaWZmZXJlbnQgYnVz
IHR5cGUgaXMNCm5vdCB0aGUgb25lIGFuZCBvbmx5IGRpZmZlcmVuY2UgYnV0IGp1c3QgdGhlIG9u
ZSB3aGljaCBtaWdodCBzaW1wbGlmeQ0Kc2VsZWN0aW9uIG9mIG9uZSBvciBhbm90aGVyIElQIGJs
b2NrLg0KDQotQWxleGV5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmM=
