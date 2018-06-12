Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Jun 2018 12:19:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Input: touchscreen DT binding - add
 touchscreen-min-x and -min-y properties
Message-ID: <20180612181907.GA862@rob-hp-laptop>
References: <20180607100714.9119-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607100714.9119-1-hdegoede@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 07, 2018 at 12:07:13PM +0200, Hans de Goede wrote:
> Some touchscreens, depending on the firmware and/or the digitizer report
> coordinates which never reach 0 along one or both of their axis.
> 
> This has been seen for example on the Silead touchscreens on a Onda V891w
> and a Point of View mobii TAB-P800w(v2.0).
> 
> This commits documents 2 new touchscreen properties for communicating
> the minimum reported values to the OS: touchscreen-min-x and -min-y.
> 
> This commit also drop the (in pixels) comment from the documentation
> of the touchscreen-size-x and touchscreen-size-y properties. This comment
> suggests that there is a relation between the range of reported
> coordinates and the display resolution, which is only true for some
> devices. The (in pixels) comment is replaced with "(maximum x coordinate
> reported + 1)" to mirror the language describing the new touchscreen-min-x
> and -min-y properties.
> 
> Cc: robh@kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Split out from the patch implementing support for the properties
> -Describe the changes to the touchscreen-size-x / -size-y description in
>  the commit message
> ---
>  .../devicetree/bindings/input/touchscreen/touchscreen.txt   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
