From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161010101 erratum
Date: Tue, 24 Jan 2017 16:08:31 +0100
Message-ID: <765699aa-cbc6-67eb-9108-cbf335338e4c@linaro.org>
References: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484832916-7248-1-git-send-email-dingtianhong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ding Tianhong <dingtianhong@huawei.com>, catalin.marinas@arm.com, will.deacon@arm.com, marc.zyngier@arm.com, mark.rutland@arm.com, oss@buserror.net, devicetree@vger.kernel.org, shawnguo@kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

T24gMTkvMDEvMjAxNyAxNDozNSwgRGluZyBUaWFuaG9uZyB3cm90ZToKPiBFcnJhdHVtIEhpc2ls
aWNvbi0xNjEwMTAxMDEgc2F5cyB0aGF0IHRoZSBBUk0gZ2VuZXJpYyB0aW1lciBjb3VudGVyICJo
YXMgdGhlCj4gcG90ZW50aWFsIHRvIGNvbnRhaW4gYW4gZXJyb25lb3VzIHZhbHVlIHdoZW4gdGhl
IHRpbWVyIHZhbHVlIGNoYW5nZXMiLgo+IEFjY2Vzc2VzIHRvIFRWQUwgKGJvdGggcmVhZCBhbmQg
d3JpdGUpIGFyZSBhbHNvIGFmZmVjdGVkIGR1ZSB0byB0aGUgaW1wbGljaXQgY291bnRlcgo+IHJl
YWQuICBBY2Nlc3NlcyB0byBDVkFMIGFyZSBub3QgYWZmZWN0ZWQuCj4gCj4gVGhlIHdvcmthcm91
bmQgaXMgdG8gcmVyZWFkIHRoZSBzeXN0ZW0gY291bnQgcmVnaXN0ZXJzIHVudGlsIHRoZSB2YWx1
ZSBvZiB0aGUgc2Vjb25kCj4gcmVhZCBpcyBsYXJnZXIgdGhhbiB0aGUgZmlyc3Qgb25lIGJ5IGxl
c3MgdGhhbiAzMiwgdGhlIHN5c3RlbSBjb3VudGVyIGNhbiBiZSBndWFyYW50ZWVkCj4gbm90IHRv
IHJldHVybiB3cm9uZyB2YWx1ZSB0d2ljZSBieSBiYWNrLXRvLWJhY2sgcmVhZCBhbmQgdGhlIGVy
cm9yIHZhbHVlIGlzIGFsd2F5cyBsYXJnZXIKPiB0aGFuIHRoZSBjb3JyZWN0IG9uZSBieSAzMi4g
V3JpdGVzIHRvIFRWQUwgYXJlIHJlcGxhY2VkIHdpdGggYW4gZXF1aXZhbGVudCB3cml0ZSB0byBD
VkFMLgoKV2h5IG5vdCB1c2UgYW5vdGhlciBjbG9ja3NvdXJjZSBpbnN0ZWFkIG9mIGFkZGluZyBh
IHdvcmthcm91bmQgd2l0aCBhCm5vbiBuZWdsaWdpYmxlIG92ZXJoZWFkIGFuZCBtb3JlIGNvbXBs
ZXhpdHkgaW4gdGhlIGNvZGUgPwoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
