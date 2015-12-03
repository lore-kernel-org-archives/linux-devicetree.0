From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add brcm,bcm63xx-regulator device tree
 binding
Date: Thu, 3 Dec 2015 08:14:33 +0000
Message-ID: <565FF9E9.1090503@simon.arlott.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk> <565CB1CF.5040306@simon.arlott.org.uk>
 <20151201221615.GY1929@sirena.org.uk>
 <b7ecdc8ebcdf9582620c22b0e8a4a96d24ba67c1@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202125325.GI1929@sirena.org.uk> <565F53FC.5080309@simon.arlott.org.uk>
 <20151203000631.GM1929@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151203000631.GM1929-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/12/15 00:06, Mark Brown wrote:
> On Wed, Dec 02, 2015 at 08:26:36PM +0000, Simon Arlott wrote:
>> On 02/12/15 12:53, Mark Brown wrote:
> 
>> > This is the sort of thing you can pick up from the SoC compatible
>> > strings.  As things stand there is zero content in this driver that
>> > relates to this SoC.
> 
>> There's always going to be very little content in the driver that
>> relates to this SoC, given that a single bit flip enables/disables
>> power.
> 
>> All other device tree drivers allow a register address to be specified
>> for the device, how is an offset in the regmap any different?
> 
> It's not that it's an offset in regmap, it's that you're trying to make
> a device driver with literally *no* content that is specific to the
> actual device.  If you're making a driver for a specific device like

The device that only has a single register, I don't want to make it
specific to the device by hard coding a register address in the driver
that changes when the same device is used on different SoCs.

> this it should know at least something about how to control the device
> from the compatible string.  If you're making a generic driver it should
> not make reference to specific devices.

Will you accept a generic driver for a simple enable regulator device on
a regmap? What should its compatible string be?

> In general I would prefer to have a driver with a SoC specific
> compatible string and the data tables in the kernel, that way we keep
> the device trees stable and our ABI more robust.
> 
>> >> The mask is used as there's one bit per regulator in the register, but
>> >> there's more than one way to express this in the DT:
> 
>> > I wouldn't expect to see it in the device tree at all for a device
>> > specific driver.
> 
>> If there isn't an individual entry in DT for each regulator, how is it
>> supposed to work? There's no #regulator-cells property.
> 
> There could be one if it would help, but we do normally manage to do
> this without - look at how other regulator drivers work.

Several of them have a fixed list of supported regulator names in the
driver. The regulator names for this device are meaningless to the
driver because all of the regulators look the same. They don't have a
known or controllable voltage and can only be turned on or off.

Any table mapping regulator names to bits in the register would be
different for each SoC making the list of regulator names in the device
tree redundant. If they're not listed in the device tree then I can't
use them as a phandle for other devices.

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
