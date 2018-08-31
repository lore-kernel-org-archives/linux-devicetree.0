From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] memory: jz4780-nemc: Reduce size of const array
Date: Fri, 31 Aug 2018 08:18:49 -0400
Message-ID: <20180831121849.GA23787@bogus>
References: <20180822172953.11281-1-paul@crapouillou.net>
 <20180822172953.11281-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180822172953.11281-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alex Smith <alex@alex-smith.me.uk>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Aug 2018 19:29:52 +0200, Paul Cercueil wrote:
> The maximum value found in that array is 15, there's no need to store
> these values as uint32_t, a uint8_t is enough.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/memory/jz4780-nemc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
