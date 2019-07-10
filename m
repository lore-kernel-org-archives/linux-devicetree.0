From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: iio/adc: Add AUX2 channel idx for
 JZ4770 SoC ADC
Date: Wed, 10 Jul 2019 07:53:15 -0600
Message-ID: <20190710135315.GA31393@bogus>
References: <20190623184732.5492-1-contact@artur-rojek.eu>
 <20190623184732.5492-2-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623184732.5492-2-contact@artur-rojek.eu>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten ter Huurne <maarten@treewalker.org>, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On Sun, 23 Jun 2019 20:47:30 +0200, Artur Rojek wrote:
> Introduce support for AUX2 channel found in ADC hardware present on
> Ingenic JZ4770 SoC.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>  include/dt-bindings/iio/adc/ingenic,adc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
