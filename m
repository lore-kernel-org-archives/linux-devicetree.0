From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH v8 4/4] ARM: imx_v6_v7_defconfig: Enable DA9063 PMIC support.
Date: Tue, 27 Nov 2018 16:04:04 +0100
Message-ID: <20181127150407.15098-4-jan.tuerk@emtrion.com>
References: <20180829100811.55836-1-jan.tuerk@emtrion.com>
 <20181127150407.15098-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181127150407.15098-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux@armlinux.org.uk>, "GitAuthor: Jan Tuerk" <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWxsIHJlY2VudCBlbXRyaW9uIG1vZHVsZXMgYmFzZWQgb24gaS5teDYgbWFrZSB1c2Ugb2YgdGhl
IERBOTA2My4KVGhlcmVmb3JlIGVuYWJsZSBpdCB3aXRoIHRoZSBmb2xsb3dpbmcgZGVmYXVsdHM6
CgktIENPTkZJR19NRkRfREE5MDYzPXkKCS0gQ09ORklHX1JFR1VMQVRPUl9EQTkwNjM9eQoJLSBD
T05GSUdfREE5MDYzX1dBVENIRE9HPW0KTUZEIGFuZCBSRUdVTEFUT1IgYXJlIGJ1aWx0LWluIHRv
IGhhdmUgaXQgYXQgS2VybmVsIGJvb3QtdGltZS4KVGhlIFdBVENIRE9HIGlzIG9wdGlvbmFsIGFu
ZCBjb3VsZCBiZSBsb2FkZWQgZnJvbSB1c2Vyc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gVHVl
cmsgPGphbi50dWVya0BlbXRyaW9uLmNvbT4KLS0tCiBhcmNoL2FybS9jb25maWdzL2lteF92Nl92
N19kZWZjb25maWcgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKVW5j
aGFuZ2VkIHNpbmNlIHY2IChyZWJhc2VkKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mv
aW14X3Y2X3Y3X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZp
ZwppbmRleCAxYWQ1NzM2YzhmYTYuLmQzMzY1YzBmZDRhZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Y29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2
X3Y3X2RlZmNvbmZpZwpAQCAtMjI1LDEwICsyMjUsMTIgQEAgQ09ORklHX0NQVV9USEVSTUFMPXkK
IENPTkZJR19JTVhfVEhFUk1BTD15CiBDT05GSUdfV0FUQ0hET0c9eQogQ09ORklHX0RBOTA2Ml9X
QVRDSERPRz15CitDT05GSUdfREE5MDYzX1dBVENIRE9HPW0KIENPTkZJR19STjVUNjE4X1dBVENI
RE9HPXkKIENPTkZJR19JTVgyX1dEVD15CiBDT05GSUdfTUZEX0RBOTA1Ml9JMkM9eQogQ09ORklH
X01GRF9EQTkwNjI9eQorQ09ORklHX01GRF9EQTkwNjM9eQogQ09ORklHX01GRF9NQzEzWFhYX1NQ
ST15CiBDT05GSUdfTUZEX01DMTNYWFhfSTJDPXkKIENPTkZJR19NRkRfUk41VDYxOD15CkBAIC0y
MzgsNiArMjQwLDcgQEAgQ09ORklHX1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdFPXkKIENPTkZJR19S
RUdVTEFUT1JfQU5BVE9QPXkKIENPTkZJR19SRUdVTEFUT1JfREE5MDUyPXkKIENPTkZJR19SRUdV
TEFUT1JfREE5MDYyPXkKK0NPTkZJR19SRUdVTEFUT1JfREE5MDYzPXkKIENPTkZJR19SRUdVTEFU
T1JfR1BJTz15CiBDT05GSUdfUkVHVUxBVE9SX01DMTM3ODM9eQogQ09ORklHX1JFR1VMQVRPUl9N
QzEzODkyPXkKLS0gCmVtdHJpb24gR21iSApBbHRlciBTY2hsYWNodGhvZiA0NQo3NjEzMSBLYXJs
c3J1aGUKR0VSTUFOWQpodHRwczovL3d3dy5lbXRyaW9uLmRlCgpBbXRzZ2VyaWNodCBNYW5uaGVp
bQpIUkIgMTEwIDMwMApHZXNjaMOkZnRzZsO8aHJlcjogRGlldGVyIEJhdXIsIFJhbW9uYSBNYXVy
ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
