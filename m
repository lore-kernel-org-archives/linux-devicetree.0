From: Johan Hovold <johan@kernel.org>
Subject: Re: [linux-sunxi] [PATCH v2 4/5] dt-bindings: gnss: Add
 u-blox,neo-6m compatible
Date: Thu, 4 Apr 2019 12:45:26 +0200
Message-ID: <20190404104526.GD29917@localhost>
References: <20190401115616.21337-1-megous@megous.com>
 <20190401115616.21337-5-megous@megous.com>
 <20190401120209.fhjyvevk4tsc533s@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401120209.fhjyvevk4tsc533s@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: maxime.ripard@free-electrons.com, wens@csie.org, robh@kernel.org, johan@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 01, 2019 at 02:02:09PM +0200, Ondřej Jirman wrote:
> On Mon, Apr 01, 2019 at 01:56:15PM +0200, megous via linux-sunxi wrote:
> > From: Ondrej Jirman <megous@megous.com>
> > 
> > Add compatible for u-blox NEO-6M GPS module.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> 
> Ouch, I forgot to add:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I'll do v3 if necessary, for this.

Looks good to me too.

Now applied with Robs ack along with the ubx-driver patch.

Thanks,
Johan
