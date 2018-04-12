From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 2/2] vfio: platform: Add generic DT reset support
Date: Thu, 12 Apr 2018 09:00:18 +0200
Message-ID: <20180412070017.ekfic2pgddqs7gdz@verge.net.au>
References: <1523438149-16433-1-git-send-email-geert+renesas@glider.be>
 <1523438149-16433-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523438149-16433-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 11:15:49AM +0200, Geert Uytterhoeven wrote:
> Vfio-platform requires reset support, provided either by ACPI, or, on DT
> platforms, by a device-specific reset driver matching against the
> device's compatible value.
> 
> On many SoCs, devices are connected to an SoC-internal reset controller.
> If the reset hierarchy is described in DT using "resets" properties,
> such devices can be reset in a generic way through the reset controller
> subsystem.  Hence add support for this, avoiding the need to write
> device-specific reset drivers for each single device on affected SoCs.
> 
> Devices that do require a more complex reset procedure can still provide
> a device-specific reset driver, as that takes precedence.
> 
> Note that this functionality depends on CONFIG_RESET_CONTROLLER=y, and
> becomes a no-op (as in: "No reset function found for device") if reset
> controller support is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
