From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 16/23] v4l: fwnode: Initialise the V4L2 fwnode
 endpoints to zero
Date: Thu, 13 Sep 2018 13:19:12 +0300
Message-ID: <20180913101912.ee4qfkphw3zsypbi@paasikivi.fi.intel.com>
References: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
 <20180912212942.19641-17-sakari.ailus@linux.intel.com>
 <20180913094614.GS20333@w540>
 <20180913095533.nu6yjf6swga7fa6x@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180913095533.nu6yjf6swga7fa6x@paasikivi.fi.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: jacopo mondi <jacopo@jmondi.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, slongerbeam@gmail.com, niklas.soderlund@ragnatech.se, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBTZXAgMTMsIDIwMTggYXQgMTI6NTU6MzNQTSArMDMwMCwgU2FrYXJpIEFpbHVzIHdy
b3RlOgo+IEhpIEphY29wbywKPiAKPiBPbiBUaHUsIFNlcCAxMywgMjAxOCBhdCAxMTo0NjoxNEFN
ICswMjAwLCBqYWNvcG8gbW9uZGkgd3JvdGU6Cj4gPiBIaSBTYWthcmksCj4gPiAKPiA+IE9uIFRo
dSwgU2VwIDEzLCAyMDE4IGF0IDEyOjI5OjM1QU0gKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToK
PiA+ID4gSW5pdGlhbGlzZSB0aGUgVjRMMiBmd25vZGUgZW5kcG9pbnRzIHRvIHplcm8gaW4gYWxs
IGRyaXZlcnMgdXNpbmcKPiA+ID4gdjRsMl9md25vZGVfZW5kcG9pbnRfcGFyc2UoKS4gVGhpcyBw
cmVwYXJlcyBmb3Igc2V0dGluZyBkZWZhdWx0IGVuZHBvaW50Cj4gPiA+IGZsYWdzIGFzIHdlbGwg
YXMgdGhlIGJ1cyB0eXBlLiBTZXR0aW5nIGJ1cyB0eXBlIHRvIHplcm8gd2lsbCBjb250aW51ZSB0
bwo+ID4gPiBndWVzcyB0aGUgYnVzIGFtb25nIHRoZSBndWVzc2FibGUgc2V0IChwYXJhbGxlbCwg
QnQuNjU2IGFuZCBDU0ktMiBELVBIWSkuCj4gPiA+Cj4gPiAKPiA+IEkndmUgcGxheWVkIGFyb3Vu
ZCB3aXRoIHRoaXMgcGF0Y2gsIHRyeWluZyB0byB1c2UgZGVmYXVsdHMgaW4gdGhlCj4gPiByZW5l
c2FzLWNldSBkcml2ZXIuCj4gPiAKPiA+IFRoaXMgaXMgdGhlIHJlc3VsdGluZyBwYXRjaCwgaWYg
eW91IHdhbnQgSSBjYW4gc2VuZCBpdCBhcyBmb2xsb3ctdXAgb3IKPiA+IHNlbmQgaXQgc28gdGhh
dCB5b3UgY2FuIGluY2x1ZGUgaXQgaW4geW91ciBzZXJpZXMgaWYgaXQncyBjb3JyZWN0KToKPiA+
IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC9oaWRkZW4vYTc3OTVkM2UvCj4gCj4gTG9va3Mgbmlj
ZTsgY291bGQgeW91IHNlbmQgaXQgb3V0IHRvIHRoZSBsaXN0IGZvciByZXZpZXc/Cj4gCj4gVGhl
IGJ1cyB3aWR0aCBkZWZhdWx0IGlzbid0IHNwZWNpZmllZCBpbiBEVCBiaW5kaW5nczsgY291bGQg
eW91IHdyaXRlIGEKPiBwYXRjaCB0aGF0IGRlZmluZXMgaXQ/CgpTYW1lIGZvciAicGNsay1zYW1w
bGUiLiBEVCBiaW5kaW5ncyBkbyBub3QgZG9jdW1lbnQgdGhhdDsgaXQgc2hvdWxkIGdvIHRvCnRo
ZSBzYW1lIHBhdGNoLgoKLS0gClNha2FyaSBBaWx1cwpzYWthcmkuYWlsdXNAbGludXguaW50ZWwu
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
