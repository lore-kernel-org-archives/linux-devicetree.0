From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 0/2] platform: Add DT support for DA8xx
Date: Sun, 20 Nov 2016 18:38:51 +0530
Message-ID: <0186ccb1-c3ad-e720-a316-1cb33d779b8b@ti.com>
References: <1479294456-7942-1-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479294456-7942-1-git-send-email-abailon@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Bailon <abailon@baylibre.com>, khilman@baylibre.com, robh+dt@kernel.org, b-liu@ti.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 16 November 2016 04:37 PM, Alexandre Bailon wrote:
> This add and enable the usb otg for da850 and da850-lcdk.
> This series depends on "driver: dd DT support for DA8xx" patch set.

I see that Bin has already applied this.

> If this series is applied before the "usb: musb: da8xx: Fix few issues" patch
> set then the usb driver will always retrun -ENODEV.

And this seems to be applied too. So I am going ahead and applying this
series.

For future, please add some information on which device you are
referring to in the subject line. Reading the subject line for the
cover-letter, there is no way to know what exactly is being worked on here.

Thanks,
Sekhar
