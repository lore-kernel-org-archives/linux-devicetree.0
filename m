From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/3] ASoC: xlnx: add Xilinx logicPD-I2S
	FPGA IP support
Date: Tue, 3 Sep 2019 08:51:41 +0200
Message-ID: <59ab9db1-a94e-f6a7-9777-60959b682674@xilinx.com>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <df36fc2d-ed62-2556-513d-158a7707d5cd@xilinx.com>
 <20190902222111.045ede17@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190902222111.045ede17@xps13>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michal Simek <michal.simek@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praveenv@xilinx.com, alexandre@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDIuIDA5LiAxOSAyMjoyMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBNaWNoYWwsCj4g
Cj4gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4gd3JvdGUgb24gTW9uLCAy
IFNlcCAyMDE5Cj4gMDk6Mzk6MTEgKzAyMDA6Cj4gCj4+IEhpIE1pcXVlbAo+Pgo+PiBPbiAzMC4g
MDguIDE5IDIzOjA2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gVGhpcyBJUCBpcyB2ZXJ5IHNp
bXBsZSBzbyB0aGlzIGRyaXZlciBtYW5hZ2UgYm90aCB0aGUgREFJIGFuZCB0aGUgUENNCj4+PiBz
dHJlYW1zLCBoZW5jZSB0aGUgcHJlc2VuY2Ugb2YgYm90aCBjb21wb25lbnRzIGluIHRoaXMgZHJp
dmVyLgo+Pj4KPj4+IFRoZXJlIGFyZSBwbGVudHkgYXZhaWxhYmxlIGludGVycnVwdGlvbnMgd2hl
biBjYXB0dXJpbmcgb3IgcGxheWluZwo+Pj4gYmFjayBhdWRpbyB0aGF0IGNhbiBiZSB0cmlnZ2Vy
ZWQgYnV0IHRoZSBvbmx5IG9uZSB0aGF0IGZpdHMgdGhlIEFMU0EKPj4+IHNvdW5kIHN5c3RlbSBp
cyB0aGUgWEZFUl9ET05FIHdoaWNoIGlzIHVzZWQgdG8gYm91bmQgc291bmQKPj4+IHBlcmlvZHMu
IE90aGVyIGludGVycnVwdHMgYXJlIG1hc2tlZC4gUGxlYXNlIG5vdGUgdGhhdCBjYXB0dXJlIGFu
ZAo+Pj4gcGxheWJhY2sgYXJlIG5vdCBwb3NzaWJsZSBhdCB0aGUgc2FtZSB0aW1lIHRob3VnaC4K
Pj4+Cj4+PiBDYXB0dXJlIHNlZW1zIHRvIHdvcmsgKGF0IGxlYXN0IGl0IGNyZWF0ZXMgYSBmaWxl
IHdpdGggc29tZXRoaW5nCj4+PiBpbnNpZGUpIGJ1dCBJIGhhdmUgbm8gY2FwdHVyZSBtZWNoYW5p
c20gb24gdGhlIGJvYXJkIHRvIGFjdHVhbGx5IHRlc3QKPj4+IHRoYXQgaXQgd29ya3MgY29ycmVj
dGx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBIZWxsbywKPj4+Cj4+PiBUaGlzIGlzIG15IGZp
cnN0IGNvbnRyaWJ1dGlvbiBpbiB0aGUgc291bmQgc3Vic3lzdGVtLCBJIGhvcGUgSSd2ZQo+Pj4g
dW5kZXJzdG9vZCB0aGUgY29yZSBidXQgSSBtaWdodCBiZSBlbnRpcmVseSB3cm9uZyBhcyB3ZWxs
LCBzbyBwbGVhc2UKPj4+IGRvIG5vdCBoZXNpdGF0ZSB0byBiZSBjcml0aWNhbCBvbiBteSBjaG9p
Y2VzLgo+Pj4KPj4+IFRoYW5rcywKPj4+IE1pcXXDqGwKPj4+Cj4+PiAgc291bmQvc29jL3hpbGlu
eC9LY29uZmlnICAgICAgICAgICAgfCAgIDcgKwo+Pj4gIHNvdW5kL3NvYy94aWxpbngvTWFrZWZp
bGUgICAgICAgICAgIHwgICAyICsKPj4+ICBzb3VuZC9zb2MveGlsaW54L3hsbngtbG9naWNwZC1p
MnMuYyB8IDQ2OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrICAKPj4KPj4gV2hhdCBJUCBp
cyB0aGlzPwo+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3RzL2ludGVsbGVjdHVhbC1w
cm9wZXJ0eS9hdWRpby1pMnMuaHRtbAo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xp
bnV4LXhsbngvYmxvYi9tYXN0ZXIvc291bmQvc29jL3hpbGlueC94bG54X2kycy5jCj4+Cj4+IEFu
eXdheSBJIGFtIGFkZGluZyBQcmF2ZWVuIGFuZCBNYXJ1dGhpIHRvIHRha2UgYSBsb29rLgo+IAo+
IEFjdHVhbGx5IEkgaGF2ZSBiZWVuIHRyaWNrZWQgYnkgYSBkYXRhc2hlZXQgd2l0aCB0aGUgd3Jv
bmcgdGl0bGU6IHRoaXMKPiBpcyBhIExvZ2ljUEQgSVAsIGl0IGlzIG5vdCBmcm9tIFhpbGlueC4g
SSB3aWxsIHJlc3VibWl0IHdpdGggYSBuZXcKPiBkcml2ZXIgbmFtZS9jb21wYXRpYmxlIGFuZCBh
ZGQgdGhlIHJlbGV2YW50IHBlb3BsZS4KCm9rLiBHcmVhdC4KCk0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
