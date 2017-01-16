From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 0/4] ARM: dts: mt7623: Add initial Geek Force support
Date: Mon, 16 Jan 2017 20:34:13 +0100
Message-ID: <741fcf69-2fac-04b2-65bf-85f1d0af097a@suse.de>
References: <20170108133100.10428-1-afaerber@suse.de>
 <91f5ec74-1aa1-f2ad-24e9-14267cbe8498@phrozen.org>
 <d6bd3783-d124-9871-d3b4-93e366517895@suse.de>
 <3fecb422-8185-7ee0-c203-2bfdc4fd1393@phrozen.org>
 <0bd6567e-1c5b-0ff6-d044-57d25e1a40d2@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0bd6567e-1c5b-0ff6-d044-57d25e1a40d2@phrozen.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Lai <paul@asiarf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgSm9obiwKCkFtIDEyLjAxLjIwMTcgdW0gMDk6MjMgc2NocmllYiBKb2huIENyaXNwaW46Cj4g
aGFkIGEgbG9vayBsYXN0IG5pZ2h0IHdoeSB0aGUgZXRoZXJuZXQgZHRzaSB3YXMgbm90IGFkZGVk
IGFuZCBpdAo+IG9idmlvdXNseSB3YXMgbm90IGFkZGVkIGFzIHdlIHdlcmUgd2FpdGluZyBmb3Ig
dGhlIGNsay1tdDI3MDEgdG8gYmUKPiBtZXJnZWQuIHRoZSBldGhlcm5ldCBkdHNpIHdpbGwgaGF2
ZSBwaGFuZGxlcyBwb2ludGluZyBhdCB0aGUgY2xrIG5vZGVzCj4gd2hpY2ggZGlkIG5vdCBleGlz
dCBhdCB0aGUgdGltZS4gc2FtZSBpcyB0cnVlIGZvciB0aGUgUFdNIGNvZGUuCj4gCj4gaSBzYXQg
ZG93biBsYXN0IG5pZ2h0IGFuZCB3b3JrZWQgb3V0IHdoYXQgcGVuZGluZyBwYXRjaGVzIGkgc3Rp
bGwgaGF2ZQo+IGZvciBtdDc2MjMgYW5kIG91dCBvZiB0aGUgfjgwIHJlcXVpcmVkIHRvIGdldCB2
NC40IHdvcmtpbmcgaSBvbmx5IG5lZWQKPiBhcm91bmQgMTAgZm9yIHY0LjEwLXJjMS4KPiAKPiBp
IHN0YXJ0ZWQgdG8gcmViYXNlIHRoZXNlIHBhdGNoZXMgbGFzdCBuaWdodCBhbmQgd2lsbCBoYXZl
IHRpbWUgdG8gdGVzdAo+IHRoZW0gdG9tb3Jyb3cgb3IgZWFybHkgbmV4dCB3ZWVrLiBhcyB0aGUg
cHdyYXAgbm9kZSBhbG9uZSBpcyBhcm91bmQgMjAwCj4gbGluZXMgb2YgZGV2aWNldHJlZSB3ZSBu
ZWVkIHRvIGZpZ3VyZSBvdXQgYSB3YXkgdG8gYWRkIHRoaXMgdG8gdGhlIGR0cwo+IGZpbGVzIHdp
dGhvdXQgZHVwbGljYXRpbmcgaXQuIGknbGwgdHJ5IHRvIHBvc3QgYSBzZXJpZXMgZWFybHkgbmV4
dCB3ZWVrCj4gdGhhdCB3ZSBjYW4gdGhlbiBkaXNjdXNzIGFuZCByZWJhc2UgeW91ciBnZWVrYm9h
cmQgcGF0Y2hlcyBvbi4KClNvdW5kcyBsaWtlIGEgcGxhbi4gTWFueSB0aGFua3MhCgpSZWdhcmRz
LApBbmRyZWFzCgotLSAKU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkKR0Y6IEZlbGl4IEltZW5kw7ZyZmZlciwgSmFuZSBTbWl0aGFyZCwgR3Jh
aGFtIE5vcnRvbgpIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
