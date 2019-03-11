From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 9/9] staging: iio: ad7780: add device tree binding
Date: Mon, 11 Mar 2019 17:47:54 -0500
Message-ID: <20190311224753.GA32052@bogus>
References: <cover.1551358569.git.renatogeh@gmail.com>
 <ac8955ea9d903c106535d76549ff9802f527f4f6.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ac8955ea9d903c106535d76549ff9802f527f4f6.1551358569.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Feb 2019 11:26:28 -0300, Renato Lui Geh wrote:
> Adds a device tree binding for the ad7780 driver.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> ---
>  .../bindings/iio/adc/adi,ad7780.txt           | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
