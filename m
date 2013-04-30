From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 12:34:16 +0200
Message-ID: <201304301234.16992.arnd@arndb.de>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <517F753F.5090909@ti.com>
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
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-fbdev@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Rob Clark <robclark@gmail.com>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 April 2013, Tomi Valkeinen wrote:
> > +     framebuffer {
> > +             compatible = "simple-framebuffer";
> > +             reg = <0x1d385000 (1600 * 1200 * 2)>;
> > +             width = <1600>;
> > +             height = <1200>;
> > +             stride = <(1600 * 2)>;
> > +             format = "r5g6b5";
> > +     };
> 
> I'm not an expert on DT, but I think the point of DT is to describe the
> hardware. This doesn't describe the hardware at all.

That's ok.

It's not uncommon to have settings in the device tree that describe how
hardware is set up. Other similar properties would be the line rate
of a serial port, or a keymap describing what each button is labeled.
They are not physical properties, but they are necessary platform specific
pieces of information that are not available otherwise.

	Arnd
