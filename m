From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: dt-bindings: Add documentation for the Meson USB2 PHYs
Date: Wed, 21 Sep 2016 11:38:55 -0700
Message-ID: <7ha8f1hzcw.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-3-martin.blumenstingl@googlemail.com>
        <20160920142944.GA16016@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160920142944.GA16016@rob-hp-laptop> (Rob Herring's message of
        "Tue, 20 Sep 2016 09:29:45 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Sun, Sep 11, 2016 at 03:41:07PM +0200, Martin Blumenstingl wrote:
>> Add the documentation for the bindings for the Meson8b and GXBB USB2
>> PHYs.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/phy/meson-usb2-phy.txt     | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
>> new file mode 100644
>> index 0000000..9da5ea2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
>> @@ -0,0 +1,27 @@
>> +* Amlogic USB2 PHY
>> +
>> +Required properties:
>> +- compatible:	Depending on the platform this should be one of:
>> +	"amlogic,meson8b-usb2-phy"
>> +	"amlogic,meson-gxbb-usb2-phy"
>> +- reg:		The base address and length of the registers
>> +- #phys-cells:	should be 0 (see phy-bindings.txt in this directory)
>> +- clocks:	phandle and clock identifier for the phy clocks
>> +- clock-names:	"usb_general" and "usb"
>> +
>> +Optional properties:
>> +- resets:	reference to the reset controller
>> +- phy-supply:	see phy-bindings.txt in this directory
>> +
>> +
>> +Example:
>> +
>> +usb0_phy: usb_phy@0 {
>
> usb-phy@0
>
> With that,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Oops, I had already merged this one.

Martin, can you send a fixup patch for the underscores?

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
