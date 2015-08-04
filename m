From: Matt Porter <mporter@konsulko.com>
Subject: Re: [PATCH 2/3] iio: temperature: add max6675 thermocouple converter
 driver
Date: Tue, 4 Aug 2015 09:01:04 -0400
Message-ID: <20150804130104.GL15004@beef>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
 <1438635410-3757-3-git-send-email-mporter@konsulko.com>
 <CAEnQRZDRNr5n3+QVoKRP5prZ0kQn07DgvvgDEvEVJimRVyTZpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEnQRZDRNr5n3+QVoKRP5prZ0kQn07DgvvgDEvEVJimRVyTZpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@intel.com>
Cc: Linux IIO List <linux-iio@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 04, 2015 at 10:50:32AM +0300, Daniel Baluta wrote:
> On Mon, Aug 3, 2015 at 11:56 PM, Matt Porter <mporter@konsulko.com> wrote:
> > Add a driver for the MAX6675 thermocouple converter. This
> > device interfaces with K-type thermocouples and provides
> > cold-junction compensated temperature readings via a
> > SPI interface.
> 
> ./scripts/checkpatch.pl --strict says:
> 
> CHECK: braces {} should be used on all arms of this statement
> #118: FILE: drivers/iio/temperature/max6675.c:61:

Will address in v2, thanks.

-Matt
