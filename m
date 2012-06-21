From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Thu, 21 Jun 2012 16:22:26 -0600
Message-ID: <4FE39EA2.8050809@wwwdotorg.org>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <1339590863-10564-9-git-send-email-richard.zhao@freescale.com>
 <4FD8AD42.6010702@gmail.com> <20120613152841.GA23590@richard-laptop>
 <4FD8C4DB.4020908@gmail.com>
 <20120614013343.GD29684@b20223-02.ap.freescale.net>
 <4FE1DE53.4070202@gmail.com> <4FE1EF26.9080401@wwwdotorg.org>
 <F281D0F91ED19E4D8E63A7504E8A649803BE3E73@039-SN2MPN1-023.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <F281D0F91ED19E4D8E63A7504E8A649803BE3E73-RL0Hj/+nBVDtkydW1Tv2Dq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/20/2012 07:32 PM, Chen Peter-B29397 wrote:
>  
>> I haven't been following the thread, but just noticed it. Very similar
>> things (DT nodes for probed devices) are coming up quite a bit recently,
>> for example:
>>
>> Re: Where to power on the wifi device before loading the driver.
>> http://www.spinics.net/lists/arm-kernel/msg180368.html
>>
>> dt: rfkill-gpio: add bindings documentation
>> http://www.spinics.net/lists/linux-tegra/msg03977.html
>>
>> I wonder if there's any kind of infra-structure or standardized bindings
>> that would be useful here?
> 
> Hi Stephen,
> For your suggestion: 
> 
> sdhci@78000000 {
> 	compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
> 	reg = <0x78000000 0x200>;
> 	interrupts = <0 14 0x04>;
> 
> 	sdio-device {
> 		reset-gpios = <...>;
> 		enable-gpios = <...>;
> 	};
> };
> 
> I have a question, if reset-gpio or enable-gpio is not set, how bus (sd or usb) know
> it is a sdio device as the wifi is not powered on at the time, it will not response host's
> command,  the hub at usb bus is the same.

That's a good point. We need those properties to be part of the device
that controls the port/slot/connector, not the thing that plugs into it.
Having each such binding and driver implement this themselves might not
be a good idea though. Perhaps we can standardize on a mechanism for
this; something vaguely like rfkill, but for arbitrary types of devices
connected to ports.

For USB at least, where the power/reset/... GPIOs might affect just one
port on a hub rather than the root USB host controller, the issue of
representing these properties on a dynamically probed device still
applies. Something like:

ehci {
    /* The following node is dynamically detected, although the hub
     * IC is physically soldered onto the board
     */
    hub {
        hub { /* also dynamic */
            port@2 {
                child-supply = <&regulator>;
                reset-gpios = <&gpio 0 0>;
            };
        };
    };
};

But without knowing what might be connected to port@2, how do we know
how to sequence the power supply and reset GPIOs according to its
requirements? I guess this is part of the specification of the port
itself though, not the attached device, since anything that is allowed
to plug in must conform to whatever sequencing the port is designed to
give. If the connected device is known, the port@2 node in DT can encode
whatever sequencing requirements are associated with the known connected
device.
