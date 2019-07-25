From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH 1/3] iio: imu: st_lsm6sdx: move some register definitions
 to sensor_settings struct
Date: Thu, 25 Jul 2019 07:40:11 +0200
Message-ID: <4074cb36-de30-d101-df3c-8c8b80292377@posteo.de>
References: <20190715131919.31938-1-martin.kepplinger@puri.sm>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715131919.31938-1-martin.kepplinger@puri.sm>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>, lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15.07.19 15:19, Martin Kepplinger wrote:
> Move some register definitions to the per-device array of struct
> st_lsm6dsx_sensor_settings in order to simplify adding new sensor
> devices to the driver.
> 
> Also, remove completely unused register definitions.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  6 ++++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 31 ++++++++++++++------
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 

this series has been resent (and rebased) to be more readable:
https://lore.kernel.org/linux-iio/20190725053132.9589-1-martin.kepplinger@puri.sm/

thanks,
                             martin
