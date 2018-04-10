From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH 1/2] dt-bindings/display/bridge: sii902x: add optional power
 supplies
Date: Tue, 10 Apr 2018 07:19:26 +0200
Message-ID: <20180410051927.8268-2-philippe.cornu@st.com>
References: <20180410051927.8268-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180410051927.8268-1-philippe.cornu@st.com>
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

QWRkIHRoZSAzIG9wdGlvbmFsIHBvd2VyIHN1cHBsaWVzIHVzaW5nIHRoZSBleGFjdCBkZXNjcmlw
dGlvbgpmb3VuZCBpbiB0aGUgZG9jdW1lbnQgbmFtZWQKIlNpSTkwMjJBL1NpSTkwMjRBIEhETUkg
VHJhbnNtaXR0ZXIgRGF0YSBTaGVldCAoQXVndXN0IDIwMTYpIi4KClNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQKaW5k
ZXggNTZhM2U2OGNjYjgwLi5jZjUzNjc4ZmU1NzQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQK
QEAgLTgsNiArOCw5IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAJLSBpbnRlcnJ1cHRzLWV4dGVu
ZGVkIG9yIGludGVycnVwdC1wYXJlbnQgKyBpbnRlcnJ1cHRzOiBkZXNjcmliZQogCSAgdGhlIGlu
dGVycnVwdCBsaW5lIHVzZWQgdG8gaW5mb3JtIHRoZSBob3N0IGFib3V0IGhvdHBsdWcgZXZlbnRz
LgogCS0gcmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbiBmb3Ig
UlNUX04gcGluLgorCS0gaW92Y2Mtc3VwcGx5OiBJL08gc3VwcGx5IHZvbHRhZ2UgKDEuOFYgb3Ig
My4zViwgaG9zdC1kZXBlbmRlbnQpLgorCS0gYXZjYzEyLXN1cHBseTogVE1EUyBhbmFsb2cgc3Vw
cGx5IHZvbHRhZ2UgKDEuMlYpLgorCS0gY3ZjYzEyLXN1cHBseTogRGlnaXRhbCBjb3JlIHN1cHBs
eSB2b2x0YWdlICgxLjJWKS4KIAogT3B0aW9uYWwgc3Vibm9kZXM6CiAJLSB2aWRlbyBpbnB1dDog
dGhpcyBzdWJub2RlIGNhbiBjb250YWluIGEgdmlkZW8gaW5wdXQgcG9ydCBub2RlCi0tIAoyLjE1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
