From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v5 0/3] drm/panel: Support Rocktech jh057n00900 DSI panel
Date: Thu, 4 Apr 2019 12:53:59 +0200
Message-ID: <20190404105359.GA8255@bogon.m.sigxcpu.org>
References: <cover.1554114302.git.agx@sigxcpu.org>
 <20190403161735.GN5238@ulmo>
 <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Wed, Apr 03, 2019 at 10:11:00AM -0700, Joe Perches wrote:
> On Wed, 2019-04-03 at 18:17 +0200, Thierry Reding wrote:
> > On Mon, Apr 01, 2019 at 12:35:32PM +0200, Guido Günther wrote:
> > > v4 fixes up the DT binding example and uses a wider cc list since I
> > > failed to extend that when touching more files.
> []
> > Applied, thanks.
> > 
> > checkpatch does complain about the dsi_generic_write_seq() macro
> > definition, because it uses flow control statements, but there are
> > already similar macros in other drivers, so I let this slide. We may
> > want to eventually come up with something better and then replace these
> > macros for the other drivers as well.
> 
> Dunno about the other drivers, but the mechanism isn't
> particularly nice as it separates the init identifier
> from the data being written.
> 
> It might be better to use something like a struct for
> each command and a for loop for each block of commands.
> 
> Also the 0xBF value used in one of the init sequence
> writes does not have an identifier #define in the
> 'Manufacturer specific Commands send via DSI' block
> which is odd.

As written in the commit message the IC in that panel looks similar to
the ST7703 but seems to be one of it's clones and the 0xBF isn't
documented here at all so I've queued this:

diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
index 158a6d548068..e58888f91007 100644
--- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
@@ -33,6 +33,7 @@
 #define ST7703_CMD_SETEXTC	 0xB9
 #define ST7703_CMD_SETMIPI	 0xBA
 #define ST7703_CMD_SETVDC	 0xBC
+#define ST7703_CMD_UNKNOWN0	 0xBF
 #define ST7703_CMD_SETSCR	 0xC0
 #define ST7703_CMD_SETPOWER	 0xC1
 #define ST7703_CMD_SETPANEL	 0xCC
@@ -94,7 +95,7 @@ static int jh057n_init_sequence(struct jh057n *ctx)
 	msleep(20);
 
 	dsi_generic_write_seq(dsi, ST7703_CMD_SETVCOM, 0x3F, 0x3F);
-	dsi_generic_write_seq(dsi, 0xBF, 0x02, 0x11, 0x00);
+	dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN0, 0x02, 0x11, 0x00);
 	dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP1,
 			      0x82, 0x10, 0x06, 0x05, 0x9E, 0x0A, 0xA5, 0x12,
 			      0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,

Cheers,
 -- Guido
