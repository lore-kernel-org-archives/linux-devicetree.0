From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [GIT PULL] Update binding documentation for CP110 and AP806
Date: Fri, 30 Jun 2017 08:57:10 +0200
Message-ID: <87h8yyvu7t.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Stephen,

As seen on Tuesday this is the pull request for the remaining binding
documentation which depends on the documentation already applied in your
tree.

Thanks for taking care of it,

Gregory

The following changes since commit 7e5b11afecc0f558c5a6723970770f92f2529d4e:

  dt-bindings: ap806: introduce a new binding (2017-06-01 12:02:01 +0900)

are available in the git repository at:

  git://git.infradead.org/linux-mvebu.git binding-doc-cp110-ap806

for you to fetch changes up to 1fa67c675f6477ceb670f087a6f6739f7b3cb099:

  gpio: dt-bindings: Add documentation for gpio controllers on Armada 7K/8K (2017-06-27 09:07:17 +0200)

----------------------------------------------------------------
Gregory CLEMENT (6):
      dt-bindings: cp110: do not depend anymore of the *-clock-output-names
      dt-bindings: cp110: introduce a new binding
      dt-bindings: cp110: add sdio clock to cp-110 system controller
      pinctrl: dt-bindings: add documentation for AP806 pin controllers
      pinctrl: dt-bindings: add documentation for CP110 pin controllers
      gpio: dt-bindings: Add documentation for gpio controllers on Armada 7K/8K

 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt  |  73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt                      |  24 +++++++++++++++++-------
 3 files changed, 208 insertions(+), 33 deletions(-)

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
