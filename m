From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 5/6] dt-bindings: add Sharp LQ123P1JX31 panel binding
Date: Sun, 12 Jun 2016 10:56:16 +0800
Message-ID: <1465700176-13716-1-git-send-email-ykk@rock-chips.com>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, emil.l.velikov@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

VGhlIFNoYXJwIExRMTIzUDFKWDMxIGlzIGFuIDEyLjMiIDI0MDB4MTYwMCBURlQtTENEIHBhbmVs
CmNvbm5lY3RlZCB1c2luZyBlRFAgaW50ZXJmYWNlcy4KClNpZ25lZC1vZmYtYnk6IFlha2lyIFlh
bmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRp
YW5kZXJzQGNocm9taXVtLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gRHJvcCB0aGUgZXh0cmEg
Y29tbWEgaW4gY29tcGF0aWJsZSBuYW1lIChSb2IpCi0gQWRkIHRoZSByZXZpZXdlZCBmbGFnIGZy
b20gRG91ZwoKQ2hhbmdlcyBpbiB2MjoKLSBBZGQgZHQtYmluZGluZ3Mgb2YgU2hhcnAgTFExMjNQ
MUpYMzEgcGFuZWwgaW4gdjIKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3NoYXJwLGxxMTIzcDFqeDMxLnR4dCAgICAgICAgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTEyM3AxangzMS50eHQKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9z
aGFycCxscTEyM3AxangzMS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9zaGFycCxscTEyM3AxangzMS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMC4uYmNiMGU4YQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMTIzcDFqeDMxLnR4dApA
QCAtMCwwICsxLDcgQEAKK1NoYXJwIDEyLjMiICgyNDAweDE2MDAgcGl4ZWxzKSBURlQgTENEIHBh
bmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAic2hh
cnAsbHExMjNwMWp4MzEiCisKK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNp
bXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKK2luIHNpbXBsZS1wYW5lbC50
eHQgaW4gdGhpcyBkaXJlY3RvcnkuCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
