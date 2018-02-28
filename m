From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 05/17] dt-bindings: display: add HPD gpio to DVI connector
Date: Wed, 28 Feb 2018 13:26:02 +0200
Message-ID: <1519817174-20714-6-git-send-email-tomi.valkeinen@ti.com>
References: <1519817174-20714-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1519817174-20714-1-git-send-email-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QWRkIGhwZC1ncGlvcyBwcm9wZXJ0eSB0byBkdmktY29ubmVjdG9yLnR4dC4KClNpZ25lZC1vZmYt
Ynk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9jb25uZWN0b3IvZHZpLWNvbm5lY3Rvci50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2Nvbm5lY3Rvci9kdmktY29ubmVjdG9yLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9kdmktY29ubmVjdG9yLnR4dAppbmRl
eCBmYzUzZjdjNjBiYzYuLjIwN2U0MmU5ZWJhMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2R2aS1jb25uZWN0b3IudHh0Cisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9k
dmktY29ubmVjdG9yLnR4dApAQCAtMTAsNiArMTAsNyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgog
LSBhbmFsb2c6IHRoZSBjb25uZWN0b3IgaGFzIERWSSBhbmFsb2cgcGlucwogLSBkaWdpdGFsOiB0
aGUgY29ubmVjdG9yIGhhcyBEVkkgZGlnaXRhbCBwaW5zCiAtIGR1YWwtbGluazogdGhlIGNvbm5l
Y3RvciBoYXMgcGlucyBmb3IgRFZJIGR1YWwtbGluaworLSBocGQtZ3Bpb3M6IEhQRCBHUElPIG51
bWJlcgogCiBSZXF1aXJlZCBub2RlczoKIC0gVmlkZW8gcG9ydCBmb3IgRFZJIGlucHV0Ci0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
