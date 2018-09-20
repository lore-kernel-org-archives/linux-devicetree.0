From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: update SPI6 dmas property on stm32mp157c
Date: Thu, 20 Sep 2018 17:50:33 +0200
Message-ID: <1efc3bad-cea0-95c4-078d-67463f2b9e6d@st.com>
References: <1537171487-15191-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537171487-15191-1-git-send-email-amelie.delaunay@st.com>
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
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SGkgQW3DqWxpZQoKT24gMDkvMTcvMjAxOCAxMDowNCBBTSwgQW1lbGllIERlbGF1bmF5IHdyb3Rl
Ogo+IFJlbW92ZSB1bnVzZWQgcGFyYW1ldGVyIGZyb20gU1BJNiBkbWFzIHByb3BlcnR5IG9uIHN0
bTMybXAxNTdjIFNvQy4KPiAKPiBGaXhlczogZGMzZjhjODZjMTBkICgiQVJNOiBkdHM6IHN0bTMy
OiBhZGQgU1BJIHN1cHBvcnQgb24gc3RtMzJtcDE1N2MiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxp
ZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLmR0c2kgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5k
dHNpCj4gaW5kZXggNjYxYmU5NC4uMTg1NTQxYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MuZHRzaQo+IEBAIC0xMDc4LDggKzEwNzgsOCBAQAo+ICAgCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDg2IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICAgCQkJY2xvY2tzID0gPCZyY2MgU1BJNl9L
PjsKPiAgIAkJCXJlc2V0cyA9IDwmcmNjIFNQSTZfUj47Cj4gLQkJCWRtYXMgPSA8Jm1kbWExIDM0
IDB4MCAweDQwMDA4IDB4MCAweDAgMD4sCj4gLQkJCSAgICAgICA8Jm1kbWExIDM1IDB4MCAweDQw
MDAyIDB4MCAweDAgMD47Cj4gKwkJCWRtYXMgPSA8Jm1kbWExIDM0IDB4MCAweDQwMDA4IDB4MCAw
eDA+LAo+ICsJCQkgICAgICAgPCZtZG1hMSAzNSAweDAgMHg0MDAwMiAweDAgMHgwPjsKPiAgIAkJ
CWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7Cj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAg
CQl9Owo+IAoKQXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhhbmtzLgpBbGV4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
