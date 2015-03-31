From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] iio: ti_am335x_adc: Add optional DT properties for tscadc
Date: Tue, 31 Mar 2015 16:42:35 +0530
Message-ID: <1427800357-21680-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jan Kardell <jan.kardell-KSZdJiTw9mzQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

This patch adds optional DT properties for tscadc to set open delay,
sample delay and number of averages per sample for each adc channel.
Open delay, sample delay and averaging are some of the parameters that
affect the sampling rate and accuracy of the tscadc. Decreasing delays
and averaging helps to achieve higher sampling rates, while increasing
this parameters provides greater accuracy. Hence, this patch provides DT
properties to set the initial values for delays and number of averages
per sample. User space control via sysfs can be added later.


Vignesh R (2):
  iio: adc: ti_am335x_adc: refactor DT parsing into a function
  iio: adc: ti_am335x_adc: make sample delay, open delay, averaging DT
    parameters

 .../bindings/input/touchscreen/ti-tsc-adc.txt      | 24 +++++++
 drivers/iio/adc/ti_am335x_adc.c                    | 83 +++++++++++++++++-----
 2 files changed, 91 insertions(+), 16 deletions(-)

-- 
1.9.1
