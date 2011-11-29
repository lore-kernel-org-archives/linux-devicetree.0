From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Pin control mappings for DT
Date: Tue, 29 Nov 2011 08:42:11 +0100
Message-ID: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Greetings,

can we have some initial idea about DT support for pin control
devices and how these will look? Since pin control seems to be
a cruicial piece for people to get board data out of their kernels
we'd better have a common understanding.

The way I've understood it, we will need three pieces of
DT data:

1) Per-driver info, includes the pin controller base, its pins, their
 (optional) names and their specific presets like bias etc.

2) Board pin group definitions, saying "these three pins
  belong to the group "i2c0-pins"

3) Board function mapping definitions saying "the pin group
  'i2c0-pins' is to be used with device i2c0" which can map
  several groups to a single device.

(1) should be read out by each pin controller driver and
(2)+(3) by the pin controller, specifically  pinmux core.

I'm tentatively also thinking about:

(4) Pin group state map - as in "group 'i2c0-pins' have
  the states 'active', 'sleeping' and 'idle' "

Since this last piece needs to be connected to say
bias settings etc it's currently unclear to me how that
would work. But (1) thro (3) seem pretty solid.

Does this agree with others' idea about this?

(Feaing this thread will run on for a while, DT issues seem
pretty discussable.)

Yours,
Linus Walleij
