From: Kieran Bingham <kbingham@kernel.org>
Subject: [PATCH 3/8] dt-bindings: display: renesas,
 lvds: Add LVDS binding for D3
Date: Thu, 15 Feb 2018 08:38:18 +0000
Message-ID: <1518683903-10681-4-git-send-email-kbingham@kernel.org>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, geert@glider.be, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJk
LmNvbT4KClRoZSBEMyBzdXBwb3J0cyB0d28gTFZEUyBjaGFubmVscy4gRXh0ZW5kIHRoZSBiaW5k
aW5nIHRvIHN1cHBvcnQgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVy
YW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMs
bHZkcy50eHQKaW5kZXggNzk4NjBmNThhN2FkLi4wZGNmNDg4YjcwZGYgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2
ZHMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLGx2ZHMudHh0CkBAIC0xNCw2ICsxNCw3IEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6CiAtIGNvbXBhdGlibGUgOiBTaGFsbCBjb250YWluIG9uZSBvZgogICAtICJyZW5lc2FzLGx2
ZHMtcjhhNzc5NSIgZm9yIFI4QTc3OTUgKFItQ2FyIEgzKSBjb21wYXRpYmxlIExWRFMgZW5jb2Rl
cnMKICAgLSAicmVuZXNhcyxsdmRzLXI4YTc3OTYiIGZvciBSOEE3Nzk2IChSLUNhciBNMy1XKSBj
b21wYXRpYmxlIExWRFMgZW5jb2RlcnMKKyAgLSAicmVuZXNhcyxsdmRzLXI4YTc3OTk1IiBmb3Ig
UjhBNzc5OTUgKFItQ2FyIEQzKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKIAogLSByZWc6IEJh
c2UgYWRkcmVzcyBhbmQgbGVuZ3RoIGZvciB0aGUgbWVtb3J5LW1hcHBlZCByZWdpc3RlcnMKIC0g
Y2xvY2tzOiBBIHBoYW5kbGUgKyBjbG9jay1zcGVjaWZpZXIgcGFpciBmb3IgdGhlIGZ1bmN0aW9u
YWwgY2xvY2sKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
