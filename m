From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: Add simple panel mode for the ARM RTSMv8
Date: Thu, 18 Oct 2018 16:18:28 +0200
Message-ID: <CACRpkdYpheqV9JjBk-SbqZaZjuTYUPpH=U1mZreoGnfvqWQmVw@mail.gmail.com>
References: <20181018122742.28896-1-linus.walleij@linaro.org>
 <2aba8a43-b590-52da-b839-d99b97aaec61@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2aba8a43-b590-52da-b839-d99b97aaec61@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mali DP Maintainers <malidp@foss.arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMzo1NiBQTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPiBPbiAxOC8xMC8xOCAxMzoyNywgTGludXMgV2FsbGVpaiB3cm90
ZToKCj4gPiBIYXZpbmcgZmFpbGVkIGFueSBhdHRlbXB0cyBhdCBhIG1vcmUgZ2VuZXJpYyBzb2x1
dGlvbiwKPiA+IEkgZmFsbCBiYWNrIHRvIHRoZSB2ZXJ5IHNwZWNpZmljIHNvbHV0aW9uOiBkZWZp
bmUgYSBzaW1wbGUKPiA+IHBhbmVsIGZvciB0aGUgQVJNIFJUU012OCBlbXVsYXRlZCBwbGF0Zm9y
bS4KPgo+ICBGcm9tIHRoZSBiaXRzIG9mIHRoZSBkaXNjdXNzaW9uIHRoYXQgSSd2ZSBjYXVnaHQg
aXQgZG9lcyBzZWVtIGxpa2UgdGhpcwo+IGZyYW1lYnVmZmVyLWdyb3ZlbGxpbmcgYnVzaW5lc3Mg
bWlnaHQgdHVybiBvdXQgdG8gYmUgZmFpcmx5IHVuaXF1ZSB0bwo+IFJUU00vRmFzdCBNb2RlbHMs
IHNvIEkgZ3Vlc3MgaXQncyBhIHJlYXNvbmFibGUgY29tcHJvbWlzZS4KClllYWggaXQncyBubyBi
aWcgZGVhbC4KCj4gKyAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhcm0scnRzbXY4LWRpc3Bs
YXkiLAo+Cj4gTml0OiBiaW5kaW5nIGRvYz8KCkkgd2FzIGFjdHVhbGx5IHRoaW5raW5nIG9mIG5v
dCBkb2N1bWVudGluZyB0aGlzIGJpbmRpbmcuCgpUaGUgRFQgYmluZGluZ3MgZGlzY3Vzc2lvbiBz
dGFsbGVkIHdpdGggc3VwcG9ydGluZyB2aXJ0dWFsIHN0dWZmIGFuZAp3ZSBhY3R1YWxseSByZWFj
aGVkIHRoZSBjb25jbHVzaW9uIGluIGEgdG90YWxseSBkaWZmZXJlbnQgZGlzY3Vzc2lvbgooYWJv
dXQgZ3Bpby1tb2NrdXAuYykgdGhhdCB0aGVyZSBpcyBhIHBsYWNlIGZvciBkZXZpY2VzIHdoaWNo
IGhhdmUKY29tcGF0aWJsZSBzdHJpbmdzIGFuZCB1c2UgdGhlIGluZnJhc3RydWN0dXJlIGJ1dCBk
b2VzIG5vdCBoYXZlCmRvY3VtZW50ZWQgYmluZGluZ3MuIFRob3NlIGRldmljZXMgd291bGQgYmUg
dmlydHVhbCBvciBzaW11bGF0aW9uCnRoaW5naWVzIHdpdGggbm8gcGh5c2ljYWwgcmVhbC13b3Js
ZCBjb3VudGVycGFydC4KCkkgZG9uJ3Qga25vdyBmb3IgMTAwJSB3aGV0aGVyIEkgZ290IHRoYXQg
cmlnaHQgc28gSSdsbCBsb29wIGluIHRoZQpEVCBtYWludGFpbmVycyBmb3IgYSBwcm9wZXIgc3Rh
dGVtZW50LgoKPiBOaXQ6ICJhcm0scnRzbS1kaXNwbGF5IiB3b3VsZCBwcm9iYWJseSBiZSBhIG1v
cmUgYWNjdXJhdGUgY2hvaWNlLCBzaW5jZQo+IHRoZSBpbXBsZW1lbnRhdGlvbiBkYXRlcyBiYWNr
IHRvIGxvbmcgYmVmb3JlIHY4IG9mIGFueXRoaW5nIHJlbGV2YW50IDspCgpXb3JrcyBmb3IgbWUg
OikgSSdsbCBzcGluIGEgdjIgd2l0aCB0aGF0IGNoYW5nZWQuCgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
