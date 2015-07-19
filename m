From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] iio: temperature: add mcp98xx driver support
Date: Sun, 19 Jul 2015 10:24:53 +0100
Message-ID: <55AB6CE5.8050505@kernel.org>
References: <1437275053-16211-1-git-send-email-mranostay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437275053-16211-1-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/07/15 04:04, Matt Ranostay wrote:
> This changeset adds driver support for the Microchip mcp98xx series of
> temperature sensors.
> 
> This includes temperature reading, and rising/falling threshold events.
Why an IIO driver?  These parts already look to be supported in hwmon by
the lm75 driver.  We need a pretty strong reason to contemplate having
support in both subsystems...
> 
> Matt Ranostay (2):
>   iio: temperature: DT binding doc for mcp98xx
>   iio: temperature: add support for mcp98xx sensors
> 
>  .../bindings/iio/temperature/mcp98xx.txt           |  22 +
>  drivers/iio/temperature/Kconfig                    |  10 +
>  drivers/iio/temperature/Makefile                   |   1 +
>  drivers/iio/temperature/mcp98xx.c                  | 588 +++++++++++++++++++++
>  4 files changed, 621 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/mcp98xx.txt
>  create mode 100644 drivers/iio/temperature/mcp98xx.c
> 
