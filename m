From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 2/4] iio: imu: st_lsm6sdx: move register definitions
 to sensor_settings struct
Date: Tue, 27 Aug 2019 20:59:24 +0100
Message-ID: <20190827205924.313344e4@archlinux>
References: <20190821132520.28225-1-martin.kepplinger@puri.sm>
        <20190821132520.28225-3-martin.kepplinger@puri.sm>
        <d3cb1cf5-f17f-38ef-66a2-23c1b7a7d08f@puri.sm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3cb1cf5-f17f-38ef-66a2-23c1b7a7d08f@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 Aug 2019 08:54:57 +0200
Martin Kepplinger <martin.kepplinger@puri.sm> wrote:

> On 21.08.19 15:25, Martin Kepplinger wrote:
> > Move some register definitions to the per-device array of struct
> > st_lsm6dsx_sensor_settings in order to simplify adding new sensor
> > devices to the driver.
> > 
> > Also, remove completely unused register definitions.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  6 ++++
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 31 ++++++++++++++------
> >  2 files changed, 28 insertions(+), 9 deletions(-)
> >   
> 
> I just notices the commit message header typo "st_lsm6sdx" should be
> "st_lsm6dsx" of course. If you can still rebase/force-push to testing,
> would you be able to fix that? If it's too far out there already, so be
> it :) sorry for the typo, and thanks for adding "-imu" yourself where
> applicable.

I can indeed. Fixed up.

Added Rob's ack to the dt patch as well.

Thanks,

Jonathan

> 
> thanks,
> 
>                       martin
