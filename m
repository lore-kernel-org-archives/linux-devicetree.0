From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add OF support to ST sensor framework
Date: Sun, 25 Jun 2017 17:15:28 +0100
Message-ID: <20170625171528.55d48ee4@kernel.org>
References: <20170625152413.22325-1-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170625152413.22325-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 25 Jun 2017 17:24:09 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Changes since v1:
> - add missing devices to {accel, magn, gyro, press} of_device_id table
> 
> Lorenzo Bianconi (4):
>   iio: accel: st_accel_spi: add OF capability to st_accel_spi
>   iio: magnetometer: st_magn_spi: add OF capability to st_magn_spi
>   iio: gyro: st_gyro_spi: add OF capability to st_gyro_spi
>   iio: pressure: st_pressure_spi: add OF capability to st_pressure_spi
I am going to let the series as a whole sit a little while to see
if anyone has a better way of dealing with the prefixes we added in the past
that aren't really right for devicetree bindings.

Jonathan
> 
>  drivers/iio/accel/st_accel_spi.c       | 67 ++++++++++++++++++++++++++++++----
>  drivers/iio/gyro/st_gyro_spi.c         | 53 +++++++++++++++++++++++++++
>  drivers/iio/magnetometer/st_magn_spi.c | 25 +++++++++++++
>  drivers/iio/pressure/st_pressure_spi.c | 33 +++++++++++++++++
>  4 files changed, 170 insertions(+), 8 deletions(-)
> 
