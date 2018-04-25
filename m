From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v2 1/2] dt-bindings/display/bridge: sii902x: add optional
 power supplies
Date: Wed, 25 Apr 2018 09:53:13 +0200
Message-ID: <20180425075314.19137-2-philippe.cornu@st.com>
References: <20180425075314.19137-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180425075314.19137-1-philippe.cornu@st.com>
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

QWRkIG9wdGlvbmFsIHBvd2VyIHN1cHBsaWVzIHVzaW5nIHRoZSBkZXNjcmlwdGlvbiBmb3VuZCBp
bgoiU2lJOTAyMkEvU2lJOTAyNEEgSERNSSBUcmFuc21pdHRlciBEYXRhIFNoZWV0IChBdWd1c3Qg
MjAxNikiLgoKVGhlcmUgaXMgYSBzaW5nbGUgMXYyIHN1cHBseSB2b2x0YWdlIG5hbWVkIHZjYzEy
IGZyb20gd2hpY2ggY3ZjYzEyCihkaWdpdGFsIGNvcmUpIGFuZCBhdmNjMTIgKFRNRFMgYW5hbG9n
KSBhcmUgZGVyaXZlZCBiZWNhdXNlIGFjY29yZGluZwp0byB0aGlzIGRhdGEgc2hlZXQ6CiJjdmNj
MTIgYW5kIGF2Y2MxMiBjYW4gYmUgZGVyaXZlZCBmcm9tIHRoZSBzYW1lIHBvd2VyIHNvdXJjZSIK
ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkw
MngudHh0IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5
MDJ4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9zaWk5MDJ4LnR4dAppbmRleCA1NmEzZTY4Y2NiODAuLjlmYjQxZmM5YWY1MSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkw
MngudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9zaWk5MDJ4LnR4dApAQCAtOCw2ICs4LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIAkt
IGludGVycnVwdHMtZXh0ZW5kZWQgb3IgaW50ZXJydXB0LXBhcmVudCArIGludGVycnVwdHM6IGRl
c2NyaWJlCiAJICB0aGUgaW50ZXJydXB0IGxpbmUgdXNlZCB0byBpbmZvcm0gdGhlIGhvc3QgYWJv
dXQgaG90cGx1ZyBldmVudHMuCiAJLSByZXNldC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBz
cGVjaWZpY2F0aW9uIGZvciBSU1RfTiBwaW4uCisJLSBpb3ZjYy1zdXBwbHk6IEkvTyBzdXBwbHkg
dm9sdGFnZSAoMS44ViBvciAzLjNWLCBob3N0LWRlcGVuZGVudCkuCisJLSB2Y2MxMi1zdXBwbHk6
IFRNRFMgYW5hbG9nICYgZGlnaXRhbCBjb3JlIHN1cHBseSB2b2x0YWdlICgxLjJWKS4KIAogT3B0
aW9uYWwgc3Vibm9kZXM6CiAJLSB2aWRlbyBpbnB1dDogdGhpcyBzdWJub2RlIGNhbiBjb250YWlu
IGEgdmlkZW8gaW5wdXQgcG9ydCBub2RlCi0tIAoyLjE1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
