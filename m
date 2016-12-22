From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] power: supply: bq24735: allow polling even if there
 is no ac-detect gpio
Date: Thu, 22 Dec 2016 16:42:00 -0600
Message-ID: <20161222224200.cwlz5ecjsfgowea7@rob-hp-laptop>
References: <1482355793-16190-1-git-send-email-peda@axentia.se>
 <1482355793-16190-2-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482355793-16190-2-git-send-email-peda@axentia.se>
Sender: linux-pm-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2016 at 10:29:52PM +0100, Peter Rosin wrote:
> It is possible to verify AC adapter presence via a register read, without
> any physical connection to the ACOK pin on the charger. Allow this.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/devicetree/bindings/power/supply/ti,bq24735.txt | 4 ++--
>  drivers/power/supply/bq24735-charger.c                        | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
