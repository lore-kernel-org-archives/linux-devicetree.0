From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] RTC support on STM32H743
Date: Tue, 27 Feb 2018 17:10:26 +0100
Message-ID: <d53b5d88-1efa-36ca-e989-bad441d6cb96@st.com>
References: <1518787000-10675-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518787000-10675-1-git-send-email-amelie.delaunay@st.com>
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
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgQW3DqWxpZSwKCk9uIDAyLzE2LzIwMTggMDI6MTYgUE0sIEFtZWxpZSBEZWxhdW5heSB3cm90
ZToKPiBUaGlzIHBhdGNoc2V0IGFkZCBzdXBwb3J0IGZvciBSVEMgb24gU1RNMzJINzQzIGFuZCBl
bmFibGVzIGl0IG9uIHN0bTMyaDc0M2ktZXZhbC4KPiBUZXN0ZWQgb24gc3RtMzItbmV4dC4KPiAK
PiBBbWVsaWUgRGVsYXVuYXkgKDIpOgo+ICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIFJUQyBzdXBw
b3J0IG9uIFNUTTMySDc0Mwo+ICAgIEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIFJUQyBvbiBzdG0z
Mmg3NDNpLWV2YWwKPiAKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyaDc0My5kdHNpICAgICAg
fCAxNSArKysrKysrKysrKysrKysKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyaDc0M2ktZXZh
bC5kdHMgfCAgNCArKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAK
CktidWlsZCBpc3N1ZSBvY2N1cnMgb24gcGF0Y2gxIGJlY2F1c2UgTUFJTlRBSU5FUiBmaWxlIGlz
IG5vdCBjb3JyZWN0IGZvciAKQVJNL1NUTTMyLiBJIHNlbmQgYSBwYXRjaCB0byBmaXggaXQ6IApo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8yLzI2LzM4Ni4gVGhlcmUgaXMgbm8gS2J1aWxkIGlz
c3VlIGlmIHBhdGNoZXMgCmFyZSBhcHBsaWVkIG9uIHRoZSBjb3JyZWN0IGJyYW5jaDogCmdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0bTMyLmdp
dCBzdG0zMi1uZXh0LgoKU28gc2VyaWVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4KCnJlZ2FyZHMK
QWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
