From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Date: Thu, 29 Aug 2019 10:43:18 +0530
Message-ID: <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
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
To: Andrew Murray <andrew.murray@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>, "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

R3VzdGF2bywKCk9uIDI3LzA4LzE5IDY6NTUgUE0sIEFuZHJldyBNdXJyYXkgd3JvdGU6Cj4gT24g
U2F0LCBBdWcgMjQsIDIwMTkgYXQgMTI6MDg6NDBBTSArMDAwMCwgWGlhb3dlaSBCYW8gd3JvdGU6
Cj4+Cj4+Cj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4gRnJvbTogQW5kcmV3IE11
cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPgo+Pj4gU2VudDogMjAxOeW5tDjmnIgyM+aXpSAy
MTo1OAo+Pj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPgo+Pj4gQ2M6IGJo
ZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5j
b207Cj4+PiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47
IGtpc2hvbkB0aS5jb207Cj4+PiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY287IGFybmRAYXJuZGIu
ZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBNLmguCj4+PiBMaWFuIDxtaW5naHVhbi5s
aWFuQG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kKPj4+IFph
bmcgPHJveS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsKPj4+IGd1c3Rhdm8u
cGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOwo+Pj4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7Cj4+
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0
cy5vemxhYnMub3JnCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEwXSBQQ0k6IGxheWVy
c2NhcGU6IE1vZGlmeSB0aGUgTVNJWCB0byB0aGUKPj4+IGRvb3JiZWxsIHdheQo+Pj4KPj4+IE9u
IFRodSwgQXVnIDIyLCAyMDE5IGF0IDA3OjIyOjM5UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3Rl
Ogo+Pj4+IFRoZSBsYXllcnNjYXBlIHBsYXRmb3JtIHVzZSB0aGUgZG9vcmJlbGwgd2F5IHRvIHRy
aWdnZXIgTVNJWCBpbnRlcnJ1cHQKPj4+PiBpbiBFUCBtb2RlLgo+Pj4+Cj4+Pgo+Pj4gSSBoYXZl
IG5vIHByb2JsZW1zIHdpdGggdGhpcyBwYXRjaCwgaG93ZXZlci4uLgo+Pj4KPj4+IEFyZSB5b3Ug
YWJsZSB0byBhZGQgdG8gdGhpcyBtZXNzYWdlIGEgcmVhc29uIGZvciB3aHkgeW91IGFyZSBtYWtp
bmcgdGhpcwo+Pj4gY2hhbmdlPyBEaWQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycSBub3Qgd29y
ayB3aGVuIGZ1bmNfbm8gIT0gMD8gT3IgZGlkCj4+PiBpdCB3b3JrIHlldCBkd19wY2llX2VwX3Jh
aXNlX21zaXhfaXJxX2Rvb3JiZWxsIGlzIG1vcmUgZWZmaWNpZW50Pwo+Pgo+PiBUaGUgZmFjdCBp
cyB0aGF0LCB0aGlzIGRyaXZlciBpcyB2ZXJpZmllZCBpbiBsczEwNDZhIHBsYXRmb3JtIG9mIE5Y
UCBiZWZvcmUsIGFuZCBsczEwNDZhIGRvbid0Cj4+IHN1cHBvcnQgTVNJWCBmZWF0dXJlLCBzbyBJ
IHNldCB0aGUgbXNpeF9jYXBhYmxlIG9mIHBjaV9lcGNfZmVhdHVyZXMgc3RydWN0IGlzIGZhbHNl
LAo+PiBidXQgaW4gb3RoZXIgcGxhdGZvcm0sIGUuZy4gbHMxMDg4YSwgaXQgc3VwcG9ydCB0aGUg
TVNJWCBmZWF0dXJlLCBJIHZlcmlmaWVkIHRoZSBNU0lYCj4+IGZlYXR1cmUgaW4gbHMxMDg4YSwg
aXQgaXMgbm90IE9LLCBzbyBJIGNoYW5nZWQgdG8gYW5vdGhlciB3YXkuIFRoYW5rcy4KPiAKPiBS
aWdodCwgc28gdGhlIGV4aXN0aW5nIHBjaS1sYXllcnNjYXBlLWVwLmMgZHJpdmVyIG5ldmVyIHN1
cHBvcnRlZCBNU0lYIHlldCBpdAo+IGVycm9uZW91c2x5IGhhZCBhIHN3aXRjaCBjYXNlIHN0YXRl
bWVudCB0byBjYWxsIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgd2hpY2gKPiB3b3VsZCBuZXZl
ciBnZXQgdXNlZC4KPiAKPiBOb3cgdGhhdCB3ZSdyZSBhZGRpbmcgYSBwbGF0Zm9ybSB3aXRoIE1T
SVggc3VwcG9ydCB0aGUgZXhpc3RpbmcKPiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxIGRvZXNu
J3Qgd29yayAoZm9yIHRoaXMgcGxhdGZvcm0pIHNvIHdlIGFyZSBhZGRpbmcgYQo+IGRpZmZlcmVu
dCBtZXRob2QuCgpHdXN0YXZvLCBjYW4geW91IGNvbmZpcm0gZHdfcGNpZV9lcF9yYWlzZV9tc2l4
X2lycSgpIHdvcmtzIGZvciBkZXNpZ253YXJlIGFzIGl0CmRpZG4ndCB3b3JrIGZvciBib3RoIG1l
IGFuZCBYaWFvd2VpPwoKVGhhbmtzCktpc2hvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
