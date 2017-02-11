From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v4 4/7] of: Add vendor prefix for Multi-Inno
Date: Sat, 11 Feb 2017 19:48:55 +0100
Message-ID: <20170211184858.26421-5-noralf@tronnes.org>
References: <20170211184858.26421-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170211184858.26421-1-noralf@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

TXVsdGktSW5ubyBUZWNobm9sb2d5IENvLixMdGQgaXMgYSBIb25nIEtvbmcgYmFzZWQgY29tcGFu
eSBvZmZlcmluZwpMQ0QsIExDRCBtb2R1bGUgcHJvZHVjdHMgYW5kIGNvbXBsZXRlIHBhbmVsIHNv
bHV0aW9ucy4KClNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMu
b3JnPgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dAppbmRleCAxZTRlODRlLi5hMGMz
ZDJiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9y
LXByZWZpeGVzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnR4dApAQCAtMTk0LDYgKzE5NCw3IEBAIG1wbAlNUEwgQUcKIG1xbWFrZXIJ
bXFtYWtlciBJbmMuCiBtc2kJTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiBMdGQuCiBtdGkJ
SW1hZ2luYXRpb24gVGVjaG5vbG9naWVzIEx0ZC4gKGZvcm1lcmx5IE1JUFMgVGVjaG5vbG9naWVz
IEluYy4pCittdWx0aS1pbm5vCU11bHRpLUlubm8gVGVjaG5vbG9neSBDby4sTHRkCiBtdW5kb3Jl
YWRlcglNdW5kbyBSZWFkZXIgUy5MLgogbXVyYXRhCU11cmF0YSBNYW51ZmFjdHVyaW5nIENvLiwg
THRkLgogbXhpY3kJTWFjcm9uaXggSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4KLS0gCjIuMTAuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
