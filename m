From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v3 1/7] ARM: sun8i: smp: Add support for A83T
Date: Mon, 19 Feb 2018 11:39:45 +0100
Message-ID: <20180219113945.686dc4ee@dell-desktop.home>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-2-mylene.josserand@bootlin.com>
 <20180219090401.5uxmwtnkd7oadaxx@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219090401.5uxmwtnkd7oadaxx@flea.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8gTWF4aW1lLAoKT24gTW9uLCAxOSBGZWIgMjAxOCAxMDowNDowMSArMDEwMApNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGksCj4gCj4gT24g
TW9uLCBGZWIgMTksIDIwMTggYXQgMDk6MTg6MzFBTSArMDEwMCwgTXlsw6huZSBKb3NzZXJhbmQg
d3JvdGU6Cj4gPiBBZGQgdGhlIHN1cHBvcnQgZm9yIEE4M1QuCj4gPiAKPiA+IEE4M1QgU29DIGhh
cyBhbiBhZGRpdGlvbmFsIHJlZ2lzdGVyIHRoYW4gQTgwIHRvIGhhbmRsZSBDUFUgY29uZmlndXJh
dGlvbnM6Cj4gPiBSX0NQVVNfQ0ZHLiBJbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVnaXN0ZXIgY29t
ZXMgZnJvbSBBbGx3aW5uZXIncyBCU1AKPiA+IGRyaXZlci4KPiA+IEFuIGltcG9ydGFudCBkaWZm
ZXJlbmNlIGlzIHRoZSBQb3dlciBPZmYgR2F0aW5nIHJlZ2lzdGVyIGZvciBjbHVzdGVycwo+ID4g
d2hpY2ggaXMgQklUKDQpIGluIGNhc2Ugb2YgU1VOOUktQTgwIGFuZCBCSVQoMCkgaW4gY2FzZSBv
ZiBTVU44SS1BODNULgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNeWzDqG5lIEpvc3NlcmFuZCA8
bXlsZW5lLmpvc3NlcmFuZEBib290bGluLmNvbT4gIAo+IAo+IFRoaXMgaXMgc29tZSBoaWdoLWxl
dmVsIHJldmlldywgYnV0IHlvdSBzaG91bGQgc3BsaXQgdGhpcyBwYXRjaCBpbgo+IHRocmVlOgo+
ICAgLSBPbmUgdG8gcmVmYWN0b3IgdGhlIGN1cnJlbnQgY29kZSB0byBzcGxpdCB0aGUgRFQgcGFy
c2luZyBmdW5jdGlvbgo+ICAgICAoYW5kIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gc3VuOWlfc21w
X2R0X3BhcnNlKSBhbmQgdGhlIHZhcmlhYmxlIHJlbmFtZXMKPiAgIC0gT25lIHRvIGVuYWJsZSB0
aGUgQTgzdCBTTVAgKHdpdGggdGhlIGZ1bmN0aW9uIGNhbGxlZCBzdW44aV9hODN0X3NtcF9kdF9w
YXJzZSkKPiAgIC0gT25lIHRvIGVuYWJsZSB0aGUgQTgzdCBob3RwbHVnIChtZXJnZWQgd2l0aCB5
b3VyIGxhc3QgcGF0Y2gpCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuClN1cmUsIEkgd2lsbCBz
cGxpdCBteSBwYXRjaCBpbiB0aHJlZS4KCj4gCj4gQWxzbywgeW91J3JlIGNhbGxpbmcgYSBsb3Qg
b2YgdGltZXMgb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlLCBhbmQgdGhpcwo+IGlzIHF1aXRlIGlu
ZWZmaWNpZW50LiBZb3Ugc2hvdWxkIGNhbGwgaXQgb25jZSBhbmQgc3RvcmUgdGhlIHJlc3VsdC4K
ClRydWUuCgpUaGFua3MsCgpNeWzDqG5lCgotLSAKTXlsw6huZSBKb3NzZXJhbmQsIEJvb3RsaW4g
KGZvcm1lcmx5IEZyZWUgRWxlY3Ryb25zKQpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHA6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
