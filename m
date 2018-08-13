From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3 2/8] drm/bridge/synopsys: dsi: don't call
 __dw_mipi_dsi_probe from dw_mipi_dsi_bind
Date: Mon, 13 Aug 2018 10:07:46 +0200
Message-ID: <20180813080749eucas1p23dae9ea1f8cf6ebe9cf492b3216ab8d7~KYy1KkmeY1225112251eucas1p2Q@eucas1p2.samsung.com>
References: <20180709134834.11035-1-heiko@sntech.de>
 <CGME20180709142150epcas3p2eccaed65c62c39c0cbc01cddd30b86e8@epcas3p2.samsung.com>
 <20180709134834.11035-3-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180709134834.11035-3-heiko@sntech.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, briannorris@chromium.org, hoegsberg@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com, robh+dt@kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, mka@chromium.org
List-Id: devicetree@vger.kernel.org

T24gMDkuMDcuMjAxOCAxNTo0OCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gX19kd19taXBpX2Rz
aV9wcm9iZSgpIGRvZXMgYWxsIHRoZSBncmFiYmluZyBvZiByZXNvdXJjZXMgYW5kIGRvZXMgaXQg
dXNpbmcKPiBkZXZtLWhlbHBlcnMuIFNvIHRoaXMgaXMgaGFwcGVuaW5nIG9uIGVhY2ggdHJ5IG9m
IG1hc3RlciBicmluZ3VwIHBvc3NpYmx5Cj4gc2xvd2luZyBkb3duIHRoaW5ncyBhIGxvdC4KPgo+
IERyaXZlcnMgdXNpbmcgdGhlIGNvbXBvbmVudCBmcmFtZXdvcmsgbWF5IGluc3RlYWQgd2FudCBj
YWxsIGR3X21pcGlfZHNpX3Byb2JlCj4gc2VwYXJhdGVseSBpbiB0aGVpciBwcm9iZSBmdW5jdGlv
biBzZXR1cCByZXNvdXJjZXMgZWFybHkuIFRoYXQgd2F5IHRoZSBkc2kKPiBidXMgYWxzbyBnZXRz
IGNyZWF0ZWQgZWFybGllciBhbmQgYWxzbyBub3QgcmVjcmVhdGVkIG9uIGVhY2ggYmluZC10cnks
IHNvCj4gdGhhdCBhdHRhY2hlZCBwYW5lbHMgY2FuIGxvYWQgdGhlaXIgbW9kdWxlcyBhbmQgYmUg
cHJvYmVkIHdheSBiZWZvcmUgdGhlCj4gYnJpZGdlLWF0dGFjaCBpbiB0aGUgYmluZCBjYWxsLgo+
Cj4gU28gZHJvcCB0aGUgY2FsbCB0byBfX2R3X21pcGlfZHNpX3Byb2JlIGFuZCBtb2RpZnkgdGhl
IGZ1bmN0aW9uIHRvIHRha2UKPiBhIHN0cnVjdCBkd19taXBpX2RzaSBpbnN0ZWFkIG9mIHRoZSBw
bGF0Zm9ybS1kZXZpY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
