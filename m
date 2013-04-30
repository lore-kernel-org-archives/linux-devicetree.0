From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSCBWMl0gdmlkZW86IGltcGxlbWVudCBhIHNpbXBsZSBm?=
 =?UTF-8?B?cmFtZWJ1ZmZlciBkcml2ZXI=?=
Date: Tue, 30 Apr 2013 18:38:05 +0400
Message-ID: <1367332685.945287573@f287.mail.ru>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <517F753F.5090909@ti.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <517F753F.5090909@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?VG9taSBWYWxrZWluZW4=?= <tomi.valkeinen@ti.com>
Cc: linux-fbdev@vger.kernel.org, =?UTF-8?B?QXJuZCBCZXJnbWFubg==?= <arnd@arndb.de>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, =?UTF-8?B?Um9iIENsYXJr?= <robclark@gmail.com>, linux-rpi-kernel@lists.infradead.org, =?UTF-8?B?T2xvZiBKb2hhbnNzb24=?= <olof@lixom.net>, =?UTF-8?B?QW5kcmV3IE1vcnRvbg==?= <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> On 04/04/2013 05:39 AM, Stephen Warren wrote:
> > A simple frame-buffer describes a raw memory region that may be rendered
> > to, with the assumption that the display hardware has already been set
> > up to scan out from that buffer.
> > 
> > This is useful in cases where a bootloader exists and has set up the
> > display hardware, but a Linux driver doesn't yet exist for the display
> > hardware.
> > 
> > Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
...
> > +	framebuffer {
> > +		compatible = "simple-framebuffer";
> > +		reg = <0x1d385000 (1600 * 1200 * 2)>;
> > +		width = <1600>;
> > +		height = <1200>;
> > +		stride = <(1600 * 2)>;
> > +		format = "r5g6b5";
> > +	};
> 
> I'm not an expert on DT, but I think the point of DT is to describe the
> hardware. This doesn't describe the hardware at all.

On my incompetent opinion, "bpp" parameter can replace size of
framebuffer and "stride". Is not it?

---
