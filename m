From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v1 0/2] drm/panel: otm8009a: Add support for the optional
 power-supply
Date: Mon, 5 Feb 2018 10:45:30 +0100
Message-ID: <20180205094532.23547-1-philippe.cornu@st.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org

U29tZSBib2FyZHMgdXNlIGEgZGVkaWNhdGVkIHZvbHRhZ2UgcmVndWxhdG9yIGZvciB0aGlzIHBh
bmVsLgpBZGQgJiBEb2N1bWVudCB0aGlzIHJlbGF0ZWQgb3B0aW9uYWwgcG93ZXItc3VwcGx5IHBy
b3BlcnR5IGFuZAphZGQgaXRzIHN1cHBvcnQgaW4gdGhlIGRyaXZlci4KClBoaWxpcHBlIENvcm51
ICgyKToKICBkdC1iaW5kaW5ncy9kaXNwbGF5L3BhbmVsOiBvdG04MDA5YTogQWRkIG9wdGlvbmFs
IHBvd2VyLXN1cHBseQogICAgcHJvcGVydHkKICBkcm0vcGFuZWw6IG90bTgwMDlhOiBBZGQgc3Vw
cG9ydCBmb3IgdGhlIG9wdGlvbmFsIHBvd2VyLXN1cHBseQoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLW9yaXNldGVjaC1vdG04MDA5YS5jICAgICAgICB8IDE3ICsrKysrKysr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKCi0tIAoyLjE1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
