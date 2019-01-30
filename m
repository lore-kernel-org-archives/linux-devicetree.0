Return-Path: <robherring2@gmail.com>
Date: Wed, 30 Jan 2019 10:56:19 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: fix incorrect bmi160 IRQ note
Message-ID: <20190130165619.GA22806@bogus>
References: <20190127203911.8696-1-martin@martingkelly.com>
 <20190127203911.8696-4-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190127203911.8696-4-martin@martingkelly.com>
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, 27 Jan 2019 12:39:08 -0800, Martin Kelly wrote:
> From: Martin Kelly <martin@martingkelly.com>
> 
> The bmi160 bindings say that the BMI160 requires level-triggered,
> active-low interrupts, but it actually supports all interrupt types, so fix
> the note to reflect that.
> 
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/bmi160.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
