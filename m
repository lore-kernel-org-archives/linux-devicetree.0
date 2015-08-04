From: Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: temperature: add max6675 thermocouple converter driver
Date: Tue, 4 Aug 2015 10:50:32 +0300
Message-ID: <CAEnQRZDRNr5n3+QVoKRP5prZ0kQn07DgvvgDEvEVJimRVyTZpA@mail.gmail.com>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
	<1438635410-3757-3-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438635410-3757-3-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 3, 2015 at 11:56 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a driver for the MAX6675 thermocouple converter. This
> device interfaces with K-type thermocouples and provides
> cold-junction compensated temperature readings via a
> SPI interface.

./scripts/checkpatch.pl --strict says:

CHECK: braces {} should be used on all arms of this statement
#118: FILE: drivers/iio/temperature/max6675.c:61:

thanks,
Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
