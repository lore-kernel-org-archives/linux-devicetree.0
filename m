From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 12:19:43 +0200
Message-ID: <20130828121943.1c8327ca@skate>
References: <20130828113459.48ecbb34@armhf>
	<521DCD33.2070008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <521DCD33.2070008@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean-Francois Moine <moinejf@free.fr>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

U2ViYXN0aWFuLCBKZWFuLUZyYW7Dp29pcywKCk9uIFdlZCwgMjggQXVnIDIwMTMgMTI6MTM6MDcg
KzAyMDAsIFNlYmFzdGlhbiBIZXNzZWxiYXJ0aCB3cm90ZToKPiBPbiAwOC8yOC8yMDEzIDExOjM0
IEFNLCBKZWFuLUZyYW5jb2lzIE1vaW5lIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBu
b2RlcyB0byBpbnN0YW50aWF0ZSB0aGUgYXVkaW8gZGV2aWNlcyBvZiB0aGUgRG92ZQo+ID4gYm9h
cmRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplYW4tRnJhbmNvaXMgTW9pbmUgPG1vaW5lamZA
ZnJlZS5mcj4KPiA+IC0tLQo+ID4gICBhcmNoL2FybS9ib290L2R0cy9kb3ZlLmR0c2kgICAgICAg
ICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9k
b3ZlLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9kb3ZlLmR0c2kKPiA+IGluZGV4IDQ5OWFiYWQu
Ljc4MjI3ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9kb3ZlLmR0c2kKPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RvdmUuZHRzaQo+ID4gQEAgLTU3Myw2ICs1NzMsMjQg
QEAKPiA+ICAgCQkJCQlwaHktaGFuZGxlID0gPCZldGhwaHk+Owo+ID4gICAJCQkJfTsKPiA+ICAg
CQkJfTsKPiA+ICsKPiA+ICsJCQlpMnMwOiBhdWRpby1jb250cm9sbGVyQGIwMDAwIHsKPiA+ICsJ
CQkJY29tcGF0aWJsZSA9ICJtYXJ2ZWxsLG12ZWJ1LWF1ZGlvIjsKPiAKPiBbYWRkZWQgR3JlZ29y
eSB0byBDY10KPiAKPiBKZWFuLUZyYW5jb2lzLAo+IAo+IGFzIE1hcmsgQnJvd24gYWxyZWFkeSB0
b29rIHRoZSBiaW5kaW5ncyBwYXRjaCBmb3IgYWJvdmUgZ2VuZXJpYwo+IGNvbXBhdGlibGUsIGhv
dyBhcmUgd2UgZ29pbmcgdG8gZGlzY3JpbWluYXRlIGRpZmZlcmVudAo+IGltcGxlbWVudGF0aW9u
cy9mZWF0dXJlcyBvZiBEb3ZlLCBLaXJrd29vZCwgYW5kIEFybWFkYSAzNzA/CgpJIGFncmVlIHRo
YXQgbXZlYnUtYXVkaW8gaXMgbm90IGEgcmVhbGx5IGdvb2QgY29tcGF0aWJsZSBzdHJpbmcuIEl0
CnNob3VsZCB1c2UgdGhlIGZpcnN0IFNvQyB0aGF0IGludHJvZHVjZWQgdGhlIElQIGJsb2NrLCBz
byB0aGF0IGlmCmZ1dHVyZSBTT0NzIGhhdmUgdmFyaWF0aW9ucywgd2UgY2FuIGludHJvZHVjZSBz
ZXBhcmF0ZSBjb21wYXRpYmxlCnN0cmluZ3MuCgpTbyBmb3Igbm93LCB0aGUgY29tcGF0aWJsZSBz
dHJpbmcgc2hvdWxkIGJlIGtpcmt3b29kLWF1ZGlvLgoKVGhhbmtzLAoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBGcmVlIEVsZWN0cm9ucwpLZXJuZWwsIGRyaXZlcnMsIHJlYWwtdGltZSBh
bmQgZW1iZWRkZWQgTGludXgKZGV2ZWxvcG1lbnQsIGNvbnN1bHRpbmcsIHRyYWluaW5nIGFuZCBz
dXBwb3J0LgpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
