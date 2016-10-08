From: Meng Yi <meng.yi@nxp.com>
Subject: RE: [PATCH v5] drm/fsl-dcu: Implement gamma_lut atomic crtc properties
Date: Sat, 8 Oct 2016 02:16:48 +0000
Message-ID: <DB6PR0401MB2631AA82F068F013DBA7AE84ECD90@DB6PR0401MB2631.eurprd04.prod.outlook.com>
References: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
 <f539ebe1fe2086d67e74e5b7e8ce2e6a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f539ebe1fe2086d67e74e5b7e8ce2e6a@agner.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

SGkgU3RlZmFuLAoKPiA+IEBAIC02LDYgKzYsMTIgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiA+
ICAJKiAiZnNsLHZmNjEwLWRjdSIuCj4gPgo+ID4gIC0gcmVnOgkJCUFkZHJlc3MgYW5kIGxlbmd0
aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciBkY3UuCj4gPiArCQkJTXVzdCBjb250YWluIGZvdXIg
YWRkcmVzcy9sZW5ndGggdHVwbGVzOgo+ID4gKwkJCTEuIFJlZ2lzdGVyIGFkZHJlc3Mgc3BhY2UK
PiA+ICsJCQkyLiBQYWxldHRlL1RpbGUgYWRkcmVzcyBzcGFjZQo+ID4gKwkJCTMuIEdhbW1hIGFk
ZHJlc3Mgc3BhY2UKPiA+ICsJCQk0LiBDdXJzb3IgYWRkcmVzcyBzcGFjZQo+ID4gKy0gcmVnLW5h
bWVzOgkJU2hvdWxkIGJlICJyZWdzIiwgInBhbGV0dGUiLCAiZ2FtbWEiIGFuZAo+ICJjdXJzb3Ii
Cj4gCj4gTG9va3MgZ29vZCB0byBtZSwgZGV2aWNlIHRyZWUgZm9sa3M/Cj4gCgpXZSBoYWQgb24g
aG9saWRheXMgYW5kIHNvcnJ5IGZvciByZXBseSBsYXRlLCBkZXZpY2UgdHJlZSdzIG1haWxpbmcg
bGlzdCBhbmQgbWFpbnRhaW5lcnMgYXJlIGluY2x1ZGVkLgoKQmVzdCBSZWdhcmRzLApNZW5nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
