From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/7] iio: tsl2772: add support for regulator framework
Date: Fri, 20 Jul 2018 11:38:26 -0600
Message-ID: <20180720173826.GA24398@rob-hp-laptop>
References: <20180717084158.23532-1-masneyb@onstation.org>
 <20180717084158.23532-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180717084158.23532-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: jic23@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, jonathan@marek.ca, jmaneyrol@invensense.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mkelly@xevo.com, fischerdouglasc@gmail.com, bshah@kde.org, ctatlor97@gmail.com, drew.paterson@ams.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2018 at 04:41:56AM -0400, Brian Masney wrote:
> This patch adds support for the regulator framework to the tsl2772
> driver. Driver was tested using a LG Nexus 5 (hammerhead) phone with
> the two regulators and on a Raspberry Pi 2 without any regulators
> controlling the power to the sensor.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../devicetree/bindings/iio/light/tsl2772.txt |  4 +

This belongs with the binding patch. Bindings should be complete, not 
extended as a driver changes. 

>  drivers/iio/light/tsl2772.c                   | 82 ++++++++++++++++++-
>  2 files changed, 85 insertions(+), 1 deletion(-)
