From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Mon, 6 Mar 2017 22:51:19 +0100
Message-ID: <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
 <093b4e9c0ae6413499e5bf8ec309fa41@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <093b4e9c0ae6413499e5bf8ec309fa41-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 03/06/2017 10:46 PM, Fabio Estevam wrote:
> Hi Christopher,
>
> On Mon, Mar 6, 2017 at 6:40 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
>> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>>
>> On some boards the hpd pin of a hdmi connector is wired up to a gpio
>> pin. Since in the DRM world the tfp410 driver is responsible for
>> handling the connector, add support for hpd gpios in this very driver.
>>
>> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>> ---
>>  drivers/gpu/drm/bridge/ti-tfp410.c | 72 ++++++++++++++++++++++++++++++++++++--
>
> It would be nice to add 'hpd-gpios' property in the binding doc as well:
> Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt

The hpd-gpios property does *not* belong to the ti,tfp410 binding but to 
the hdmi-connector one where it is already documented:
Documentation/devicetree/bindings/display/connector/hdmi-connector.txt

Unfortunatly, there is no dedicated driver for the connector in Linux; 
the connector properties have to be handled by the encoder (here  the 
tfp410) driver. Note that this already happens for the ddc-i2c-bus property.

Cheers,
Christopher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
