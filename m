From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: iio: chemical: Add bindings for
 bme680
Date: Tue, 15 Jan 2019 14:28:02 -0600
Message-ID: <20190115202802.GA26149@bogus>
References: <20190114201914.24572-1-sebastien.bourdelin@gmail.com>
 <20190114201914.24572-2-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114201914.24572-2-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org, Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Jan 2019 15:19:14 -0500, Sebastien Bourdelin wrote:
> BME680 is a pressure/temperature/humidity/voc sensor.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> ---
> v2 -> v3:
>   - change i2c address to 0x76 as it seems more reliable: Suggested by Himanshu Jha <himanshujha199640@gmail.com>
>   - rebase on master
> ---
>  .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
