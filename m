Return-Path: <robherring2@gmail.com>
Date: Wed, 27 Mar 2019 19:38:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pps: pps-gpio.txt: Add capture-clear
Message-ID: <20190328003854.GA20330@bogus>
References: <20190311145951.847-1-bunk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190311145951.847-1-bunk@kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 11, 2019 at 04:59:50PM +0200, Adrian Bunk wrote:
> The code was already there but the device tree wiring was missing.

But patch 2 adds the code...

> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> Cc: stable@vger.kernel.org

This is not stable material IMO.

> ---
>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 1 +
>  1 file changed, 1 insertion(+)

This was discussed at length recently. I still think this is working 
around a limitation in the GPIO/interrupt code, but I'm not going to 
argue more about a single property for a single binding.

With stable dropped:

Acked-by: Rob Herring <robh@kernel.org>
