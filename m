From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 0/4] drm/panel: jh057n0090: Add regulators and drop magic value in init
Date: Tue, 25 Jun 2019 19:05:15 +0200
Message-ID: <cover.1561482165.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

Fix the omission of regulators for the recently added panel and make
sure all dsi commands start with a command instead of one having a magic
constant (which already caused confusion).

Also adds a mail alias to the panel's MAINTAINER entry to reduce the bus
factor.

To: Thierry Reding <thierry.reding@gmail.com>,Sam Ravnborg <sam@ravnborg.org>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,Rob Herring <robh+dt@kernel.org>,Mark Rutland <mark.rutland@arm.com>,Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,"David S. Miller" <davem@davemloft.net>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,Nicolas Ferre <nicolas.ferre@microchip.com>,"Paul E. McKenney" <paulmck@linux.ibm.com>,dri-devel@lists.freedesktop.org,devicetree@vger.kernel.org,linux-kernel@vger.kernel.org,Purism Kernel Team <kernel@puri.sm>


Guido Günther (4):
  MAINTAINERS: Add Purism mail alias as reviewer for their devkit's
    panel
  drm/panel: jh057n0090: Don't use magic constant
  dt-bindings: display/panel: jh057n0090: Document power supply
    properties
  drm/panel: jh057n0090: Add regulator support

 .../display/panel/rocktech,jh057n00900.txt    |  5 +++++
 MAINTAINERS                                   |  1 +
 .../drm/panel/panel-rocktech-jh057n00900.c    | 22 ++++++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.20.1
