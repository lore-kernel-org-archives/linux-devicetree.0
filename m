From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 7/8] dt-bindings: Add 1027/1029/1031 SPI ADCs as
 trivial devices
Date: Mon, 14 Oct 2019 10:38:25 -0500
Message-ID: <20191014153825.GA26261@bogus>
References: <20191011144347.19146-1-miquel.raynal@bootlin.com>
 <20191011144347.19146-8-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011144347.19146-8-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Oct 2019 16:43:46 +0200, Miquel Raynal wrote:
> In the same time, remove the dedicated bindings file which is now
> useless.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/iio/adc/max1027-adc.txt          | 22 -------------------
>  .../devicetree/bindings/trivial-devices.yaml  |  6 +++++
>  2 files changed, 6 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
