From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH V3 0/4] megachips-stdpxxxx-ge-b850v3-fw
Date: Wed, 08 Mar 2017 10:47:07 +0100
Message-ID: <1488966427.32329.33.camel@pengutronix.de>
References: <cover.1488555615.git.peter.senna@collabora.com>
 <3583de63-eda5-5d9c-741e-040db1ccee69@codeaurora.org>
 <20170308094223.GA25268@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308094223.GA25268@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: mark.rutland@arm.com, heiko@sntech.de, airlied@linux.ie, daniel.vetter@ffwll.ch, peter.senna@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, jslaby@suse.cz, martyn.welch@collabora.co.uk, robh@kernel.org, Archit Taneja <architt@codeaurora.org>, ijc+devicetree@hellion.org.uk, linux@armlinux.org.uk, javier@dowhile0.org, treding@nvidia.com, linux@roeck-us.net, martin.donnelly@ge.com, devicetree@vger.kernel.org, kernel@pengutronix.de, pawel.moll@arm.com, mchehab@osg.samsung.com, eballetbo@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, tiwai@suse.com, p.zabel@pengutronix.de, galak@codeaurora.org, enric.balletbo@collabora.com, akpm@linux-foundation.org, shawnguo@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 08.03.2017, 10:42 +0100 schrieb Peter Senna Tschudin:
> On Mon, Mar 06, 2017 at 03:27:16PM +0530, Archit Taneja wrote:
> Hi Archit,
> 
> > Hi,
> > 
> > On 3/3/2017 9:27 PM, Peter Senna Tschudin wrote:
> > > The video processing pipeline on the second output on the GE B850v3:
> > > 
> > >   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
> > > 
> > > Each bridge has a dedicated flash containing firmware for supporting the
> > > custom design. The result is that in this design neither the STDP4028
> > > nor the STDP2690 behave as the stock bridges would. The compatible
> > > strings include the suffix "-ge-b850v3-fw" to make it clear that the
> > > driver is for the bridges with the firmware which is specific for the GE
> > > B850v3.
> > > 
> > > The driver is powerless to control the video processing pipeline, as the
> > > two bridges behaves as a single one. The driver is only needed for
> > > telling the host about EDID / HPD, and for giving the host powers to ack
> > > interrupts.
> > 
> > queued Patches 1,2 and 3 to drm-misc-next. Made stdp2690_get_edid static
> > in Patch #3 to fix a sparse warning.
> 
> What about 4/4, aka the dt change? Do I need an ack from Rob Herring?
> 
> Thanks a lot!

This one needs to go through Shawn Guo. Now that the driver and binding
are in it is probably best to ask him directly to pick it up.

Regards,
Lucas
