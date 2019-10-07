From: Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>
Subject: [PATCH v20 0/2] PS8640 MIPI-to-eDP bridge
Date: Mon,  7 Oct 2019 10:22:27 +0200
Message-ID: <1570436549-8694-1-git-send-email-uli@fpond.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>, stonea168-9Onoh4P/yGk@public.gmane.org, ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

This revision fixes a minor issue that keeps the driver from probing on
the Elm platform. Thanks to Matthias Brugger for testing.

This driver seems to have fallen by the wayside because, while otherwise
fine, it has a firmware update feature that requires a blob that is not in
the linux-firmware repo.[1]

Whatever the cause for that may be, the update code is entirely optional
(my chip works fine with whatever firmware is currently installed), so I
have removed it in order to get this merged after all. I have also
followed various trivial API changes that have piled up since 2016; see
the individual patches for details.

I'm using this driver on an Acer Chromebook R13 ("Elm"); see
https://github.com/uli/kernel/tree/elm-working-5.4.

CU
Uli

[1] https://patchwork.kernel.org/patch/9427543/


Jitao Shi (2):
  Documentation: bridge: Add documentation for ps8640 DT properties
  drm/bridge: Add I2C based driver for ps8640 bridge

 .../devicetree/bindings/display/bridge/ps8640.txt  |  44 ++
 drivers/gpu/drm/bridge/Kconfig                     |  12 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/parade-ps8640.c             | 672 +++++++++++++++++++++
 4 files changed, 729 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.txt
 create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c

-- 
2.7.4
