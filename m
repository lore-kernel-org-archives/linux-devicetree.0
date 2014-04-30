Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <20140429123328.GB3640@katana>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
	<1398185154-19404-7-git-send-email-dianders@chromium.org>
	<20140429123328.GB3640@katana>
Date: Wed, 30 Apr 2014 10:44:24 -0700
Message-ID: <CAD=FV=Vv62Y2FouYEsvTA0U9p0qgDBDUhu2_4DmiiRLCFeJUiA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: ChromeOS EC tunnel driver
From: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, Andrew Bresticker <abrestic@chromium.org>, Dylan Reid <dgreid@chromium.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, jdelvare@suse.de, shane.huang@amd.com, maxime.ripard@free-electrons.com, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, Bjorn Andersson <bjorn.andersson@sonymobile.com>, kevin.strasser@linux.intel.com, Tony Prisk <linux@prisktech.co.nz>, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, Matt Porter <matt.porter@linaro.org>, naveen krishna <ch.naveen@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Wolfram,

On Tue, Apr 29, 2014 at 5:33 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> Hi,
>
> just a basic review to keep things rolling...

Thanks for the review!  It sounds like other changes are blocked on
this one landing, so hopefully we can make some good progress!  :)

>> On the original Samsung ARM Chromebook these devices were on an I2C
>> bus that was shared between the AP and the EC and arbitrated using
>> some extranal GPIOs (see i2c-arb-gpio-challenge).
>>
>> The original arbitration scheme worked well enough but had some
>> downsides:
>> * It was nonstandard (not using standard I2C multimaster)
>> * It only worked if the EC-AP communication was I2C
>> * It was relatively hard to debug problems (hard to tell if i2c issues
>>   were caused by the EC, the AP, or some device on the bus).
>>
>> On the HP Chromebook 11 the design was changed to:
>
> This paragraph would be a nice update for the gpio-arbitration docs.

Done.  <https://patchwork.kernel.org/patch/4088551/>


>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
>
> The bindings should independently be sent to the devicetree list.
>
>> new file mode 100644
>> index 0000000..898f030
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
>> @@ -0,0 +1,39 @@
>> +I2C bus that tunnels through the ChromeOS EC (cros-ec)
>> +======================================================
>> +On some ChromeOS board designs we've got a connection to the EC (embedded
>> +controller) but no direct connection to some devices on the other side of
>> +the EC (like a battery and PMIC).  To get access to those devices we need
>> +to tunnel our i2c commands through the EC.
>> +
>> +The node for this device should be under a cros-ec node like google,cros-ec-spi
>> +or google,cros-ec-i2c.
>> +
>> +
>> +Required properties:
>> +- compatible: google,cros-ec-i2c-tunnel
>> +- google,remote-bus: The EC bus we'd like to talk to.
>> +
>> +Optional child nodes:
>> +- One node per I2C device connected to the tunnelled I2C bus.
>> +
>> +
>> +Example:
>> +     cros-ec@0 {
>> +             compatible = "google,cros-ec-spi";
>> +
>> +             ...
>> +
>> +             i2c-tunnel {
>> +                     compatible = "google,cros-ec-i2c-tunnel";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +
>> +                     google,remote-bus = <0>;
>> +
>> +                     battery: sbs-battery@b {
>> +                             compatible = "sbs,sbs-battery";
>> +                             reg = <0xb>;
>> +                             sbs,poll-retry-count = <1>;
>> +                     };
>> +             };
>> +     }
>
> Can the tunnel have n busses? How to represent them then? I think the
> remote-bus property should go in favor of proper sub-nodes?

I suppose it could have n busses, though today's ECs don't.

I think that the binding could later be extended to support this with:

        cros-ec@0 {
                compatible = "google,cros-ec-spi";

                ...

                i2c-tunnel0 {
                        compatible = "google,cros-ec-i2c-tunnel";
                        #address-cells = <1>;
                        #size-cells = <0>;

                        google,remote-bus = <0>;

                        battery: sbs-battery@b {
                                compatible = "sbs,sbs-battery";
                                reg = <0xb>;
                                sbs,poll-retry-count = <1>;
                        };
                };

                i2c-tunnel1 {
                        compatible = "google,cros-ec-i2c-tunnel";
                        #address-cells = <1>;
                        #size-cells = <0>;

                        google,remote-bus = <1>;

                        battery: sbs-battery@b {
                                compatible = "sbs,sbs-battery";
                                reg = <0xb>;
                                sbs,poll-retry-count = <1>;
                        };
                };
       }

