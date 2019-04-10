From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/3] Add support for STPMIC1
Date: Wed, 10 Apr 2019 15:32:18 +0200
Message-ID: <a4453cb5-dfbd-7c69-b4b6-c3e0d66e95bb@st.com>
References: <1554800820-5412-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554800820-5412-1-git-send-email-p.paillet@st.com>
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
To: Pascal PAILLET-LME <p.paillet@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>"linux-kernel@vger.kernel.org" <linux>
List-Id: devicetree@vger.kernel.org

SGkgUGFzY2FsCgpPbiA0LzkvMTkgMTE6MDcgQU0sIFBhc2NhbCBQQUlMTEVULUxNRSB3cm90ZToK
PiBBZGQgc3VwcG9ydCBmb3IgU1RQTUlDMSBvbjoKPiAtIHN0bTMybXAxNTdjIGVkMSBib2FyZAo+
IC0gc3RtMzJtcDE1N2EgZGsxIGJvYXJkCj4gLSBhcm0gbXVsdGlfdjdfZGVmY29uZmlnCj4gCj4g
UGFzY2FsIFBhaWxsZXQgKDMpOgo+IAo+IGNoYW5nZXMgaW4gdjI6Cj4gKiBEZXNjcmliZSB3aHkg
d2UgZGlzYWJsZSB0aGUgRE1BcyBmb3IgUE1JQwo+IAo+ICDCoCBBUk06IGR0czogc3RtMzI6IGFk
ZCBzdHBtaWMxIHN1cHBvcnQgb24gc3RtMzJtcDE1N2MgZWQxIGJvYXJkCj4gIMKgIEFSTTogZHRz
OiBzdG0zMjogYWRkIHN0cG1pYzEgc3VwcG9ydCBvbiBzdG0zMm1wMTU3YSBkazEgYm9hcmQKPiAg
wqAgQVJNOiBtdWx0aV92N19kZWZjb25maWc6IEVuYWJsZSBzdXBwb3J0IGZvciBTVFBNSUMxCj4g
Cj4gIMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLmR0cyB8IDE1OCAKPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIMKgYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2MtZWQxLmR0cyB8IDE1NiAKPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0KPiAgwqBhcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZ8KgwqAgfMKgwqAgNCAr
Cj4gIMKgMyBmaWxlcyBjaGFuZ2VkLCAyOTQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
Cj4gCj4gLS0gCj4gMS45LjEKCgpTZXJpZXMgYXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKTGludXMs
Ckkgc2F3IHRoYXQgeW91IG1hZGUgYSBjb21tZW50IG9uIGZpcnN0IHZlcnNpb24gd2hpY2ggaGFz
IGJlZW4gZml4ZWQgYnkgClBhc2NhbCBpbiB2Mi4gU29ycnkgaWYgSSBkb24ndCB3YWl0IGZvciB5
b3VyIGFjayAoSSBkb24ndCBoYXZlIG11Y2ggdGltZSAKdG8gZmluaXNoIG15IFBSKS4KClJlZ2Fy
ZHMKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
