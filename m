From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Wed, 16 Jan 2019 14:48:48 +0530
Message-ID: <a7d4994d-7740-c845-da67-9d06e6d874cc@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-3-brgl@bgdev.pl>
 <08200de1-fde5-c525-c874-c7872259067b@ti.com>
 <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMTQvMDEvMTkgMTA6MDkgUE0sIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gcG9uLiwg
MTQgc3R5IDIwMTkgbyAxMzoyMCBTZWtoYXIgTm9yaSA8bnNla2hhckB0aS5jb20+IG5hcGlzYcWC
KGEpOgo+Pgo+PiBIaSBCYXJ0b3N6LAo+Pgo+PiBPbiAxMS8wMS8xOSAxMDo1MSBQTSwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPj4+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Cj4+Pgo+Pj4gQ3VycmVudGx5IHRoZSBjbG9ja3NvdXJjZSBh
bmQgY2xvY2tldmVudCBzdXBwb3J0IGZvciBkYXZpbmNpIHBsYXRmb3Jtcwo+Pj4gbGl2ZXMgaW4g
bWFjaC1kYXZpbmNpLiBJdCBoYXJkLWNvZGVzIG1hbnkgdGhpbmdzLCB1c2VkIGdsb2JhbCB2YXJp
YWJsZXMsCj4+PiBpbXBsZW1lbnRzIGZ1bmN0aW9uYWxpdGllcyB1bnVzZWQgYnkgYW55IHBsYXRm
b3JtIGFuZCBoYXMgY29kZSBmcmFnbWVudHMKPj4+IHNjYXR0ZXJlZCBhY3Jvc3MgbWFueSAob2Z0
ZW4gdW5yZWxhdGVkKSBmaWxlcy4KPj4+Cj4+PiBJbXBsZW1lbnQgYSBuZXcsIG1vZGVybiBhbmQg
c2ltcGxpZmllZCB0aW1lciBkcml2ZXIgYW5kIHB1dCBpdCBpbnRvCj4+PiBkcml2ZXJzL2Nsb2Nr
c291cmNlLiBXZSBzdGlsbCBuZWVkIHRvIHN1cHBvcnQgbGVnYWN5IGJvYXJkIGZpbGVzIHNvCj4+
PiBleHBvcnQgYSBjb25maWcgc3RydWN0dXJlIGFuZCBhIGZ1bmN0aW9uIHRoYXQgYWxsb3dzIG1h
Y2hpbmUgY29kZSB0bwo+Pj4gcmVnaXN0ZXIgdGhlIHRpbWVyLgo+Pj4KPj4+IFdlIGRvbid0IGNo
ZWNrIHRoZSByZXR1cm4gdmFsdWVzIG9mIHJlZ21hcCByZWFkcyBhbmQgd3JpdGVzIHNpbmNlIHdp
dGgKPj4+IG1taW8gaXQncyBvbmx5IGxpa2VseSB0byBmYWlsIGR1ZSB0byBwcm9ncmFtbWVyJ3Mg
ZXJyb3JzLgo+Pj4KPj4+IFdlIGFsc28gZG9uJ3QgYm90aGVyIGZyZWVpbmcgcmVzb3VyY2VzIG9u
IGVycm9ycyBpbgo+Pj4gZGF2aW5jaV90aW1lcl9yZWdpc3RlcigpIGFzIHRoZSBzeXN0ZW0gd29u
J3QgYm9vdCB3aXRob3V0IGEgdGltZXIgYW55d2F5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4+Cj4+IFdpdGgg
dGhpcyBzZXJpZXMsIERBODMwIGZhaWxzIHRvIGJvb3QuIFJlc3Qgb2YgdGhlIGRldmljZXMgYXJl
IG9rYXkgZnJvbQo+PiBib290IHBlcnNwZWN0aXZlLgo+Pgo+PiBEQTgzMCBpcyBwcmV0dHkgdW5p
cXVlIGJlY2F1c2UgaXQgdXNlcyB0aGUgc2FtZSB0aW1lci1oYWxmIGZvciBib3RoCj4+IGNsb2Nr
c291cmNlIGFuZCBjbG9ja2V2ZW50LiBNYXkgYmUgeW91IGNhbiBzZXQgdGhlIHNhbWUgY29uZmln
dXJhdGlvbiBvbgo+PiB5b3VyIERBODUwIHRvIHNlZSB0aGUgc2FtZSBpc3N1ZT8gRWxzZSwgSSB3
aWxsIGVuYWJsZSBsb3ctbGV2ZWwgZGVidWcKPj4gYW5kIHRyeSB0byBwcm92aWRlIG1vcmUgZGVi
dWcgZGF0YS4KPj4KPiAKPiBJIGNhbid0IGJvb3QgZGE4NTAgd2l0aCB0aGUgc2FtZSBjb25maWcg
YXMgZGE4MzAgKDB4NjAgY29tcGFyZQo+IHJlZ2lzdGVyLCBjb21wYXJlIGlycSA3NCkgZXZlbiB3
aXRoIHRoZSBvbGQgdGltZXIgY29kZS4gSnVzdCB0byBtYWtlCj4gc3VyZTogZG9lcyBkYTgzMCBi
b290IGZpbmUgd2l0aCBtYWlubGluZSB2NS4wLXJjMj8KClllYWgsIEkgZGlkIGNoZWNrIHRoYXQg
d2l0aG91dCB0aGUgcGF0Y2ggREE4MzAgZG9lcyBib290LgoKVGhhbmtzLApTZWtoYXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
