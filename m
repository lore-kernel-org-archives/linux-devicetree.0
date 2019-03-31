From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: add Bosch BMG160 gyroscope sensor
Date: Sun, 31 Mar 2019 01:40:40 -0500
Message-ID: <5ca060ea.1c69fb81.4ef19.df63@mx.google.com>
References: <cover.1552922054.git.hns@goldelico.com> <1664da2e7a9cb687eece1f27501d275219bcc4ed.1552922054.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1664da2e7a9cb687eece1f27501d275219bcc4ed.1552922054.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Mon, 18 Mar 2019 16:14:15 +0100, "H. Nikolaus Schaller" wrote:
> Define bindings for "bosch,bmg160" and "bosch,bmi055_gyro".
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../bindings/iio/gyroscope/bmg160.txt         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
