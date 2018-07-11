From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] iio: hx711: add clock-frequency property in DT
Date: Wed, 11 Jul 2018 07:54:00 -0600
Message-ID: <20180711135400.GA14723@rob-hp-laptop>
References: <20180710181831.GA5374@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710181831.GA5374@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 08:18:31PM +0200, Andreas Klinger wrote:
> Add clock-frequency property for hx711 ADC. This is the frequency of
> PD_SCK.
> 
> After PD_SCK goes high DOUT is read just before PD_SCK goes down again.
> This is necessary because of parasitic capacitance on the wiring.
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