...but since there's no need now, it seems like we could just leave it
with supporting 1 for now.  If we extend it like above then old device
trees will still work on newer kernels.

Note about "google,remote-bus" instead of "reg".   The main
"google,cros-ec-spi" generally has non-addressed sub-nodes.  It has no
"#address-cells" or "#size-cells".  The keyboard component, for
instance, doesn't have an "address".  You talk to it using the
keyboard commands.

...I don't think it's generally possible to have some sub nodes that
have addresses and other sub nodes that don't.  I'm happy to be
corrected, though.


Note: according to the device tree stable bindings theorem, I don't
think I'm allowed to retroactively go back and say that the keyboard
node needs a dummy "reg = <0>;" nor can I require that
"google,cros-ec-spi" add #address-cells and #size-cells.  Both device
tree bindings have been in kernel since ~3.9.


Can you give me an example of what you mean by "proper sub nodes"?


> Wouldn't it
> also be more generic to have the tunnel node seperate and reference the
> tunnel-mechanism (spi here) as a phandle?

What makes it more generic?  It's still a MFD and still only works
atop the cros_ec, so it should be under the cros_ec device, shouldn't
it?

I know use a phandle for mux, but from
<https://lkml.org/lkml/2013/2/13/517> it sounds like we were forced
into it.


>> +/**
>> + * ec_i2c_construct_message - construct a message to go to the EC
>> + *
>> + * This function effectively stuffs the standard i2c_msg format of Linux into
>> + * a format that the EC understands.
>> + *
>> + * @buf: The buffer to fill.  Can pass NULL to count how many bytes the message
>> + *       would be.
>
> I wonder about this NULL thing. That means the size is calculated twice.
> Why not make two functions instead, one fir size calc, one for setting
> up?

Done.


>> +/**
>> + * ec_i2c_parse_response - Parse a response from the EC
>> + *
>> + * We'll take the EC's response and copy it back into msgs.
>> + *
>> + * @buf: The buffer to parse.  Can pass NULL to count how many bytes we expect
>> + *    the response to be. Otherwise we assume that the right number of
>> + *    bytes are available.
>
> Ditto.

Done.


>> +     result = bus->ec->command_sendrecv(bus->ec, EC_CMD_I2C_PASSTHRU,
>> +                                        request, request_len,
>> +                                        response, response_len);
>
> This function pointer should be checked against NULL in probe, I
> think.

Done.


>> +static int ec_i2c_probe(struct platform_device *pdev)
>> +{
>> +     struct device_node *np = pdev->dev.of_node;
>> +     struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>> +     struct device *dev = &pdev->dev;
>> +     struct ec_i2c_device *bus = NULL;
>> +     u32 remote_bus;
>> +     int err;
>> +
>> +     dev_dbg(dev, "Probing\n");
>
> Drop. Device core has it already.

Done.


>> +
>> +     if (!np) {
>> +             dev_err(dev, "no device node\n");
>> +             return -ENOENT;
>> +     }
>
> Can this happen?

Not that I know of.  I assume you want me to remove this, so done.


>> +     bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
>> +     if (bus == NULL) {
>> +             dev_err(dev, "cannot allocate bus device\n");
>
> No need for error strings when allocating.

Done.


>> +             return -ENOMEM;
>> +     }
>> +
>> +     dev_dbg(dev, "ChromeOS EC I2C tunnel adapter\n");
>
> Drop. Device core debug has it, too.

Done.


>> +
>> +     return err;
>> +}
>> +
>> +static int ec_i2c_remove(struct platform_device *dev)
>> +{
>> +     struct ec_i2c_device *bus = platform_get_drvdata(dev);
>> +
>> +     platform_set_drvdata(dev, NULL);
>
> Not needed.

Duh, thanks.  Done.


>> +     i2c_del_adapter(&bus->adap);
>> +
>> +     return 0;
>> +}
>> +

Sending up a v3 with fixes...

-Doug
