Return-Path: <SRS0=lL/R=KS=gmail.com=dmitry.torokhov@kernel.org>
Date: Thu, 2 Aug 2018 17:31:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH resend v2 1/2] Input: touchscreen DT binding - add
 touchscreen-min-x and -min-y properties
Message-ID: <20180803003101.GA118981@dtor-ws>
References: <20180731111958.20043-1-hdegoede@redhat.com>
 <20180731111958.20043-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731111958.20043-2-hdegoede@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Hans,

On Tue, Jul 31, 2018 at 01:19:57PM +0200, Hans de Goede wrote:
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

I am concerned that people will not read the documentation carefully and
will treat it as true size, since it is what in the name. Maybe we
should say that it is size of usable area, in device units, and that
maximum reported coordinate is "touchscreen-min-x + touchscreen-size-x -
1"?

Thanks.

-- 
Dmitry
