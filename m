From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: iio: adc: Add common ADCs properties
 to a separate file
Date: Fri, 16 Nov 2018 16:53:19 -0600
Message-ID: <20181116225319.GA26554@bogus>
References: <1542108061-3471-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542108061-3471-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

On Tue, 13 Nov 2018 13:21:01 +0200, Stefan Popa wrote:
> There are several ADC drivers that depend on the same device tree
> bindings. Rather than continue to duplicate the properties, this patch
> adds a common adc binding document that can be referenced. For beginning,
> only two properties are documented.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
> Changes in v2, v3:
> 	- N/A.
> Changes in v4:
> 	- Added this commit.
> Changes in v5:
> 	- Nothing changed.
> 
>  Documentation/devicetree/bindings/iio/adc/adc.txt | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
