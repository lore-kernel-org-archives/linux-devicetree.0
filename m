From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] ARM: zynq: Add #io-channel-cells to (x)adc node for
 iio-hwmon
Date: Thu, 16 Mar 2017 17:16:14 +0100
Message-ID: <e6da3f38-7039-66e5-5b9d-a44ff42aa9c9@xilinx.com>
References: <1489003884-2489-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489003884-2489-1-git-send-email-mdf@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Moritz Fischer <mdf@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Julia Cartwright <julia@ni.com>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiA4LjMuMjAxNyAyMToxMSwgTW9yaXR6IEZpc2NoZXIgd3JvdGU6Cj4gRml4Cj4gCj4g
T0Y6IC9paW9faHdtb246IGNvdWxkIG5vdCBnZXQgI2lvLWNoYW5uZWwtY2VsbHMgZm9yCj4gL2Ft
YmEvYWRjQGY4MDA3MTAwCj4gT0Y6IC9paW9faHdtb246IGNvdWxkIG5vdCBnZXQgI2lvLWNoYW5u
ZWwtY2VsbHMgZm9yCj4gL2FtYmEvYWRjQGY4MDA3MTAwCj4gT0Y6IC9paW9faHdtb246IGNvdWxk
IG5vdCBnZXQgI2lvLWNoYW5uZWwtY2VsbHMgZm9yCj4gL2FtYmEvYWRjQGY4MDA3MTAwCj4gCj4g
YnkgYWRkaW5nIHRoZSAjaW8tY2hhbm5lbC1jZWxscyBwcm9wZXJ0eS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNb3JpdHogRmlzY2hlciA8bWRmQGtlcm5lbC5vcmc+Cj4gQ2M6IE1pY2hhbCBTaW1layA8
bWljaGFsLnNpbWVrQHhpbGlueC5jb20+Cj4gQ2M6IFPDtnJlbiBCcmlua21hbm4gPHNvcmVuLmJy
aW5rbWFubkB4aWxpbnguY29tPgo+IENjOiBKdWxpYSBDYXJ0d3JpZ2h0IDxqdWxpYUBuaS5jb20+
Cj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiAtLS0KPiAKPiBDaGFuZ2VzIGZyb20gdjE6Cj4gLSBmaXggbWVzc2VkIHVw
IGNvbW1pdCBtZXNzYWdlCj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAwMC5kdHNp
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy96eW5xLTcwMDAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5
bnEtNzAwMC5kdHNpCj4gaW5kZXggZjNhYzliZi4uOTgyMzNhOCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy96eW5xLTcwMDAuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5
bnEtNzAwMC5kdHNpCj4gQEAgLTcyLDYgKzcyLDcgQEAKPiAgCQkJaW50ZXJydXB0cyA9IDwwIDcg
ND47Cj4gIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Owo+ICAJCQljbG9ja3MgPSA8JmNs
a2MgMTI+Owo+ICsJCQkjaW8tY2hhbm5lbC1jZWxscyA9IDwxPjsKPiAgCQl9Owo+ICAKPiAgCQlj
YW4wOiBjYW5AZTAwMDgwMDAgewo+IAoKSSB0aGluayBpdCB3aWxsIGJlIGdvb2QgdG8gdGhlIG5l
eHQgc3RlcCB0b28uCkl0IG1lYW5zIGFsc28gYWRkIGlpby1od21vbiBub2RlIHRvby4KCldoYXQg
ZG8geW91IHRoaW5rPwoKVGhhbmtzLApNaWNoYWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
