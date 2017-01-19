From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v11 10/12] drm/mediatek: add non-continuous clock mode
 and EOT packet control
Date: Thu, 19 Jan 2017 09:42:06 +0800
Message-ID: <1484790126.19089.0.camel@mtksdaap41>
References: <1484117473-46644-1-git-send-email-yt.shen@mediatek.com>
 <1484117473-46644-11-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484117473-46644-11-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFlUOgoKT24gV2VkLCAyMDE3LTAxLTExIGF0IDE0OjUxICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggd2lsbCB1cGRhdGUgZHNpIGNsb2NrIGNvbnRyb2wgbWV0aG9kLgo+IDEu
IGRzaSBub24tY29udGludWUgY2xvY2sgbW9kZSB3aWxsIGVuaGFuY2UgYW50aXN0YXRpYyBlZmZl
Y3QgZm9yIHBhbmVsCj4gMi4gRU9UIHBhY2tldCBjb250cm9sIHdpbGwganVkZ2Ugd2hldGhlciBk
c2kgc2VuZCBlbmQgb2YgcGFja2V0IG9yIG5vdAo+IGJ5IGN1c3RvbWl6ZQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IHNoYW9taW5nIGNoZW4gPHNoYW9taW5nLmNoZW5AbWVkaWF0ZWsuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPgoKQWNrZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGIzYzdmZDguLjg1ZjIyZDIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtNDMxLDYgKzQzMSw5IEBAIHN0
YXRpYyB2b2lkIG10a19kc2lfcnh0eF9jb250cm9sKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIAkJ
YnJlYWs7Cj4gIAl9Cj4gIAo+ICsJdG1wX3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9E
U0lfQ0xPQ0tfTk9OX0NPTlRJTlVPVVMpIDw8IDY7Cj4gKwl0bXBfcmVnIHw9IChkc2ktPm1vZGVf
ZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX0VPVF9QQUNLRVQpID4+IDM7Cj4gKwo+ICAJd3JpdGVsKHRt
cF9yZWcsIGRzaS0+cmVncyArIERTSV9UWFJYX0NUUkwpOwo+ICB9Cj4gIAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
