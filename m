From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
Date: Tue, 22 Nov 2016 15:10:27 -0600
Message-ID: <CAL_Jsq+kifmd9rvZuN+OKCSDdnU+wB3QLikU1F60VqrwLYaXRQ@mail.gmail.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161122110548.GB22735@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161122110548.GB22735@ulmo.ba.sec>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 5:05 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
>> Document properties common to several display panels in a central
>> location that can be referenced by the panel device tree bindings.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>  .../bindings/display/panel/panel-common.txt        | 91 ++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
>> new file mode 100644
>> index 000000000000..ec52c472c845
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
>> @@ -0,0 +1,91 @@
>> +Common Properties for Display Panel
>> +===================================
>> +
>> +This document defines device tree properties common to several classes of
>> +display panels. It doesn't constitue a device tree binding specification by
>> +itself but is meant to be referenced by device tree bindings.
>> +
>> +When referenced from panel device tree bindings the properties defined in this
>> +document are defined as follows. The panel device tree bindings are
>> +responsible for defining whether each property is required or optional.
>> +
>> +
>> +Descriptive Properties
>> +----------------------
>> +
>> +- width-mm,
>> +- height-mm: The width-mm and height-mm specify the width and height of the
>> +  physical area where images are displayed. These properties are expressed in
>> +  millimeters and rounded to the closest unit.
>
> Erm... this is already implied by the compatible string. Having this in
> device tree is completely redundant.
>
>> +- label: The label property specifies a symbolic name for the panel as a
>> +  string suitable for use by humans. It typically contains a name inscribed on
>> +  the system (e.g. as an affixed label) or specified in the system's
>> +  documentation (e.g. in the user's manual).
>> +
>> +  If no such name exists, and unless the property is mandatory according to
>> +  device tree bindings, it shall rather be omitted than constructed of
>> +  non-descriptive information. For instance an LCD panel in a system that
>> +  contains a single panel shall not be labelled "LCD" if that name is not
>> +  inscribed on the system or used in a descriptive fashion in system
>> +  documentation.
>> +
>> +
>> +Display Timings
>> +---------------
>> +
>> +- panel-timing: Most display panels are restricted to a single resolution and
>> +  require specific display timings. The panel-timing subnode expresses those
>> +  timings as specified in the timing subnode section of the display timing
>> +  bindings defined in
>> +  Documentation/devicetree/bindings/display/display-timing.txt.
>
> Why? That's also implied by the compatible string. Honestly, I thought
> by now we had been over this often enough...

While I completely agree we don't want *only* generic compatibles nor
generic gpio and power control, I think timing values in DT are fine.
They are just data copied out of datasheets and aren't tweaked per
platform. If the same data would make sense to put into a display
EDID, I think it also makes sense to put that data in DT.

Rob
