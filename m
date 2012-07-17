From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Tue, 17 Jul 2012 12:16:40 +0200
Message-ID: <20120717121640.589780ce@skate>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-2-git-send-email-florian@openwrt.org>
 <201207161554.04812.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201207161554.04812.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian@openwrt.org>, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

TGUgTW9uLCAxNiBKdWwgMjAxMiAxNTo1NDowNCArMDAwMCwKQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4gYSDDqWNyaXQgOgoKPiA+ICt2b2lkIG1jczgxNHhfcmVzdGFydChjaGFyIG1vZGUs
IGNvbnN0IGNoYXIgKmNtZCkKPiA+ICt7Cj4gPiArCV9fcmF3X3dyaXRlbCh+KDEgPDwgMzEpLCBt
Y3M4MTR4X3N5c2RiZ19iYXNlKTsKPiA+ICt9Cj4gCj4gWW91IHNob3VsZCBnZW5lcmFsbHkgYXZv
aWQgdXNpbmcgX19yYXdfcmVhZGwgZXRjLiBhbmQgaW5zdGVhZCB1c2UKPiByZWFkbC93cml0ZSBv
ciByZWFkbF9yZWxheGVkL3dyaXRlbF9yZWxheGVkLgoKSSB0aG91Z2h0IHRoYXQgcmVhZGwvd3Jp
dGVsIGFuZCByZWFkbF9yZWxheGVkL3dyaXRlbF9yZWxheGVkIHdlcmUgdXNlZApmb3IgUENJLXN0
eWxlIGFjY2VzcywgZm9yIHdoaWNoIHRoZXNlIG1hY3Jvcy9mdW5jdGlvbnMgZG8gYXV0b21hdGlj
YWxseQphIGNvbnZlcnNpb24gZnJvbSB0aGUgQ1BVLWVuZGlhbm5lc3MgdG8gdGhlIFBDSS1lbmRp
YW5uZXNzCihsaXR0bGUtZW5kaWFuKS4gSGVyZSBvZiBjb3Vyc2UsIHRoaXMgdGhlIFNvQyBpcyB1
c2VkIGxpdHRsZS1lbmRpYW4sIGl0CndpbGwganVzdCB3b3JrIGJlY2F1c2UgcmVhZGwvd3JpdGVs
IHdpbGwgbm90IGRvIGFueSBlbmRpYW5uZXNzCmNvbnZlcnNpb24sIGJ1dCBpZiB3ZSB3ZXJlIG9u
IGEgYmlnLWVuZGlhbiBtYWNoaW5lPwoKTXkgdW5kZXJzdGFuZGluZyB1bnRpbCBub3cgd2FzIHRo
YXQgX19yYXdfcmVhZGwvX19yYXdfd3JpdGVsIHNob3VsZCBiZQp1c2VkIGZvciBhY2Nlc3NlcyB3
aXRoIG5hdGl2ZSBlbmRpYW5uZXNzLCBidXQgYXBwYXJlbnRseSwgaXQncyBtb3JlCnN1YnRsZSB0
aGFuIHRoaXMuIFdvdWxkIHlvdSBtaW5kIGV4cGFuZGluZyBhIGJpdCBvbiB0aGlzPwoKQmVzdCBy
ZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBGcmVlIEVsZWN0cm9ucwpLZXJu
ZWwsIGRyaXZlcnMsIHJlYWwtdGltZSBhbmQgZW1iZWRkZWQgTGludXgKZGV2ZWxvcG1lbnQsIGNv
bnN1bHRpbmcsIHRyYWluaW5nIGFuZCBzdXBwb3J0LgpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
