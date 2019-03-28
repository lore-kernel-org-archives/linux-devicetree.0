From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: at91: Fix typo in ISC_D0 on PC9
Date: Wed, 27 Mar 2019 19:26:31 -0500
Message-ID: <20190328002631.GA16555@bogus>
References: <20190311075742.23320-1-david.engraf@sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311075742.23320-1-david.engraf@sysgo.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Engraf <david.engraf@sysgo.com>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Mar 2019 08:57:42 +0100, David Engraf wrote:
> The function argument for the ISC_D0 on PC9 was incorrect. According to
> the documentation it should be 'C' aka 3.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>
> ---
>  arch/arm/boot/dts/sama5d2-pinfunc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
