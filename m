Return-Path: <SRS0=RZGj=VW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from comms.puri.sm ([159.203.221.185]:35968 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389116AbfGYIOQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 25 Jul 2019 04:14:16 -0400
Subject: Re: [PATCH v3 4/5] iio: imu: st_lsm6dsx: add support for accel/gyro
 unit of lsm9sd1
References: <20190725053132.9589-1-martin.kepplinger@puri.sm>
 <20190725053132.9589-5-martin.kepplinger@puri.sm>
 <CAA2SeNK-pjkSWVsrv5dehEJbakZqR0oPF3DQ5mzhiiOD3Npxkg@mail.gmail.com>
From: Martin Kepplinger <martin.kepplinger@puri.sm>
Message-ID: <9af363c9-2676-05bf-0cb4-de4dc8ba991c@puri.sm>
Date: Thu, 25 Jul 2019 10:14:08 +0200
In-Reply-To: <CAA2SeNK-pjkSWVsrv5dehEJbakZqR0oPF3DQ5mzhiiOD3Npxkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 25.07.19 09:04, Lorenzo Bianconi wrote:
> 
>     The LSM9DS1's accelerometer / gyroscope unit and it's magnetometer
>     (separately
>     supported in iio/magnetometer/st_magn*) are located on a separate
>     i2c addresses
>     on the bus.
> 
>     For the datasheet, see
>     https://www.st.com/resource/en/datasheet/lsm9ds1.pdf
>     <https://www.st.com/resource/en/datasheet/lsm9ds1.pdf>
> 
>     Treat it just like the LSM6* devices and, despite it's name, hook it up
>     to the st_lsm6dsx driver, using it's basic functionality.
> 
>     Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm
>     <mailto:martin.kepplinger@puri.sm>>
> 
> 
> 
>  Hi Martin,
> 
> could you please check if LSM9DS1 and LSM6DS0 have a common register map
> for the supported features (I think so)? If so I think it is better to
> rename LSM9DS1 in LSM6DS0 since st_lsm6dsx supports just acc and gyro
> (we will support LSM9DS1 with a proper dts configuration)
> 
> Regards,
> Lorenzo

Hi Lorenzo,

The register mappings of LSM6DSO and LSM9DS1 don't match (gyro out for
example). The LSM9DS1 magnetometer is a *different* device on the bus
than accel/gyro (despite being on the same chip). That one is already
supported in drivers/iio/magnetometer/st_magn_*

So LSM9DS1 in the imu driver (lsm6dsx) can also just support accel and
gyro in order to complete the support for the device.

Besides, that's the device I have and test here. I can't really name it
differently.

What are you working on (dts description)?

thanks,
                             martin
