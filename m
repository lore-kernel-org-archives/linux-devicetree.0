From: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Date: Thu, 5 Sep 2019 12:57:34 +0200
Message-ID: <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
 <20190905082134.GY5475@paasikivi.fi.intel.com>
 <20190905101908.GB2680@smile.fi.intel.com>
 <20190905104001.GZ5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190905104001.GZ5475@paasikivi.fi.intel.com>
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
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, sam.hung@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gOS81LzE5IDEyOjQwIFBNLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gT24gVGh1LCBTZXAgMDUs
IDIwMTkgYXQgMDE6MTk6MDhQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+PiBPbiBU
aHUsIFNlcCAwNSwgMjAxOSBhdCAxMToyMTozNEFNICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6
Cj4+PiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAwMzoyMTo0MlBNICswODAwLCBkb25nY2h1bi56
aHVAbWVkaWF0ZWsuY29tIHdyb3RlOgo+Pj4+IEZyb206IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4u
emh1QG1lZGlhdGVrLmNvbT4KPj4KPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkIGR3OTc2OF9pZF90YWJsZVtdID0gewo+Pj4+ICsJeyBEVzk3NjhfTkFNRSwgMCB9LAo+Pj4+
ICsJeyB9LAo+Pj4KPj4+IENvdWxkIHlvdSBkcm9wIHRoZSBJwrJDIElEIHRhYmxlPwo+Pgo+PiBC
dXQgd2h5Pwo+PiBJdCB3aWxsIGFsbG93IHlvdSB0byBpbnN0YW5jaWF0ZSB0aGUgZGV2aWNlIGZy
b20gdXNlciBzcGFjZS4KClllcywgdGhlIEkyQyBkZXZpY2UgdGFibGUgaXMgc3RpbGwgbmVlZGVk
IGlmIHRoZSBkZXZpY2UgY2FuIGJlIGluc3RhbnRpYXRlZApmcm9tIHVzZXItc3BhY2UgdXNpbmcg
dGhlIHN5c2ZzIGludGVyZmFjZSwgb3Igb3RoZXJ3aXNlIHRoZSBtb2R1bGUgd29uJ3QgYmUKYXV0
b21hdGljYWxseSBsb2FkZWQuCgpLaWVyYW4gcG9zdGVkIGEgIltQQVRDSCBSRkNdIG1vZHBvc3Q6
IFN1cHBvcnQgSTJDIEFsaWFzZXMgZnJvbSBPRiB0YWJsZXMiCnBhdGNoIHRoYXQgYWRkcyBhIE1P
RFVMRV9ERVZJQ0VfVEFCTEUoaTJjX29mLCAuLikgbWFjcm8gc28gbW9kcG9zdCBjb3VsZAphZGQg
bGVnYWN5IEkyQyBtb2RhbGlhcyB1c2luZyB0aGUgaW5mb3JtYXRpb24gaW4gdGhlIE9GIGRldmlj
ZSBJRCB0YWJsZXM6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDM4ODYx
LwoKSWYgdGhhdCBsYW5kcywgdGhlbiB3ZSBjb3VsZCBnZXQgcmlkIG9mIHRoZSBJMkMgZGV2aWNl
IHRhYmxlcyBhbHRvZ2V0aGVyCmZvciBub24tbGVnYWN5IEkyQyBkcml2ZXJzLgoKPiAKPiBUaGUg
ZGV2aWNlIGlzIHN1cHBvc2VkIHRvIGJlIHByZXNlbnQgaW4gRFQgKG9yIEFDUEkgdGFibGVzKSBh
bHJlYWR5Lgo+CgpBZ3JlZWQuIEFsc28gYnkgbG9va2luZyBhdCB0aGUgZHJpdmVyJ3MgcHJvYmUg
ZnVuY3Rpb24gSSBzZWUgdGhhdCB0aGUKZGV2aWNlIGxvb2t1cHMgYSAndmluJyBhbmQgJ3ZkZCcg
cmVndWxhdG9ycyBzdXBwbGllcyBhbmQgaXQgZmFpbHMgaWYKYXJlbid0IGRlZmluZWQsIHNvIGl0
IGNhbid0IGJlIGluc3RhbnRpYXRlZCBmcm9tIHVzZXItc3BhY2UgYW55d2F5cy4KCkJUVywgdGhl
c2UgdHdvIHJlZ3VsYXRvcnMgc3VwcGxpZXMgc2hvdWxkIGJlIGxpc3RlZCBhcyAndmluLXN1cHBs
eScKYW5kICd2ZGQtc3VwcGx5JyBhcyByZXF1aXJlZCBwcm9wZXJ0aWVzIGluIHRoZSBEVCBiaW5k
aW5nIGRvY3VtZW50LgoKQmVzdCByZWdhcmRzLAotLSAKSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
ClNvZnR3YXJlIEVuZ2luZWVyIC0gRGVza3RvcCBIYXJkd2FyZSBFbmFibGVtZW50ClJlZCBIYXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
