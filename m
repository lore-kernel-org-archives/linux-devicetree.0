From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v6] ARM: dts: wheat: Fix ADV7513 address usage
Date: Fri, 23 Mar 2018 09:51:40 +0100
Message-ID: <20180323085140.g3golwdtpezo7fhi@verge.net.au>
References: <1521754240-10470-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521754240-10470-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Lars-Peter Clausen <lars@metafoo.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 09:30:40PM +0000, Kieran Bingham wrote:
> The r8a7792 Wheat board has two ADV7513 devices sharing a single I2C
> bus, however in low power mode the ADV7513 will reset it's slave maps to
> use the hardware defined default addresses.
> 
> The ADV7511 driver was adapted to allow the two devices to be registered
> correctly - but it did not take into account the fault whereby the
> devices reset the addresses.
> 
> This results in an address conflict between the device using the default
> addresses, and the other device if it is in low-power-mode.
> 
> Repair this issue by moving both devices away from the default address
> definitions.

Hi Kierean,

as this is a fix
a) Does it warrant a fixes tag?
   Fixes: f6eea82a87db ("ARM: dts: wheat: add DU support")
b) Does it warrant being posted as a fix for v4.16;
c) or v4.17?
