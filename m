Return-Path: <SRS0=TOSu=PW=gmail.com=dmitry.torokhov@kernel.org>
Date: Sun, 13 Jan 2019 23:42:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/5] Input: edt-ft5x06 - Add support for Evervision FT
 devices
Message-ID: <20190114074224.GF217283@dtor-ws>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 03, 2019 at 08:23:22PM +0100, Marco Felsch wrote:
> This series adds the support for Evervision Focaltech based touchscreen
> controllers. Evervision uses three different controllers, depending on
> the display resolution, these are:
>  - FT5306
>  - FT5726
>  - FT5C26.
> 
> It seems that the firmware for all controllers doesn't differ, but I
> had only a FT5726 based device. So this series adds only the support
> for those devices.
> 
> The Evervision vendor-prefix was added in an another patchset [1].
> 
> This patchset is based on the v4.20-rc1 tag.
> 
> [1] https://www.spinics.net/lists/devicetree/msg266938.html
> 
> Marco Felsch (5):
>   dt-bindings: Input: edt-ft5x06 - add support for FT5726
>   Input: edt-ft5x06 - add support for Evervision FT5726
>   Input: edt-ft5x06 - Add support to update ev-ft5726 registers
>   dt-bindings: Input: edt-ft5x06 - add offset bindings for ft5726
>   Input: edt-ft5x06 - add offset support for ev-ft5726
> 
>  .../bindings/input/touchscreen/edt-ft5x06.txt |  13 ++-
>  drivers/input/touchscreen/edt-ft5x06.c        | 110 ++++++++++++++++--
>  2 files changed, 114 insertions(+), 9 deletions(-)

Applied the lot, thank you.

-- 
Dmitry
