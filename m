From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add document for rockchip RGB output
 interface
Date: Mon, 9 Oct 2017 08:05:44 -0500
Message-ID: <CAL_JsqJcO6VtgYBzby+gjerODT9n6fE0aMNJXNejvvhF1nqM-Q@mail.gmail.com>
References: <1506049221-117283-1-git-send-email-hjc@rock-chips.com>
 <1506049229-117376-1-git-send-email-hjc@rock-chips.com>
 <20171003215631.rc2jsf2m3qgoltsb@rob-hp-laptop>
 <2d502a9d-e952-8afb-d2d7-45c21c36da7e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2d502a9d-e952-8afb-d2d7-45c21c36da7e@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sandy Huang <hjc@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBPY3QgOSwgMjAxNyBhdCAzOjA2IEFNLCBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPiB3cm90ZToKPiBIaSByb2IsCj4gICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KPgo+
IOWcqCAyMDE3LzEwLzQgNTo1NiwgUm9iIEhlcnJpbmcg5YaZ6YGTOgo+Pgo+PiBPbiBGcmksIFNl
cCAyMiwgMjAxNyBhdCAxMTowMDoyNkFNICswODAwLCBTYW5keSBIdWFuZyB3cm90ZToKPj4+Cj4+
PiBUaGlzIHBhdGggYWRkIHN1cHBvcnQgcnYxMTA4IHJnYiBvdXRwdXQgaW50ZXJmYWNlIGRyaXZl
ci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29t
Pgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gICAxLiByZW5hbWUgcm9ja2NoaXAscmdi
LW1vZGUgdG8gcmdiLW1vZGU7Cj4+Cj4+Cj4+IFlvdSBjYW4ndCBqdXN0IGRyb3AgdGhlIHZlbmRv
ci4gVGhpcyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGluIGEgY29tbW9uCj4+IHBsYWNlIHRoYXQg
b3RoZXJzIHdpbGwgZmluZCBhbmQgdXNlLiBTZWUgcGFuZWwtY29tbW9uLnR4dCBvcgo+PiBwYW5l
bC1kcGkudHh0Lgo+Pgo+PiBBbHRlcm5hdGl2ZWx5LCB5b3UgY291bGQganVzdCBkcm9wIGl0IGFu
ZCBsZXQgdGhlIHBhbmVsIGNvbXBhdGlibGUgaW1wbHkKPj4gd2hhdCB0aGUgbW9kZSBpcy4KPj4K
Pj4KPiBvaywgZ2V0IGl0LCBpIHdpbGwgbW92ZSB0aGUgcmdiLW1vZGUgdG8gcGFuZWwgYW5kIGRl
c2NyaWJlIGl0IGF0Cj4gcGFuZWwtcmdiLnR4dC4gdGhlIHBhdGNoZXMgd2lsbCBiZSBzZW5kIHNv
b24gbGF0ZXIuCgpEb24ndCBjcmVhdGUgeWV0IGFub3RoZXIgY29tbW9uIHBhbmVsIGZpbGUuIFdl
IGFscmVhZHkgaGF2ZQpwYW5lbC1kcGkudHh0IHdoaWNoIGlzIGZvciBkaWdpdGFsIHBhcmFsbGVs
IGludGVyZmFjZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
