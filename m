From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 0/3] drm/panel: Support Rocktech jh057n00900 DSI panel
Date: Wed, 03 Apr 2019 10:11:00 -0700
Message-ID: <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
References: <cover.1554114302.git.agx@sigxcpu.org>
         <20190403161735.GN5238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403161735.GN5238@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-04-03 at 18:17 +0200, Thierry Reding wrote:
> On Mon, Apr 01, 2019 at 12:35:32PM +0200, Guido Günther wrote:
> > v4 fixes up the DT binding example and uses a wider cc list since I
> > failed to extend that when touching more files.
[]
> Applied, thanks.
> 
> checkpatch does complain about the dsi_generic_write_seq() macro
> definition, because it uses flow control statements, but there are
> already similar macros in other drivers, so I let this slide. We may
> want to eventually come up with something better and then replace these
> macros for the other drivers as well.

Dunno about the other drivers, but the mechanism isn't
particularly nice as it separates the init identifier
from the data being written.

It might be better to use something like a struct for
each command and a for loop for each block of commands.

Also the 0xBF value used in one of the init sequence
writes does not have an identifier #define in the
'Manufacturer specific Commands send via DSI' block
which is odd.
