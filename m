From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/4] Fix more issues with generic pinconf bindings
Date: Tue, 25 Jun 2013 14:55:01 +0200
Message-ID: <201306251455.01540.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As Stephen Warren pointed out, some pinconf bindings had deficits
either in documentation or in the whole thought process.

Therefore this series tries to fix these issues by improving
documentation and removing the real controversial bindings for now.

Of the changed pinconf bindings only the slew-rate had an acutal
current user (since yesterday). James I hope it's ok to simply
remove the slew-rate handling from the tz1090 driver until we can
handle it correctly in dt.


Heiko Stuebner (4):
  pinctrl: more clarifications for generic pull configs
  pinctrl: set unit for debounce time pinconfig to usec
  pinctrl: remove slew-rate parameter from tz1090
  pinctrl: remove bindings for pinconf options needing more thought

 .../bindings/pinctrl/img,tz1090-pdc-pinctrl.txt      |    5 +----
 .../bindings/pinctrl/img,tz1090-pinctrl.txt          |    7 +------
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt |   18 ++++--------------
 drivers/pinctrl/pinconf-generic.c                    |    5 +----
 drivers/pinctrl/pinctrl-tz1090-pdc.c                 |    5 -----
 drivers/pinctrl/pinctrl-tz1090.c                     |    5 -----
 include/linux/pinctrl/pinconf-generic.h              |    7 +++++--
 7 files changed, 12 insertions(+), 40 deletions(-)

-- 
1.7.10.4
