From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 13/25] dt-bindings: arm: Document Actions Semi S900
Date: Tue, 28 Feb 2017 07:35:23 +0100
Message-ID: <20170228063535.32069-14-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIEFjdGlvbnMgU2VtaSBTOTAwIGlzIGEgcXVhZC1jb3JlIEFSTSBDb3J0ZXgtQTUzIFNvQy4K
VGhlIEJ1YmJsZWd1bS05NiBpcyBhIDk2Qm9hcmRzIENvbnN1bWVyIEVkaXRpb24gY29tcGxpYW50
IGJvYXJkICg0Lzk2KS4KCkNjOiA5NmJvYXJkc0B1Y3JvYm90aWNzLmNvbQpBY2tlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVy
IDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIHYyIC0+IHYzOiB1bmNoYW5nZWQKIAogdjEgLT4gdjI6
CiAqIEFkb3B0ZWQgImFjdGlvbnMiIHZlbmRvciBwcmVmaXgKICogRXh0ZW5kZWQgdGV4dAogCiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMudHh0IHwgMTUgKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYWN0aW9ucy50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMudHh0CmluZGV4IDFk
Mzc4MmUuLjNiYzdlYTUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYWN0aW9ucy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hY3Rpb25zLnR4dApAQCAtMjIsMyArMjIsMTggQEAgQm9hcmRzOgogUm9vdCBub2Rl
IHByb3BlcnR5IGNvbXBhdGlibGUgbXVzdCBjb250YWluLCBkZXBlbmRpbmcgb24gYm9hcmQ6CiAK
ICAtIExlTWFrZXIgR3VpdGFyIEJhc2UgQm9hcmQgcmV2LiBCOiAibGVtYWtlcixndWl0YXItYmIt
cmV2LWIiLCAibGVtYWtlcixndWl0YXIiCisKKworUzkwMCBTb0MKKz09PT09PT09CisKK1JlcXVp
cmVkIHJvb3Qgbm9kZSBwcm9wZXJ0aWVzOgorCistIGNvbXBhdGlibGUgOiAgbXVzdCBjb250YWlu
ICJhY3Rpb25zLHM5MDAiCisKKworQm9hcmRzOgorCitSb290IG5vZGUgcHJvcGVydHkgY29tcGF0
aWJsZSBtdXN0IGNvbnRhaW4sIGRlcGVuZGluZyBvbiBib2FyZDoKKworIC0gdUNSb2JvdGljcyBC
dWJibGVndW0tOTY6ICJ1Y3JvYm90aWNzLGJ1YmJsZWd1bS05NiIKLS0gCjIuMTAuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
