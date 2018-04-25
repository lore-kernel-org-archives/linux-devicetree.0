From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v2 0/2] drm/bridge: sii902x: add optional power supplies
Date: Wed, 25 Apr 2018 09:53:12 +0200
Message-ID: <20180425075314.19137-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaHNldCBhZGRzIG9wdGlvbmFsIHBvd2VyIHN1cHBsaWVzIHRvIHRoZSBzaWk5MDJ4
CmRybSBicmlkZ2UgZHJpdmVyLgoKVmVyc2lvbiAyOgotIG1lcmdlIGF2Y2MxMiAmIGN2Y2MxMiB0
byBhIHNpbmdsZSB2Y2MxMiBzdXBwbHkgYXMgc3VnZ2VzdGVkIGJ5CiAgTGF1cmVudCBQaW5jaGFy
dCAoc2VlIGRpc2N1c3Npb24gZGV0YWlscyBpbgogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8yMTYwNTgvKQotIGltcHJvdmUgZXJyb3IgbWVzc2FnZXMgZm9sbG93aW5n
IExhdXJlbnQgUGluY2hhcnQgY29tbWVudHMuCi0gbm90ZSBhYm91dCBwb3dlciBjb25zdW1wdGlv
bjogYXMgc2lpOTAyeCBpbnB1dCBJT3MgYXJlIG5vdCAiaW8gc2FmZSIsCiAgaXQgaXMgaW1wb3J0
YW50IHRvIGVuYWJsZS9kaXNhYmxlIHZvbHRhZ2UgcmVndWxhdG9ycyBkdXJpbmcKICBwcm9iZS9y
ZW1vdmUgcGhhc2VzIHRvIGF2b2lkIGRhbWFnZXMuIFRoZW4sIHRoZSBvbmx5IHdheSB0byBpbXBy
b3ZlCiAgdGhlIHBvd2VyIGNvbnN1bXB0aW9uIGlzIHRvIGFkZCB0aGUgc2lpOTAyeCBzdGFuZHkg
bW9kZS4gTXkgYWN0dWFsCiAgcGxhdGZvcm0gaXMgbm90IGFuIGhhbmRoZWxkIGRldmljZSBzbyBw
b3dlciBjb25zdW1wdGlvbiBpcyBub3QKICBjcml0aWNhbC4gQnV0IGluIHRoZSBmdXR1cmUsIGl0
IGNvdWxkIGJlIG5pY2UgdG8gYWRkIHRoZSBzdGFuZGJ5CiAgbW9kZSwgcGF5aW5nIGF0dGVudGlv
biB0byB3YWtlLXVwIGV2ZW50cyAoaGRtaSBjYWJsZSBwbHVnKS4uLgoKVmVyc2lvbiAxOgotIElu
aXRpYWwgY29tbWl0CgpQaGlsaXBwZSBDb3JudSAoMik6CiAgZHQtYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2U6IHNpaTkwMng6IGFkZCBvcHRpb25hbCBwb3dlciBzdXBwbGllcwogIGRybS9icmlkZ2U6
IHNpaTkwMng6IGFkZCBvcHRpb25hbCBwb3dlciBzdXBwbGllcwoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgIDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTAyeC5jICAgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysr
KysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKLS0gCjIuMTUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
