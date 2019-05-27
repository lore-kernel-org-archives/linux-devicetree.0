From: Pramod Kumar <pramod.kumar_1@nxp.com>
Subject: [PATCH 3/3] arm64: dts: frwy-ls1046a: add support for micron nor
 flash
Date: Mon, 27 May 2019 12:04:25 +0000
Message-ID: <20190527120619.30546-4-pramod.kumar_1@nxp.com>
References: <20190527120619.30546-1-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527120619.30546-1-pramod.kumar_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ashish Kumar <ashish.kumar@nxp.com>
List-Id: devicetree@vger.kernel.org

YWRkIG1pY3JvbiBub3IgZmxhc2ggc3VwcG9ydCBmb3IgbHMxMDQ2YSBmcnd5IGJvYXJkLg0KDQpT
aWduZWQtb2ZmLWJ5OiBBc2hpc2ggS3VtYXIgPGFzaGlzaC5rdW1hckBueHAuY29tPg0KU2lnbmVk
LW9mZi1ieTogUHJhbW9kIEt1bWFyIDxwcmFtb2Qua3VtYXJfMUBueHAuY29tPg0KLS0tDQogLi4u
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS1mcnd5LmR0cyAgICB8IDE4ICsrKysrKysr
KysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMx
MDQ2YS1mcnd5LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZh
LWZyd3kuZHRzDQppbmRleCBjZGE0OTk4OGQ4YjguLjBmNjI2Yzk4NmE5YSAxMDA2NDQNCi0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZhLWZyd3kuZHRzDQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS1mcnd5LmR0cw0KQEAg
LTIsNyArMiw3IEBADQogLyoNCiAgKiBEZXZpY2UgVHJlZSBJbmNsdWRlIGZpbGUgZm9yIEZyZWVz
Y2FsZSBMYXllcnNjYXBlLTEwNDZBIGZhbWlseSBTb0MuDQogICoNCi0gKiBDb3B5cmlnaHQgMjAx
OSBOWFAuDQorICogQ29weXJpZ2h0IDIwMTkgTlhQDQogICoNCiAgKi8NCiANCkBAIC0xMTMsNiAr
MTEzLDIyIEBADQogDQogfTsNCiANCismcXNwaSB7DQorCW51bS1jcyA9IDwxPjsNCisJYnVzLW51
bSA9IDwwPjsNCisJc3RhdHVzID0gIm9rYXkiOw0KKw0KKwlxZmxhc2gwOiBmbGFzaEAwIHsNCisJ
CWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7DQorCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
CisJCSNzaXplLWNlbGxzID0gPDE+Ow0KKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+
Ow0KKwkJcmVnID0gPDA+Ow0KKwkJc3BpLXJ4LWJ1cy13aWR0aCA9IDw0PjsNCisJCXNwaS10eC1i
dXMtd2lkdGggPSA8ND47DQorCX07DQorfTsNCisNCiAjaW5jbHVkZSAiZnNsLWxzMTA0Ni1wb3N0
LmR0c2kiDQogDQogJmZtYW4wIHsNCi0tIA0KMi4xNy4xDQoNCg==
