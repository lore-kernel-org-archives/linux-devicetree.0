From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 3/3] ARM: dts: rockchip: Use GPU as cooling device for the
 GPU thermal zone of the rk3288
Date: Thu, 16 May 2019 10:25:10 -0700
Message-ID: <20190516172510.181473-3-mka@chromium.org>
References: <20190516172510.181473-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190516172510.181473-1-mka@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Q3VycmVudGx5IHRoZSBDUFVzIGFyZSB1c2VkIGFzIGNvb2xpbmcgZGV2aWNlcyBvZiB0aGUgcmsz
Mjg4IEdQVQp0aGVybWFsIHpvbmUuIFRoZSBDUFVzIGFyZSBhbHNvIGNvbmZpZ3VyZWQgYXMgY29v
bGluZyBkZXZpY2VzIGluIHRoZQpDUFUgdGhlcm1hbCB6b25lLCB3aGljaCBpbmRpcmVjdGx5IGhl
bHBzIHdpdGggY29vbGluZyB0aGUgR1BVIHRoZXJtYWwKem9uZSwgc2luY2UgdGhlIENQVSBhbmQg
R1BVIHRlbXBlcmF0dXJlcyBhcmUgY29ycmVsYXRlZCBvbiB0aGUgcmszMjg4LgoKQ29uZmlndXJl
IHRoZSBBUk0gTWFsaSBNaWRnYXJkIEdQVSBhcyBjb29saW5nIGRldmljZSBmb3IgdGhlIEdQVQp0
aGVybWFsIHpvbmUgaW5zdGVhZCBvZiB0aGUgQ1BVcy4KClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFz
IEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBwYXRjaCBh
ZGRlZCB0byB0aGUgc2VyaWVzCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgfCA1
ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9yazMyODguZHRzaQppbmRleCAxNGQ5NjA5ZjBiMTUuLjk4ODU1NWM1MTE4ZCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvcmszMjg4LmR0c2kKQEAgLTU0NywxMCArNTQ3LDcgQEAKIAkJCQltYXAwIHsKIAkJCQkJdHJp
cCA9IDwmZ3B1X2FsZXJ0MD47CiAJCQkJCWNvb2xpbmctZGV2aWNlID0KLQkJCQkJCTwmY3B1MCBU
SEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAotCQkJCQkJPCZjcHUxIFRIRVJNQUxf
Tk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCi0JCQkJCQk8JmNwdTIgVEhFUk1BTF9OT19MSU1J
VCBUSEVSTUFMX05PX0xJTUlUPiwKLQkJCQkJCTwmY3B1MyBUSEVSTUFMX05PX0xJTUlUIFRIRVJN
QUxfTk9fTElNSVQ+OworCQkJCQkJPCZncHUgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJ
TUlUPjsKIAkJCQl9OwogCQkJfTsKIAkJfTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
