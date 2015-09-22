From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Please suggest proper format for DT properties.
Date: Tue, 22 Sep 2015 10:36:51 +0200
Message-ID: <3914149.k3sqApaTEz@wuerfel>
References: <1442615803-17766-1-git-send-email-const@MakeLinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442615803-17766-1-git-send-email-const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
Cc: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 19 September 2015 01:36:43 Constantine Shulyupin wrote:
> 
> I am designing DT support for a hwmon chip. 
> It has some sensors, each of them can be:
>  - "disabled"
>  - "thermal diode"
>  - "thermistor"
>  - "voltage"
> 
> Four possible options for DT properties format.
> 
> Option 1: Separated property for each sensor.
> 
> Example nct7802 node:
> 
> nct7802 {
>         compatible = "nuvoton,nct7802";
>         reg = <0x2a>;
>         nuvoton,sensor1-type = "thermistor";
>         nuvoton,sensor2-type = "disabled";
>         nuvoton,sensor3-type = "voltage";
> };
> 
> Option 2: Array of strings for all sensors.
> 
> nct7802 {
>         compatible = "nuvoton,nct7802";
>         reg = <0x2a>;
>         nuvoton,sensors-types = "thermistor", "disabled", "voltage";
> };
> 
> Option 3: Sets of 4 cells.
> 
>   Borrowed from marvell,reg-init and broadcom,c45-reg-init.
> 
>   The first cell is the page address, 
>   the second a register address within the page,
>   the third cell contains a mask to be ANDed with the existing register
>   value, and the fourth cell is ORed with the result to yield the
>   new register value. If the third cell has a value of zero,
>   no read of the existing value is performed.
> 
> Example nct7802 node:
> 
> nct7802 {
>         compatible = "nuvoton,nct7802";
>         reg = <0x2a>;
>         nct7802,reg-init =
>                 <0 0x21 0 0x01 > // START = 1
>                 <0 0x22 0x03 0x02>; // RTD1_MD = 2
> };
> 

I would strongly prefer Option 1 or 2 over option 3.
Between 1 and 2, I'd probably go for 1. Another option might
be to have a subnode per sensor:

nct7802@2a {
        compatible = "nuvoton,nct7802";
        reg = <0x2a>;
	#address-cells=<1>;
	#size-cells=<0>;

	sensor@1 {
		compatible = "nuvoton,nct7802-thermistor";
		further-properties;
	};
	sensor@3 {
		compatible = "nuvoton,nct7802-voltage";
		for-example-range-mv = <0 5000>;
	};
};

In either case, I'd say that disabled sensors should not need to
be listed.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
