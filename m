From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 2/2] ARM: orion5x: add missing mbus include
Date: Thu, 25 Jul 2013 11:38:56 -0400
Message-ID: <20130725153856.GI23879@titan.lakedaemon.net>
References: <1372762453-12018-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1372762453-12018-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1372762453-12018-3-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 02, 2013 at 12:54:13PM +0200, Sebastian Hesselbarth wrote:
> edmini_v2-setup is missing an include of linux/mbus.h which causes
> compiler error because of missing reference to mvebu_mbus_add_window.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> Cc: Russell King <linux@arm.linux.org.uk> 
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com> 
> Cc: devicetree-discuss@lists.ozlabs.org 
> Cc: linux-kernel@vger.kernel.org 
> Cc: linux-arm-kernel@lists.infradead.org 
> ---
>  arch/arm/mach-orion5x/edmini_v2-setup.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied to mvebu/stable-3.10

thx,

Jason.
