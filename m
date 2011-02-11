From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 0/4] powerpc: Open PIC binding and "pic-no-reset"
Date: Fri, 11 Feb 2011 12:41:32 -0600
Message-ID: <20110211124132.2ae965d7@udp111988uds>
References: <1296861941-3370-1-git-send-email-meador_inge@mentor.com>
	<AANLkTinda9TX+Ng=kL-HHLOdqRnUZ6uitQKyZcRUHVco@mail.gmail.com>
	<4D54986A.60907@mentor.com>
	<AANLkTikPgqgnWDOz+H5OXK7Sc=J67xOF3NMNkfDErocu@mail.gmail.com>
	<9F6FE96B71CF29479FF1CDC8046E15030C485D@039-SN1MPN1-002.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <9F6FE96B71CF29479FF1CDC8046E15030C485D@039-SN1MPN1-002.039d.mgd.msft.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Yoder Stuart-B08248 <B08248@freescale.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Meador Inge <meadori@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAxMSBGZWIgMjAxMSAxNDo1ODoxMyArMDAwMApZb2RlciBTdHVhcnQtQjA4MjQ4IDxC
MDgyNDhAZnJlZXNjYWxlLmNvbT4gd3JvdGU6Cgo+IAo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPiA+IEZyb206IE1lYWRvciBJbmdlIFttYWlsdG86bWVhZG9yaUBnbWFpbC5jb21d
Cj4gPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTAsIDIwMTEgOToyNiBQTQo+ID4gVG86IEJl
bmphbWluIEhlcnJlbnNjaG1pZHQKPiA+IENjOiBZb2RlciBTdHVhcnQtQjA4MjQ4OyBkZXZpY2V0
cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZzsgbGludXhwcGMtCj4gPiBkZXZAbGlzdHMub3ps
YWJzLm9yZwo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzRdIHBvd2VycGM6IE9wZW4gUElD
IGJpbmRpbmcgYW5kICJwaWMtbm8tcmVzZXQiCj4gPiAKPiA+IEZyb20gdGhlIGZlZWRiYWNrIEkg
aGF2ZSByZWNlaXZlZCBzbyBmYXIsIHRoZSBmdW5kYW1lbnRhbCBpZGVhcyBpbiB0aGlzCj4gPiBw
YXRjaCBzZXQgYXJlIHNhbmUuIMKgSG93ZXZlciwgdGhlIGZvbGxvd2luZyBpc3N1ZXMgc3RpbGwg
bmVlZCBhZ3JlZW1lbnQ6Cj4gPiAKPiA+ICDCoCDCoDEuIFdoYXQgc2hvdWxkIGJlIHRoZSBuYW1l
IG9mIHRoZSBubyByZXNldCBwcm9wZXJ0eT8KPiA+ICDCoCDCoCDCoCAicGljLW5vLXJlc2V0IiBv
ciAibm8tcmVzZXQiPwo+ID4gIMKgIMKgMi4gU2hvdWxkIHdlIGp1c3Qga2VlcCB0aGUgZXhpc3Rp
bmcgcHJvdGVjdGVkIHNvdXJjZXMgaW1wbGVtZW50YXRpb24KPiA+ICDCoCDCoCDCoCBpbiBwbGFj
ZT8KPiA+IAo+ID4gRm9yICgxKSwgSSBwcmVmZXIgIm5vLXJlc2V0Ii4KPiAKPiBJIGFsc28gcHJl
ZmVyIHBsYWluICJuby1yZXNldCIuICBUaGUgcHJvcGVydHkgaXMgb24gYSBwaWMgbm9kZSBzbwo+
ICJwaWMiIG9uIHRoZSBwcm9wZXJ0eSBzZWVtcyByZWR1bmRhbnQuCgpJdCdzIG5vdCByZWR1bmRh
bnQsIGl0J3MgbmFtZXNwYWNpbmcuICBCZWZvcmUgdGhlcmUgd2FzIGEgZ2VuZXJpYyAic3RhdHVz
Igpwcm9wZXJ0eSwgc29tZW9uZSB3aG8gd2FudGVkIGEgZGV2aWNlLXNwZWNpZmljICJzdGF0dXMi
IGNvdWxkIGhhdmUgbWFkZQp0aGUgc2FtZSBhcmd1bWVudC4gIFVzdWFsbHkgd2UgdXNlIGEgdmVu
ZG9yIHByZWZpeCB0byBhdm9pZCB0aGF0IHByb2JsZW0sCmJ1dCB0aGF0IHdvbid0IHdvcmsgaGVy
ZS4KCi1TY290dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXhwcGMtZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9y
ZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2
