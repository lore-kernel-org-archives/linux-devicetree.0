From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/7] [media] soc_camera: rcar_vin: use proper name for
 the R-Car SoC
Date: Wed, 31 May 2017 14:47:53 -0500
Message-ID: <20170531194753.jefogkdi5fqlwxzv@rob-hp-laptop>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
 <20170528093051.11816-7-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170528093051.11816-7-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 28, 2017 at 11:30:49AM +0200, Wolfram Sang wrote:
> It is 'R-Car', not 'RCar'. No code or binding changes, only descriptive text.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I suggest this trivial patch should be picked individually per susbsystem.
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

If you're going to change the subject, "dt-bindings: media: ..." is 
preferred.

Rob
