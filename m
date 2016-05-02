From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] of: include errno.h in of_graph.h
Date: Mon,  2 May 2016 12:59:19 +0200
Message-ID: <1462186769-2205767-1-git-send-email-arnd@arndb.de>
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
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

V2hlbiBDT05GSUdfT0YgaXMgZGlzYWJsZWQsIHdlIGhhdmUgdG8gaW5jbHVkZSBsaW51eC9lcnJu
by5oIGJlZm9yZQppbmNsdWRpbmcgb2ZfZ3JhcGguaCwgb3IgZ2V0IGJ1aWxkIGVycm9ycyBsaWtl
IGluIHRoZSBuZXdseSBhZGRlZApzdW40aSBkcm0gZHJpdmVyOgoKSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYzoxNDowOgppbmNsdWRlL2xp
bnV4L29mX2dyYXBoLmg6IEluIGZ1bmN0aW9uICdvZl9ncmFwaF9wYXJzZV9lbmRwb2ludCc6Cmlu
Y2x1ZGUvbGludXgvb2ZfZ3JhcGguaDo1ODoxMDogZXJyb3I6ICdFTk9TWVMnIHVuZGVjbGFyZWQg
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQoKQSBiZXR0ZXIgc29sdXRpb24gaXMgdG8gZW5z
dXJlIHRoYXQgdGhlIGhlYWRlciBjYW4gYmUgaW5jbHVkZWQKYnkgaXRzZWxmLCBzbyBsZXQncyBp
bmNsdWRlIGxpbnV4L2Vycm5vLmggaGVyZSB0byBmaXggdGhlIGVycm9yCndlIGp1c3QgZ290LCBh
bmQgYW55IHNpbWlsYXIgZnV0dXJlIGVycm9yLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KRml4ZXM6IDkwMjZlMGQxMjJhYyAoImRybTogQWRkIEFsbHdpbm5l
ciBBMTAgRGlzcGxheSBFbmdpbmUgc3VwcG9ydCIpCi0tLQogaW5jbHVkZS9saW51eC9vZl9ncmFw
aC5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L29mX2dyYXBoLmggYi9pbmNsdWRlL2xpbnV4L29mX2dyYXBoLmgKaW5kZXgg
ZjhiY2QwZTIxYTI2Li5iYjNhNWEyY2Q1NzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvb2Zf
Z3JhcGguaAorKysgYi9pbmNsdWRlL2xpbnV4L29mX2dyYXBoLmgKQEAgLTE1LDYgKzE1LDcgQEAK
ICNkZWZpbmUgX19MSU5VWF9PRl9HUkFQSF9ICiAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgor
I2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CiAKIC8qKgogICogc3RydWN0IG9mX2VuZHBvaW50IC0g
dGhlIE9GIGdyYXBoIGVuZHBvaW50IGRhdGEgc3RydWN0dXJlCi0tIAoyLjcuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
