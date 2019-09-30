From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [PATCH 0/2] This patch introduces a feature to force gpio-poweroff
 module
Date: Mon, 30 Sep 2019 10:35:36 +0000
Message-ID: <20190930103531.13764-1-oleksandr.suvorov@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jamie Lentin <jm@lentin.co.uk>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Igor Opaniuk <igor.opaniuk@toradex.com>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

to register its own pm_power_off handler even if someone has registered
this handler earlier.
Useful to change a way to power off the system using DT files.


Oleksandr Suvorov (2):
  power: reset: gpio-poweroff: add force mode
  dt-bindings: power: reset: gpio-poweroff: Add 'force-mode' property

 .../bindings/power/reset/gpio-poweroff.txt    |  3 +++
 drivers/power/reset/gpio-poweroff.c           | 27 ++++++++++++++-----
 2 files changed, 24 insertions(+), 6 deletions(-)

--=20
2.20.1
