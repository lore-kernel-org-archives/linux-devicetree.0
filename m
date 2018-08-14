From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: iio: dac: add bindings for ltc166x
Date: Tue, 14 Aug 2018 15:18:18 -0600
Message-ID: <20180814211818.GA19760@rob-hp-laptop>
References: <20180811200226.28776-1-marcus.folkesson@gmail.com>
 <20180811200226.28776-2-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180811200226.28776-2-marcus.folkesson@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 11 Aug 2018 22:02:25 +0200, Marcus Folkesson wrote:
> LTC1665/LTC1660 is a 8/10-bit Digital-to-Analog Converter (DAC)
> with eight individual channels.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/iio/dac/ltc166x.txt         | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ltc166x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
