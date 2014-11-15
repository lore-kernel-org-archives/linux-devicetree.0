From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy
 configuration to platform driver
Date: Sat, 15 Nov 2014 10:54:47 +0000
Message-ID: <20141115105447.GJ4042@n2100.arm.linux.org.uk>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
 <5465D73C.9030507@imgtec.com> <5465DF0C.50301@rock-chips.com>
 <5465DFB2.8060601@imgtec.com> <5465E2BB.1070507@rock-chips.com>
 <5465E3DF.6050307@imgtec.com>
 <CAGS+omANityD4ZbqLzgrbro6WSTWozXS9fvdwof=Mv_X8OpHRg@mail.gmail.com>
 <20141115101218.GI4042@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20141115101218.GI4042@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Xu Jianqun <jay.xu@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "mark.yao@rock-chips.com" <mark.yao@rock-chips.com>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <gala>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCBOb3YgMTUsIDIwMTQgYXQgMTA6MTI6MThBTSArMDAwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IHdyb3RlOgo+IE9uY2UgdGhlIHdyYW5nbGluZ3Mgb24gdGhlIHBhdGNoIHNlcmll
cyBhcmUgY29tcGxldGUsIEkgZG8gaW50ZW5kIHRvIHRlc3QKPiBpdCBvbiB0aGUgcGxhdGZvcm1z
IEkgaGF2ZSAtIGFuZCByZW1lbWJlciB0aGF0IEkgZG8gaGF2ZSB0aGUgQUxTQSBiYXNlZAo+IGF1
ZGlvIGFuZCBDRUMgYml0cyBhcyB3ZWxsLCBzb21lIG9mIHdoaWNoIHdpbGwgcHJvYmFibHkgbmVl
ZCBhIGxpdHRsZSBiaXQKPiBvZiByZS13b3JrLgo+IAo+IEFsbCBpbiBhbGwsIEkgd2VsY29tZSB0
aGUgcmVuYW1pbmcgb2YgdGhpcyB0byBpbmNsdWRlIGEgcmVmZXJlbmNlIHRvCj4gRGVzaWduV2Fy
ZSAtIEkndmUgYWx3YXlzIHRob3VnaHQgaXQncyBhIG1pc3Rha2UgdGhhdCB0aGUgSERNSSBpbnRl
cmZhY2UKPiBpbiBpTVg2IHdhcyBub3QgbmFtZWQgd2l0aCBhICJkdyIgcHJlZml4IGFzIHRoZSBk
b2NzIGNvbnRhaW4gcmVmZXJlbmNlcwo+IHRvIGl0IGJlaW5nIGEgRGVzaWduV2FyZSBJUCBtb2R1
bGUuCgpPbmUgdGhpbmcgSSB3b3VsZCBhc2sgaXMgdGhhdCB0aGUgc3Vic2VxdWVudCBzdWJtaXNz
aW9ucyBkbyBub3QgdGhyZWFkCm9udG8gdGhlIHByZXZpb3VzIHN1Ym1pc3Npb24uCgpJdCBtYXkg
c2VlbSBhIGdvb2QgaWRlYSAocGVvcGxlIGNsYWltIHRoYXQgaXQgYWxsb3dzIHRoZSBwcmV2aW91
cyByZXZpZXdzCnRvIGJlIHRyaXZpYWxseSBmb3VuZCkgYnV0IHRoZXNlIHBlb3BsZSBmb3JnZXQg
YW4gaW1wb3J0YW50IHNpZGUgZWZmZWN0CmZyb20gdGhpcyBiZWhhdmlvdXIgLSB3aGVuIGxvb2tp
bmcgYXQgdGhlIG1lc3NhZ2UgaW5kZXggaW4gYSB0aHJlYWRlZAptYWlsIHJlYWRlciAobGlrZSBt
dXR0KSwgZWFjaCByZXBseSB0byBhIHRocmVhZCBtb3ZlcyB0aGUgc3ViamVjdCBsaW5lCmJ5IHRo
cmVlIGNoYXJhY3RlcnMgdG8gdGhlIHJpZ2h0LiAgV2hhdCB0aGlzIG1lYW5zIGlzIHRoYXQgYWZ0
ZXIgYWJvdXQKZml2ZSBvciBzaXggaXRlcmF0aW9ucyBvZiB0aGUgc3VibWlzc2lvbiwgdGhlcmUg
aXMgbm8gbG9uZ2VyIGFueSBzdWJqZWN0CmxpbmUgdmlzaWJsZS4KCk1vcmVvdmVyLCBpdCBtZWFu
cyB0aGF0IHdpdGggbGVzc2VyIGl0ZXJhdGlvbnMsIGl0IGJlY29tZXMgbXVjaCBtb3JlCmRpZmZp
Y3VsdCB0byBzZWUgL2FueS8gb2YgdGhlIHJldmlldyB0aHJlYWQgc3RydWN0dXJlLgoKSSB3b3Vs
ZCBzdWdnZXN0IHRoYXQgaWYgeW91IGRvIHdhbnQgdG8gImNvbm5lY3QiIHRoZSBzdWJzZXF1ZW50
CnN1Ym1pc3Npb25zLCBwbGVhc2UgdXNlIHRoZSBzYW1lIHJlZmVyZW5jZSBtZXNzYWdlIGZvciBl
YWNoIHN1Ym1pc3Npb24uCkluIG90aGVyIHdvcmRzLCByYXRoZXIgdGhhbjoKCnYxIDAvMgorLT4g
djEgMS8yCistPiB2MSAyLzIKKy0+IHYyIDAvMgogICAgKy0+IHYyIDEvMgogICAgKy0+IHYyIDIv
MgogICAgICAgICstPiB2MyAwLzIKICAgICAgICAgICAgKy0+IHYzIDEvMgogICAgICAgICAgICAr
LT4gdjMgMi8yCi4uLgoKVGhpcyBpcyBkb25lIGluc3RlYWQ6Cgp2MSAwLzIKKy0+IHYxIDEvMgor
LT4gdjEgMi8yCistPiB2MiAwLzIKfCAgICstPiB2MiAxLzIKfCAgICstPiB2MiAyLzIKKy0+IHYz
IDAvMgp8ICAgKy0+IHYzIDEvMgp8ICAgKy0+IHYzIDIvMgouLi4KCndoaWNoIGlzIGEgY29tcHJv
bWlzZSBiZXR3ZWVuIHRocmVhZGluZyB0aGUgbWVzc2FnZXMgdG9nZXRoZXIsIGFuZAprZWVwaW5n
IHN0b3BwaW5nIHRoZSB0aHJlYWQgcHVzaGluZyB0aGUgc3ViamVjdCBsaW5lIGNvbXBsZXRlbHkg
b2ZmCnRoZSByaWdodCBoYW5kIHNpZGUgb2YgdGhlIHNjcmVlbi4KCkluIHRoaXMgY2FzZSwgSSdk
IHN1Z2dlc3QgYSByZWZlcmVuY2Ugb2Y6CiAgMTQxNTc5MzU5My01MDc1LTEtZ2l0LXNlbmQtZW1h
aWwtYW5keS55YW5Acm9jay1jaGlwcy5jb20KCndoaWNoIGlzIHRoZSB2OCBjb3ZlcmluZyBtZXNz
YWdlIHdoaWNoIHN0YXJ0ZWQgdGhpcyBiaWcgdGhyZWFkLgoKVGhhbmtzLgoKLS0gCkZUVEMgYnJv
YWRiYW5kIGZvciAwLjhtaWxlIGxpbmU6IGN1cnJlbnRseSBhdCA5LjVNYnBzIGRvd24gNDAwa2Jw
cyB1cAphY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
