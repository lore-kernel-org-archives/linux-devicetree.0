From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH v2 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Date: Mon, 22 Jul 2019 18:05:59 +0200
Message-ID: <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@st.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QXMgc3RhdGVkIGluIFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJl
cXVpcmVkIGZvciBJMlMuCk1ha2UgbWNsayBwcm9wZXJ0eSBvcHRpb25hbCBpbiBEVCBiaW5kaW5n
cy4KCkZpeGVzOiAzZjE4MDIxZjQzYTMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAyeDog
QWRkIEhETUkgYXVkaW8gYmluZGluZ3MiKQoKU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4g
PG9saXZpZXIubW95c2FuQHN0LmNvbT4KUmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+CkFja2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dCB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CmluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUw
ODdjMGQwIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2Uvc2lpOTAyeC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CkBAIC0yNiw5ICsyNiw4IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6CiAJLSBjbG9ja3M6IHBoYW5kbGUgYW5kIGNsb2NrIHNwZWNpZmllciBm
b3IgZWFjaCBjbG9jayBsaXN0ZWQgaW4KICAgICAgICAgICAgdGhlIGNsb2NrLW5hbWVzIHByb3Bl
cnR5CiAJLSBjbG9jay1uYW1lczogIm1jbGsiCi0JICAgRGVzY3JpYmVzIFNJSTkwMnggTUNMSyBp
bnB1dC4gTUNMSyBpcyB1c2VkIHRvIHByb2R1Y2UKLQkgICBIRE1JIGF1ZGlvIENUUyB2YWx1ZXMu
IFRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgaWYKLQkgICAiI3NvdW5kLWRhaS1jZWxscyItcHJv
cGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCisJICAgRGVzY3JpYmVzIFNJ
STkwMnggTUNMSyBpbnB1dC4gTUNMSyBjYW4gYmUgdXNlZCB0byBwcm9kdWNlCisJICAgSERNSSBh
dWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGZvbGxvd3MKIAkgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0CiAJICAgY29uc3Vt
ZXIgYmluZGluZy4KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
