From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH v5 2/4] iio: imu: st_lsm6sdx: move register definitions to
 sensor_settings struct
Date: Tue, 27 Aug 2019 08:54:57 +0200
Message-ID: <d3cb1cf5-f17f-38ef-66a2-23c1b7a7d08f@puri.sm>
References: <20190821132520.28225-1-martin.kepplinger@puri.sm>
 <20190821132520.28225-3-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821132520.28225-3-martin.kepplinger@puri.sm>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: devicetree@vger.kernel.org

On 21.08.19 15:25, Martin Kepplinger wrote:
> Move some register definitions to the per-device array of struct
> st_lsm6dsx_sensor_settings in order to simplify adding new sensor
> devices to the driver.
> 
> Also, remove completely unused register definitions.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  6 ++++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 31 ++++++++++++++------
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 

I just notices the commit message header typo "st_lsm6sdx" should be
"st_lsm6dsx" of course. If you can still rebase/force-push to testing,
would you be able to fix that? If it's too far out there already, so be
it :) sorry for the typo, and thanks for adding "-imu" yourself where
applicable.

thanks,

                      martin
