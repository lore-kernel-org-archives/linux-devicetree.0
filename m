From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 10/12] ARM: mvebu: Relocate Armada 370/XP DeviceBus
 device tree nodes
Date: Tue, 18 Jun 2013 19:09:30 -0300
Message-ID: <20130618220929.GA24056@localhost>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-11-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306181816.26530.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306181816.26530.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdW4gMTgsIDIwMTMgYXQgMDY6MTY6MjZQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUdWVzZGF5IDE4IEp1bmUgMjAxMywgRXplcXVpZWwgR2FyY2lhIHdyb3RlOgo+
ID4gCj4gPiArICAgICAgICAgICAgICAgZGV2YnVzLWJvb3RjcyB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gIm1hcnZlbGwsbXZlYnUtZGV2YnVzIjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmZmYwMDAxIDB4MTA0MDAgMHg4PjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwwIE1CVVNfSUQoMHgwMSwgMHgyZikgMCAw
eGZmZmZmZmZmPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNvcmVjbGsgMD47Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAgICAgICAgICAg
IH07Cj4gCj4gVGhpcyBpcyBhIHZpb2xhdGlvbiBvZiB0aGUgYmluZGluZyBhcyBmYXIgYXMgSSBj
YW4gdGVsbCwgc2luY2UgeW91IGRvbid0IHNwZWNpZnkgcmFuZ2VzCj4gdG8gYWNjZXNzIHRoZSAw
eGZmZmYwMDAxIDB4MTA0MDAgYWRkcmVzcy4gSG93ZXZlciwgYXMgSSBleHBsYWluZWQgaW4gbXkg
Y29tbWVudCBmb3IKPiB0aGUgYmluZGluZywgSSB0aGluayB5b3Ugc2hvdWxkIGNsYXJpZnkgdGhl
IGJpbmRpbmcgYW5kIGxlYXZlIHRoZSBpbXBsZW1lbnRhdGlvbgo+IGFzIHlvdSBoYXZlIGl0IGhl
cmUuCj4gCgpNbW0uLi4gYWdhaW4gSSBnb3QgbG9zdCBoZXJlLiBXaGljaCAncmFuZ2VzJyB5b3Ug
c2F5IEkgZG9uJ3Qgc3BlY2lmeSB0bwphY2Nlc3MgdGhlIChmb3JtZXJseSkgMHhmZmZmMDAwMT8K
CkFGQUlLLCAncmFuZ2VzJyBhcmUgb25seSBmb3IgY2hpbGRyZW4gdHJhbnNsYXRpb24sIHdoaWNo
IG1lYW5zIEkgZG9uJ3QKbmVlZCB0byBzcGVjaWZ5IGEgcmFuZ2VzIGZvciB0aGF0IGluIHRoZSBk
ZXZidXMgbm9kZSwgYnV0IGluIGl0cyBwYXJlbnQsCnJpZ2h0PwoKVGhpcyByYW5nZXMgdGhpbmcg
Y2FuIGJlIHZlcnkgdHJpY2t5LCBzbyBwbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20KbWlzdGFrZW4u
CgotLSAKRXplcXVpZWwgR2FyY8OtYSwgRnJlZSBFbGVjdHJvbnMKRW1iZWRkZWQgTGludXgsIEtl
cm5lbCBhbmQgQW5kcm9pZCBFbmdpbmVlcmluZwpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUt
ZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcK
aHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
