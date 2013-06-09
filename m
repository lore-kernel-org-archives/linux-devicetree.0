From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Sun, 9 Jun 2013 11:39:43 -0300
Message-ID: <20130609143941.GB2353@localhost>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1370623671-7748-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072101.44694.arnd@arndb.de>
 <20130607200054.GA9010@obsidianresearch.com>
 <20130608183851.GB2354@localhost>
 <20130609014506.GB10027@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130609014506.GB10027-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCBKdW4gMDgsIDIwMTMgYXQgMDc6NDU6MDZQTSAtMDYwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFNhdCwgSnVuIDA4LCAyMDEzIGF0IDAzOjM4OjUyUE0gLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToKWy4uLl0KPiAKPiBUaGVyZSBhcmUgbG90cyBhbmQgbG90cyBvZiBz
b2x1dGlvbnMgdXNpbmcgdGhlIHByZS1wcm9jZXNzb3IsIHBsZWFzZQo+IHRha2UgYSBsb29rIGFu
ZCBmaW5kIG9uZSB0aGF0IHlvdSBmZWVsIHdvcmtzIGZvciB5b3UuLi4KPiAKCk9rLCBJIHdpbGwu
Cgo+IAo+IFdlIGNhbiBhbHdheXMgaW1wcm92ZSB0aGUgZHRjIGVudm9yaW9ubWVudCAoYXMgd2Fz
IGRvbmUgcmVjZW50bHkgYnkKPiBhZGRpbmcgdGhlIHByZXByb2Nlc3NvciksIHdlIGNhbm5vdCBj
aGFuZ2UgJ0RUIEFCSScgb25jZSBpdCBpdCBzZXQuCj4KClJpZ2h0LiBMZXQgbWUgcmV3b3JrIHRo
aXMgdXNpbmcgdGhlIHByZXByb2Nlc3NvciBhbmQgc2VuZCBhIHYyLgoKVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2shCi0tIApFemVxdWllbCBHYXJjw61hLCBGcmVlIEVsZWN0cm9ucwpFbWJlZGRlZCBM
aW51eCwgS2VybmVsIGFuZCBBbmRyb2lkIEVuZ2luZWVyaW5nCmh0dHA6Ly9mcmVlLWVsZWN0cm9u
cy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2
aWNldHJlZS1kaXNjdXNzIG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3ps
YWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNj
dXNzCg==
