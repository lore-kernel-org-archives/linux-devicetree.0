From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS
 driver
Date: Thu, 1 Mar 2018 21:04:53 +0300
Message-ID: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Language: en-MW
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

SGVsbG8hCgpIZXJlJ3MgdGhlIHNldCBvZiAyIHBhdGNoZXMgYWdhaW5zdCB0aGUgJ2RybS1uZXh0
JyBicmFuY2ggb2YgRGF2aWQgQWlybGllJ3MKJ2xpbnV4LmdpdCcgcmVwbyBwbHVzIExhdXJlbnQg
UGljbmFocnQncyBwYXRjaGVzIGNyZWF0aW5nIHRoZSBSLUNhciBMVkRTIGJyaWRnZQpkcml2ZXIg
cG9zdGVkIHJlY2VudGx5LiBUaGUgcHVycG9zZSBvZiB0aGVzZSBwYXRjaGVzIGlzIHRvIGFkZCB0
aGUgUi1DYXIgVjNNCihSOEE3Nzk3MCkgc3VwcG9ydCB0byB0aGUgUi1DYXIgTFZEUyBkcml2ZXIu
CgpbMS8yXSBEVDogZGlzcGxheTogcmVuZXNhcyxsdmRzOiBkb2N1bWVudCBSOEE3Nzk3MCBiaW5k
aW5ncwpbMi8yXSBkcm06IHJjYXItZHU6IGx2ZHM6IGFkZCBSOEE3Nzk3MCBzdXBwb3J0CgpNQlIs
IFNlcmdlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
