From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] iio: chemical: sgp30: add device tree support
Date: Mon, 17 Dec 2018 16:43:43 -0600
Message-ID: <20181217224343.GA25009@bogus>
References: <20181213144418.24965-1-andreas.brauchli@sensirion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213144418.24965-1-andreas.brauchli@sensirion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Brauchli <a.brauchli@elementarea.net>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Brauchli <andreas.brauchli@sensirion.com>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Dec 2018 15:44:18 +0100, Andreas Brauchli wrote:
> Add device tree support for Sensirion SGP30/SGPC3 gas sensors.
> 
> Signed-off-by: Andreas Brauchli <andreas.brauchli@sensirion.com>
> ---
>  .../bindings/iio/chemical/sensirion,sgp30.txt     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
