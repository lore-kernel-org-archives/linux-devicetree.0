From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/4] drm/panel: jh057n0090: Add regulators and drop
 magic value in init
Date: Wed, 26 Jun 2019 14:41:39 +0200
Message-ID: <20190626124139.GB7337@ravnborg.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1561542477.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

Hi Guido.

On Wed, Jun 26, 2019 at 12:37:47PM +0200, Guido Günther wrote:
> Fix the omission of a regulators for the recently added panel and make sure all
> dsi commands start with a command instead of one having a magic constant (which
> already caused confusion).
> 
> Also adds a mail alias to the panel's MAINTAINER entry to reduce the bus
> factor.
> 
> Changes from v1:
> * As per review comments from Sam Ravnborg:
>   - Print error on devm_regulator_get() failres
>   - Fix typos in commit messages
> * Print an error on regulator_enable()
> * Disable vcc if iovcc fails to enable
> 
> Guido Günther (4):
>   MAINTAINERS: Add Purism mail alias as reviewer for their devkit's
>     panel
>   drm/panel: jh057n00900: Don't use magic constant
>   dt-bindings: display/panel: jh057n00900: Document power supply
>     properties
>   drm/panel: jh057n00900: Add regulator support

Patches applied to drm-misc-next and pushed out

	Sam
