From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: Re: [RESEND PATCH v4] clk: stm32h7: Add stm32h743 clock driver
Date: Fri, 30 Jun 2017 07:14:23 +0000
Message-ID: <d325071a-5da5-4ff1-89b9-fc1bbe10e223@st.com>
References: <1496818794-14771-1-git-send-email-gabriel.fernandez@st.com>
 <20170621220703.GI4493@codeaurora.org>
 <110cf67f-e1d6-1f99-953c-6b9639bb4910@st.com>
 <20170628155956.GA5316@codeaurora.org>
 <7c0c3861-cf61-a9e2-cd5d-2ae30b8f32fa@st.com>
 <20170630002008.GD22780@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170630002008.GD22780@codeaurora.org>
Content-Language: en-US
Content-ID: <C11821B759F09B4281A7F0F7934FE3B1@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, "andrea.merello@gmail.com" <andrea.merello@gmail.com>, "radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA2LzMwLzIwMTcgMDI6MjAgQU0sIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4gT24gMDYv
MjksIEdhYnJpZWwgRkVSTkFOREVaIHdyb3RlOg0KPj4NCj4+IE9uIDA2LzI4LzIwMTcgMDU6NTkg
UE0sIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4+PiBPbiAwNi8yNywgR2FicmllbCBGRVJOQU5ERVog
d3JvdGU6DQo+Pj4+IE9uIDA2LzIyLzIwMTcgMTI6MDcgQU0sIFN0ZXBoZW4gQm95ZCB3cm90ZToN
Cj4+Pj4+IHJlYWRsX3BvbGxfdGltZW91dD8NCj4+Pj4+DQo+Pj4+IGlmIGkgdXNlIHJlYWRsX3Bv
bGxfdGltZW91dCAod2ljaCB1c2UgJ2t0aW1lX2dldCgpJykgaXQgY2FuIGJlDQo+Pj4+IG9wZXJh
dGlvbmFsIG9ubHkgYWZ0ZXIgdGhlIHNlbGVjdGlvbiBvZiBjbG9ja3NvdXJjZSA/IChkZXZpY2Vf
aW5pdGNhbGwpLg0KPj4+PiBBbmQgdGhlbiBpZiBhIGRyaXZlciB0dXJuIG9uIGEgY2xvY2sgYmVm
b3JlLCBpdCBjb3VsZCBibG9ja2VkIHRoZSBsaW51eA0KPj4+PiBjb25zb2xlID8NCj4+Pj4NCj4+
PiBPay4gSSB3b25kZXIgaWYgd2UgY291bGQgYWRkIHNvbWUgc29ydCBvZiBzdGFydGluZyBjaGVj
ayB0bw0KPj4+IHJlYWRsX3BvbGxfdGltZW91dCgpIHRoYXQgdGVzdHMgc3lzdGVtX3N0YXRlIGZv
ciBib290aW5nIHZzLg0KPj4+IHNjaGVkdWxpbmc/IFRoYXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQg
dG8gaGFuZGxlIHRoaXMgY2FzZT8NCj4+Pg0KPj4gT29wcyBpIHRoaW5rIGkgdW5kZXJzdG9vZCBt
eSBwcm9ibGVtLi4uDQo+PiBpIHVzZWQgcmVhZGxfcG9sbF90aW1lb3V0IGluIGF0b21pYyBjb250
ZXh0Lg0KPj4gSSBoYXZlIHRvIG1vdmUgbXkgY29kZSBpbiB0aGUgLnByZXBhcmUgb3BzLg0KPj4N
Cj4+IElmIHlvdSBhcmUgb2sgd2l0aCB0aGF0IGkgd2lsbCBzZW5kIGEgdjUNCj4+DQo+IFRoZXJl
J3MgcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYygpIGZvciB0aG9zZSBtb2Rlcy4NCj4NCnllcyBp
dCdzIGV4YWN0bHkgdGhlIHRlc3QgaSBtYWRlICh1c2UgJ3JlYWRsX3BvbGxfdGltZW91dCgpX2F0
b21pYycgaW4gDQouZW5hYmxlIG9wcykgYnV0IGknbSBibG9ja2VkLg0KDQppZiBpIGRvIHRoZSBz
YW1lIGluIC5wcmVwYXJlIG9wcyB3aXRoICdyZWFkbF9wb2xsX3RpbWVvdXQoKScgaXQncyBvay4N
Cg==
