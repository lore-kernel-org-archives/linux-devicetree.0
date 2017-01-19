From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: display: add STM32 LTDC driver
Date: Thu, 19 Jan 2017 10:31:38 -0600
Message-ID: <20170119163138.va23ppx3ictp6wjr@rob-hp-laptop>
References: <1484573344-11609-1-git-send-email-yannick.fertre@st.com>
 <1484573344-11609-2-git-send-email-yannick.fertre@st.com>
 <2080174.sm3cyM9MmB@avalon>
 <dfb3192a-d5b6-029e-b8cb-65a628a0c30b@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <dfb3192a-d5b6-029e-b8cb-65a628a0c30b@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yannick FERTRE <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Philippe CORNU <philippe.cornu@st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mickael REULIER <mickael.reulier@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBKYW4gMTksIDIwMTcgYXQgMDQ6MTY6MDFQTSArMDAwMCwgWWFubmljayBGRVJUUkUg
d3JvdGU6Cj4gT24gMDEvMTYvMjAxNyAwOTozMCBQTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiA+IEhpIFlhbm5pY2ssCj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gPgo+ID4g
T24gTW9uZGF5IDE2IEphbiAyMDE3IDE0OjI4OjU4IFlhbm5pY2sgRmVydHJlIHdyb3RlOgo+ID4+
IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4g
Pj4gLS0tCj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3QsbHRkYy50eHQg
ICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBp
bnNlcnRpb25zKCspCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxsdGRjLnR4dAo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LGx0ZGMudHh0Cj4g
Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxsdGRjLnR4
dCBuZXcgZmlsZSBtb2RlCj4gPj4gMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMC4uMjBlODlkYQo+
ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdCxsdGRjLnR4dAo+ID4+IEBAIC0wLDAgKzEsNTcgQEAKPiA+PiArKiBT
VE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgbGNkLXRmdCBkaXNwbGF5IGNvbnRyb2xsZXIKPiA+PiAr
Cj4gPj4gKy0gc3QtZGlzcGxheS1zdWJzeXN0ZW06IE1hc3RlciBkZXZpY2UgZm9yIERSTSBzdWIt
Y29tcG9uZW50cwo+ID4+ICsgIFRoaXMgZGV2aWNlIG11c3QgYmUgdGhlIHBhcmVudCBvZiBhbGwg
dGhlIHN1Yi1jb21wb25lbnRzIGFuZCBpcwo+ID4+IHJlc3BvbnNpYmxlCj4gPj4gKyAgb2YgYmlu
ZCB0aGVtLgo+ID4KPiA+IFdoeSBkbyB5b3UgbmVlZCB0aGlzID8gQXQgYSBxdWljayBnbGFuY2Ug
dGhlIGx0ZGMgbm9kZSBzaG91bGQgYmUgZW5vdWdoLgo+IEhpIExhdXJlbnQsCj4gVG8gcHJlcGFy
ZSBuZXh0IGRldmljZSB1cHN0cmVhbSBvZiBkc2ksIHdlIG5lZWQgYSBtYXN0ZXIgbm9kZSAKPiAi
c3QtZGlzcGxheS1zdWJzeXN0ZW0iIGFuZCBhIHN1YiBub2RlICJzdCxsdGRjIi4gSXQncyB0aGUg
c2FtZSBraW5kIG9mIAo+IG5vZGUgdGhhbiBzdCxzdGloNHh4LgoKTm8sIHlvdSBkb24ndC4gVGhh
dCdzIHdoYXQgT0YgZ3JhcGggaXMgZm9yLiBUaGUgRFJNIGRyaXZlciBiaW5kcyB0byB0aGUgCkxD
RCBjb250cm9sbGVyIG5vZGUgYW5kIHdhbGtzIHRoZSBncmFwaCB0byBmaW5kIHRoZSBEU0kgbm9k
ZSBhbmQgdGhlbiAKdGhlIHBhbmVsLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
