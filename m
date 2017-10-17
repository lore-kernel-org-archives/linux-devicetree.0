From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/4] dt-bindings: display: amlogic,
 meson-dw-hdmi: Add optional HDMI 5V regulator
Date: Tue, 17 Oct 2017 10:07:42 +0200
Message-ID: <1508227664-11171-3-git-send-email-narmstrong@baylibre.com>
References: <1508227664-11171-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1508227664-11171-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gcmVmZXJlbmNlIGJvYXJkcyBhbmQgZGVyaXZhdGl2ZXMsIHRoZSBIRE1JIExvZ2ljIGlzIHBv
d2VyZWQgYnkgYW4gZXh0ZXJuYWwKNVYgcmVndWxhdG9yLgpUaGlzIHJlZ3VsYXRvciB3YXMgc2V0
IGJ5IHRoZSBWZW5kb3IgVS1Cb290LCBhZGQgb3B0aW9uYWwgc3VwcG9ydCBmb3IgaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1k
dy1oZG1pLnR4dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9n
aWMsbWVzb24tZHctaGRtaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkudHh0CmluZGV4IDdmMDQwZWQuLmJmNGExODAg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Ft
bG9naWMsbWVzb24tZHctaGRtaS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnR4dApAQCAtNDgsNiArNDgsMTAg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jlc2V0L3Jlc2V0LnR4dCwKICAgdGhlIHJlc2V0LW5hbWVzIHNob3VsZCBiZSAiaGRtaXR4
X2FwYiIsICJoZG1pdHgiLCAiaGRtaXR4X3BoeSIKIAorT3B0aW9uYWwgcHJvcGVydGllczoKKy0g
aGRtaS1zdXBwbHk6IE9wdGlvbmFsIHBoYW5kbGUgdG8gYW4gZXh0ZXJuYWwgNVYgcmVndWxhdG9y
IHRvIHBvd2VyIHRoZSBIRE1JCisgIGxvZ2ljLCBhcyBkZXNjcmliZWQgaW4gdGhlIGZpbGUgLi4v
cmVndWxhdG9yL3JlZ3VsYXRvci50eHQKKwogUmVxdWlyZWQgbm9kZXM6CiAKIFRoZSBjb25uZWN0
aW9ucyB0byB0aGUgSERNSSBwb3J0cyBhcmUgbW9kZWxlZCB1c2luZyB0aGUgT0YgZ3JhcGgKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
