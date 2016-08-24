From: Vinay Simha <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Wed, 24 Aug 2016 17:34:55 +0530
Message-ID: <CAGWqDJ7L3DPKo9iHT4+FZvksO8hbwQ4Zfb5qVrTEwmYcXb_U2A@mail.gmail.com>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com> <20160824114534.GA3169@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824114534.GA3169-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

thierry,

this is the reference pinouts of the panel
http://www.tonylabs.com/wp-content/uploads/LT070ME05000-pinouts.jpg

as you suggest , i will change the vcc-supply,

 - iovcc-supply: phandle of the regulator that supplies power to
          the IOVCC voltage input (1.8 V)

will keep the other two(vddp-supply, dcdc_en-supply) remaining same.

On Wed, Aug 24, 2016 at 5:15 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
>> Add documentation for lt070me05000 panel
>>
>> Cc: Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> ---
>> v2:
>>  * incorporated rob herring and thierry reviews
>>    gpio to gpios, gpio to regulator using fixed regulators
>>    and pwm backlight is removed, since it is controlled by
>>    dcs commands
>> ---
>>  .../bindings/display/panel/jdi,lt070me05000.txt    | 57 ++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> new file mode 100644
>> index 0000000..613b76f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> @@ -0,0 +1,57 @@
>> +JDI model LT070ME05000 1200x1920 7" DSI Panel
>> +
>> +Required properties:
>> +- compatible: should be "jdi,lt070me05000"
>> +- vddp-supply: phandle of the regulator that provides the supply voltage
>> +  Power IC supply (3-5V)
>> +- dcdc_en-supply: phandle of the regulator that provides the supply voltage
>> +  Power IC supply enable, High active
>> +- vcc-supply: phandle of the regulator that provides the supply voltage
>> +  IOVCC , power supply for LCM (1.8V)
>
> I was just going to apply this and wanted to add some information about
> how many lanes the panel uses, so I looked at the datasheet linked to in
> patch 4/4:
>
>         http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
>
> and noticed that the power supplies in the binding here don't match the
> ones listed in the datasheet. Granted, the datasheet is somewhat meager,
> but it lists the following three input voltages:
>
>         - IOVCC at 1.8 V
>         - VDD at 3.0 V
>         - VDDP at 3.0 V
>
> This matches in part what the above binding describes, but it's not
> quite right, so I'm wondering if the name for dcdc_en-supply came from
> the board schematics and reflects the name of the rail on the board
> design that provides this rather than the input voltage on the panel.
>
> I think we should follow the names in the panel datasheet so that people
> can more easily reference the correct regulators when using this panel
> on a different board. I'd suggest:
>
>         - iovcc-supply: phandle of the regulator that supplies power to
>           the IOVCC voltage input (1.8 V)
>         - vdd-supply: phandle of the regulator that supplies power to
>           the VDD voltage input (3.0 V)
>         - vddp-supply: phandle of the regulator that supplies power to
>           the VDDP voltage input (3.0 V)
>
> Any objections?
>
> Thierry



-- 
regards,
vinaysimha
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
