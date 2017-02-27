From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] hwmon: (sht15) Add device tree support
Date: Mon, 27 Feb 2017 13:46:42 -0300
Message-ID: <CAOMZO5D9UyKpxRB_bLrDFohyofTBu=sZArVynu--Fao6PewcKg@mail.gmail.com>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com> <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, FoxPeter-5t/GDYzpMLSELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Feb 27, 2017 at 12:57 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

>> +Required properties:
>> +
>> + - "compatible": must be "sensirion,sht15".
>> + - "data-gpios": GPIO connected to the data line.
>> + - "clk-gpios": GPIO connected to the clock line.
>
> Looks like this device is I2C perhaps? Though I'm not sure the waveforms
> before and after transactions are compliant.

No, the SHT15 datasheet is very clear that the device does not operate
in I2C mode:
"The sensor cannot be addressed by I2C protocol".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
