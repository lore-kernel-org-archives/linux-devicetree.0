From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/4] iio:temperature:max31856:Add device tree bind info
Date: Mon, 11 Mar 2019 17:28:41 -0500
Message-ID: <20190311222841.GA6024@bogus>
References: <20190307103409.24174-1-patrick.havelange@essensium.com>
 <20190307103409.24174-3-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307103409.24174-3-patrick.havelange@essensium.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Matt Weber <matthew.weber@rockwellcollins.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>
List-Id: devicetree@vger.kernel.org

On Thu,  7 Mar 2019 11:34:08 +0100, Patrick Havelange wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch added device tree binding info for MAX31856 driver.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> ---
> Changes
> v1 -> v2
> [Matt
>  - Removed comment block and added possibilities of
>    thermocouple type in device tree binding doc.
> 
> v2 -> v3
>  - Rebased
> 
> v3 -> v4
>  - Removed one-shot property related information.
>  - Used standard name 'temp-sensor'
> 
> v4 -> v5
> [Patrick
>  - Rename thermocouple type to maxim,thermocouple-type for DT entry
> 
> v5 -> v6
> [Patrick
>  - use generic thermocouple-type for DT entry
> ---
>  .../bindings/iio/temperature/max31856.txt     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/max31856.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
