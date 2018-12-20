From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for ADC on
 pms405 PMIC
Date: Thu, 20 Dec 2018 14:05:53 -0600
Message-ID: <20181220200553.GA8681@bogus>
References: <cover.1544599950.git.amit.kucheria@linaro.org>
 <3aac8c4cd7648589d0eef994376357509e284030.1544599950.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3aac8c4cd7648589d0eef994376357509e284030.1544599950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, mka@chromium.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Douglas Anderson <dianders@chromium.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Dec 2018 15:47:54 +0530, Amit Kucheria wrote:
> PMS405 contains a variant of the spmi-adc-rev2 ADC. Create a new
> compatible inorder to handle any differences.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
