From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V4 5/5] arm: mvebu: Added SMP support for Armada XP
Date: Tue, 20 Nov 2012 18:07:59 +0100
Message-ID: <20121120180759.27df512f@skate>
References: <1353357360-7242-1-git-send-email-gregory.clement@free-electrons.com>
 <1353357360-7242-6-git-send-email-gregory.clement@free-electrons.com>
 <20121120164058.GB27765@mudshark.cambridge.arm.com>
 <50ABB499.6090508@free-electrons.com>
 <20121120170127.GE27765@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121120170127.GE27765-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
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
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <Leif.Lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

RGVhciBXaWxsIERlYWNvbiwKCk9uIFR1ZSwgMjAgTm92IDIwMTIgMTc6MDE6MjcgKzAwMDAsIFdp
bGwgRGVhY29uIHdyb3RlOgoKPiA+IEkgcHJlZmVyIHRvIGtlZXAgdGhlbSBzZXBhcmF0ZSwgYXMg
d2UgY2FuIHVzZSBjb2hlcmVuY3kgd2l0aG91dCBTTVAuCj4gPiBUaGF0J3Mgd2h5IEkgY3JlYXRl
IHRoZSBjb2hlcmVuY3lfbGwuUyBmaWxlIGluc3RlYWQgb2YgcHV0dGluZwo+ID4gZXZlcnl0aGlu
ZyBpbiB0aGlzIGZpbGUuCj4gCj4gSG1tLCBjYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBtb3JlIG9u
IGNvaGVyZW5jeSB3aXRob3V0IFNNUCBwbGVhc2U/IERvCj4gdGhlc2UgY29udHJvbHMgYWxzbyBh
ZmZlY3QgSU8gY29oZXJlbmN5PwoKVGhlIGNvaGVyZW5jeSB1bml0IGRvZXMgY29oZXJlbmN5IGJl
dHdlZW4gQ1BVcywgYnV0IGFsc28gYmV0d2VlbiB0aGUKQ1BVIGFuZCB0aGUgZGV2aWNlcyBmb3Ig
RE1BLiBTbyBmb3IgZXhhbXBsZSB0aGUgTVY3ODIzMCBpcyBhIHNpbmdsZS1jb3JlCnZhcmlhbnQg
b2YgdGhlIEFybWFkYSBYUCwgc28gaGF2aW5nIENPTkZJR19TTVAgZm9yIGl0IGlzIHVzZWxlc3Ms
IGJ1dAp5b3Ugc3RpbGwgd2FudCB0aGUgQ1BVIHRvIGpvaW4gdGhlIGNvaGVyZW5jeSBmYWJyaWMg
aW4gb3JkZXIgdG8gcHJvdmlkZQpjb2hlcmVuY3kgd2l0aCBJL08uCgpUaGFua3MgdG8gdGhlIGNv
aGVyZW5jeSB1bml0LCB3ZSBoYXZlIGFuIGFsbW9zdCBETUEgY29oZXJlbnQKYXJjaGl0ZWN0dXJl
IChzZWUgdGhlIEhXIEkvTyBjb2hlcmVuY3kgcGF0Y2hlcyBmcm9tIEdyw6lnb3J5IGZvcgpkZXRh
aWxzKS4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgRnJlZSBFbGVjdHJvbnMKS2VybmVs
LCBkcml2ZXJzLCByZWFsLXRpbWUgYW5kIGVtYmVkZGVkIExpbnV4CmRldmVsb3BtZW50LCBjb25z
dWx0aW5nLCB0cmFpbmluZyBhbmQgc3VwcG9ydC4KaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVl
LWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3Jn
Cmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK
