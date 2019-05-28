From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv4 24/24] dt-bindings: tc358767: add HPD support
Date: Tue, 28 May 2019 11:27:47 +0300
Message-ID: <20190528082747.3631-25-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

QWRkIERUIHByb3BlcnR5IGZvciBkZWZpbmluZyB0aGUgcGluIHVzZWQgZm9yIEhQRC4KClNpZ25l
ZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2Ny50eHQgICAgICB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3
NjcudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3Rvc2hpYmEsdGMzNTg3NjcudHh0CmluZGV4IGUzZjZhYTZhMjE0ZC4uNTgzYzVlOWRiZTZiIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdG9zaGliYSx0YzM1ODc2Ny50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3NjcudHh0CkBAIC0xMiw2ICsxMiw3
IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAgICAgICAgKGFjdGl2ZSBoaWdo
IHNodXRkb3duIGlucHV0KQogIC0gcmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3Bl
Y2lmaWNhdGlvbiBmb3IgUlNUWCBwaW4KICAgICAgICAgICAgICAgICAoYWN0aXZlIGxvdyBzeXN0
ZW0gcmVzZXQpCisgLSB0b3NoaWJhLGhwZC1waW46IFRDMzU4NzY3IEdQSU8gcGluIG51bWJlciB0
byB3aGljaCBIUEQgaXMgY29ubmVjdGVkIHRvICgwIG9yIDEpCiAgLSBwb3J0czogdGhlIHBvcnRz
IG5vZGUgY2FuIGNvbnRhaW4gdmlkZW8gaW50ZXJmYWNlIHBvcnQgbm9kZXMgdG8gY29ubmVjdAog
ICAgdG8gYSBEUEkvRFNJIHNvdXJjZSBhbmQgdG8gYW4gZURQL0RQIHNpbmsgYWNjb3JkaW5nIHRv
IFsxXVsyXToKICAgICAtIHBvcnRAMDogRFNJIGlucHV0IHBvcnQKLS0gClRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51
cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
