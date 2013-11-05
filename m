From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCHv4][ 1/6] fbdev: Add the lacking FB_SYNC_* for matching
 the DISPLAY_FLAGS_*
Date: Tue, 5 Nov 2013 13:47:46 +0000
Message-ID: <20131105134746.GR16735@n2100.arm.linux.org.uk>
References: <1383581724-14817-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1383581724-14817-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 04, 2013 at 05:15:19PM +0100, Denis Carikli wrote:
> Without that fix, drivers using the fb_videomode_from_videomode
>   function will not be able to get certain information because
>   some DISPLAY_FLAGS_* have no corresponding FB_SYNC_*.

Please describe how userspace knows how to set these flags.

Flags such as the polarity of the hsync and vsync signals are fairly well
defined based upon the display mode, but aren't things like data enable
and the pixel clock edge a property of the attached LCD panel, which is
something that is configured according to the panel which is attached.

In other words, this information should not be passed from userspace, but
should be part of the DT description about the connected panel.  So should
be the polarity of the line and frame pulses (iow, hsync and vsync pulses)
in the case of a connected panel.

Moreover, in the case of a connected LCD panel, chances are it can only
support a very limited number of settings, so support for userspace
changing the timings is arguably incorrect from a system point of view.
