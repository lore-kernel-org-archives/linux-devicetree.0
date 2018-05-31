Return-Path: <robherring2@gmail.com>
Date: Thu, 31 May 2018 12:25:19 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: of_touchscreen / generic bindings - Add support
 for touchscreen-min-x|y
Message-ID: <20180531172519.GA27468@rob-hp-laptop>
References: <20180529115238.12965-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180529115238.12965-1-hdegoede@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 29, 2018 at 01:52:38PM +0200, Hans de Goede wrote:
> Some touchscreens, depending on the firmware and/or the digitizer report
> coordinates which never reach 0 along one or both of their axis.
> 
> This has been seen for example on the Silead touchscreens on a Onda V891w
> and a Point of View mobii TAB-P800w(v2.0).
> 
> This commit adds support for touchscreen-min-x and touchscreen-min-y
> device-properties which can be set to communicate the actual start
> coordinates (rather then 0,0) to userspace.
> 
> When set this fixes e.g. not being able to click things in the GNOME3
> top-bar on the 2 example tablets.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../input/touchscreen/touchscreen.txt         |  6 ++--

Please split bindings to separate patch.

>  drivers/input/touchscreen/of_touchscreen.c    | 36 ++++++++++++++-----
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> index 537643e86f61..8aff9551259f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> @@ -1,10 +1,12 @@
>  General Touchscreen Properties:
>  
>  Optional properties for Touchscreens:
> + - touchscreen-min-x		: minimum x coordinate reported (0 if not set)
> + - touchscreen-min-y		: minimum y coordinate reported (0 if not set)

Maybe a min-max range would be better if size (in pixels) is also 
needed?

>   - touchscreen-size-x		: horizontal resolution of touchscreen
> -				  (in pixels)
> +				  (maximum x coordinate reported + 1)

This is unrelated or at least not explained in the commit msg. I agree 
this probably makes sense as units are often not pixels unless the hw/fw 
is doing some scaling itself.

>   - touchscreen-size-y		: vertical resolution of touchscreen
> -				  (in pixels)
> +				  (maximum y coordinate reported + 1)
>   - touchscreen-max-pressure	: maximum reported pressure (arbitrary range
>  				  dependent on the controller)
>   - touchscreen-fuzz-x		: horizontal noise value of the absolute input
