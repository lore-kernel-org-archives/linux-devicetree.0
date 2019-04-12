From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCHv5 4/6] PCI: mobiveil: Add PCIe Gen4 RC driver for NXP
 Layerscape SoCs
Date: Fri, 12 Apr 2019 09:00:41 -0500
Message-ID: <20190412140041.GA141472@google.com>
References: <20190412095332.41370-1-Zhiqiang.Hou@nxp.com>
 <20190412095332.41370-5-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190412095332.41370-5-Zhiqiang.Hou@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDk6NTI6NTBBTSArMDAwMCwgWi5xLiBIb3Ugd3JvdGU6
Cj4gRnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4KPiAKPiBUaGlzIFBD
SWUgY29udHJvbGxlciBpcyBiYXNlZCBvbiB0aGUgTW9iaXZlaWwgR1BFWCBJUCwgd2hpY2ggaXMK
PiBjb21wYXRpYmxlIHdpdGggdGhlIFBDSSBFeHByZXNz4oSiIEJhc2UgU3BlY2lmaWNhdGlvbiwg
UmV2aXNpb24gNC4wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcu
SG91QG54cC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1pbmdodWFuIExpYW4gPE1pbmdodWFuLkxpYW5A
bnhwLmNvbT4KPiAtLS0KPiBWNToKPiAgLSBDb3JyZWN0ZWQgdGhlIHN1YmplY3QuCj4gIC0gQ29y
cmVjdGVkIDIgdHlwb3MuCj4gIC0gVXBkYXRlZCB0aGUgQ29weXJpZ2h0IGFuZCBkcml2ZXIgZGVz
Y3JpcHRpb24uCj4gIC0gQ2hhbmdlZCB0byB1c2UgQklUKHgpIHRvIGRlZmluZSB2ZXJpb3VzIGZ1
bmN0aW9ucyBvZiByZWdpc3RlcidzIGJpdHMuCj4gIC0gVW5pZmllZCB0aGUgY2FwaXRhbGl6YXRp
b24gb2YgZXJyb3IgaW5mby4KPiAgLSBDaGFuZ2VkIHRoZSBJUlEgaGFuZGxlciBuYW1lIHRvIGxz
X3BjaWVfZzRfaXNyKCkuCj4gIC0gQ2hhbmdlICdpcnEnIHRvICdJUlEnIGluIGVycm9yIGluZm8u
Cj4gIC0gVHJpbW1lZCBzb21lIGZ1bmN0aW9ucyB3aXRob3V0IGZ1bmN0aW9uYWxpdHkgY2hhbmdl
Lgo+IAo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2ZWlsL0tjb25maWcgICAgICAgfCAg
MTAgKwo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2ZWlsL01ha2VmaWxlICAgICAgfCAg
IDEgKwoKPiAgLi4uL2NvbnRyb2xsZXIvbW9iaXZlaWwvcGNpLWxheWVyc2NhcGUtZ2VuNC5jIHwg
MjU2ICsrKysrKysrKysrKysrKysrKwoKSSB3b3VsZCBwcm9iYWJseSBuYW1lIHRoaXMgInBjaWUt
bGF5ZXJzY2FwZS1nZW40LmMiICgicGNpZSIgaW5zdGVhZCBvZgoicGNpIiksIHNpbmNlIHRoYXQn
cyBtb3JlIHR5cGljYWwgYW5kIHRoaXMgcmVhbGx5IGlzIFBDSWUtc3BlY2lmaWMuCgo+ICsjZGVm
aW5lIFBDSUVfUEZfREJHCQkJMHg3ZmMKPiArI2RlZmluZSBQRl9EQkdfTFRTU01fTUFTSwkJMHgz
Zgo+ICsjZGVmaW5lIFBGX0RCR19XRQkJCUJJVCgzMSkKPiArI2RlZmluZSBQRl9EQkdfUEFCUgkJ
CUJJVCgyNykKPiArCj4gKyNkZWZpbmUgTFNfUENJRV9HNF9MVFNTTV9MMAkJMHgyZCAvKiBMMCBz
dGF0ZSAqLwoKTWF5YmUgcmVuYW1lIHRoaXMgYW5kIG1vdmUgaXQgdG8gbWFrZSBpdCBvYnZpb3Vz
IHRoYXQgaXQncyByZWxhdGVkIHRvClBGX0RCR19MVFNTTV9NQVNLPwoKPiArCQlkZXZfZXJyKGRl
diwgIlBvbGwgUEFCUlNUJlBBQkFDVCB0aW1lb3V0LlxuIik7CgpObyBuZWVkIGZvciBwdW5jdHVh
dGlvbiBhdCBlbmQgb2YgbWVzc2FnZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
