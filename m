From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 02/13] devicetree/bindings: display: Add bindings for LVDS panels
Date: Tue, 22 Nov 2016 15:21:15 +0200
Message-ID: <2373519.sTH62t1aap@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161122110241.GA22735@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161122110241.GA22735@ulmo.ba.sec>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On Tuesday 22 Nov 2016 12:02:41 Thierry Reding wrote:
> On Sat, Nov 19, 2016 at 05:28:02AM +0200, Laurent Pinchart wrote:
> > LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> > Multiple incompatible data link layers have been used over time to
> > transmit image data to LVDS panels. This binding supports display panels
> > compatible with the JEIDA-59-1999, Open-LDI and VESA SWPG
> > specifications.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  .../bindings/display/panel/panel-lvds.txt          | 120 ++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/display/panel/panel-lvds.txt> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> > b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt new file
> > mode 100644
> > index 000000000000..b938269f841e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> > @@ -0,0 +1,120 @@
> > +LVDS Display Panel
> > +==================
> > +
> > +LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> > Multiple +incompatible data link layers have been used over time to
> > transmit image data +to LVDS panels. This bindings supports display
> > panels compatible with the +following specifications.
> > +
> > +[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999,
> > February
> > +1999 (Version 1.0), Japan Electronic Industry Development Association
> > (JEIDA) +[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95),
> > National +Semiconductor
> > +[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> > +Electronics Standards Association (VESA)
> > +
> > +Device compatible with those specifications have been marketed under the
> > +FPD-Link and FlatLink brands.
> > +
> > +
> > +Required properties:
> > +
> > +- compatible: Shall contain "panel-lvds" in addition to a mandatory
> > +  panel-specific compatible string defined in individual panel bindings.
> > The
> > +  "panel-lvds" value shall never be used on its own.
> 
> What good is it if it shall never be used on its own? The above sounds
> to me like the panel-specific compatible string implies the LVDS
> binding, in a way that many compatible strings imply the simple binding.
> Note that initially we did the very same thing with "panel-simple", only
> to realize that it's completely redundant because it is never used.

DT allows specifying multiple compatible strings in decreasing order of 
genericity to make generic OS implementations possible while retaining the 
ability to later introduce device-specific code if/when the need arises 
(mostly because of information that were overlooked, misunderstood or just not 
available at implementation time - we unfortunately can't produce 100% perfect 
solutions all the time, I very much regret that). This is exactly what the 
LVDS panel bindings mandate.

> > +- width-mm: See panel-common.txt.
> > +- height-mm: See panel-common.txt.
> > +- data-mapping: The color signals mapping order, "jeida-18", "jeida-24"
> > +  or "vesa-24".
> > +
> > +Optional properties:
> > +
> > +- label: See panel-common.txt.
> > +- gpios: See panel-common.txt.
> > +- backlight: See panel-common.txt.
> > +- data-mirror: If set, reverse the bit order described in the data
> > mappings
> > +  below on all data lanes, transmitting bits for slots 6 to 0 instead of
> > +  0 to 6.
> > +
> > +Required nodes:
> > +
> > +- panel-timing: See panel-common.txt.
> > +- ports: See panel-common.txt. These bindings require a single port
> > subnode
> > +  corresponding to the panel LVDS input.
> 
> Looks like I should go read the patch that introduces panel-common.txt
> first...

-- 
Regards,

Laurent Pinchart
