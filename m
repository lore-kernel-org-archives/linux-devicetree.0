From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH 2/2] drm: Add DT bindings documentation for OpenCores
 VGA/LCD controller
Date: Mon, 27 Jun 2016 13:21:28 +0200
Message-ID: <CAN8YU5MnscQdeC4nx=_YcTmG8peS=mp3vLnvH13dqBfTovM46Q@mail.gmail.com>
References: <1465479199-9810-1-git-send-email-andrea.merello@gmail.com> <20160610173621.GA17641@rob-hp-laptop>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160610173621.GA17641@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Francesco Diotalevi <francesco.diotalevi@iit.it>, Claudio Lorini <claudio.lorini@iit.it>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 7:36 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Jun 09, 2016 at 03:33:19PM +0200, Andrea Merello wrote:
>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Cc: Francesco Diotalevi <francesco.diotalevi@iit.it>
>> Cc: Claudio Lorini <claudio.lorini@iit.it>
>> ---
>>  .../bindings/display/opencores,ocdrm.txt           | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/opencores,ocdrm.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/opencores,ocdrm.txt b/Documentation/devicetree/bindings/display/opencores,ocdrm.txt
>> new file mode 100644
>> index 0000000..8d36de5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/opencores,ocdrm.txt
>> @@ -0,0 +1,27 @@
>> +OpenCores VGA/LCD controller
>> +
>> +Required properties:
>> +- compatible: "opencores,ocdrm"
>
> Name this based on what the h/w block is called, not a Linux subsystem.

Ok.

Something like "opencores,video" ?

The older framebuffer driver has "opencores,ocfb"; I assumed the
suffix -fb was because of it is a "framebuffer" _driver_, but maybe it
is because they consider it a "framebuffer" _device_.

Maybe I can keep the same "compatible" string? Is it ok to have two
drivers (maybe temporarily, until the older one fades out) with the
same "compatible" ?

> Is there any sort of versioning for OpenCore IP that you can include in
> the name?

Not sure about this. I'll check.

>> +- reg: Physical base address and length of the controller's registers.
>> +- clocks: Must contain an entry for the pixelclock generator.
>> +  See ../clocks/clock-bindings.txt for details.
>> +
>> +Required sub-nodes:
>> +- port: the connection to a DRM bridge.  The connection is modelled
>
> Don't include Linux driver details (DRM) in bindings.

You mean telling that the port must be a connection to a DRM bridge,
leaving out further details?

>> +  using the OF graph bindings specified in
>> +  Documentation/devicetree/bindings/graph.txt.
>> +
>> +Example:
>> +
>> +ocdrm@43c10000 {
>> +     compatible = "opencores,ocfb-drm";
>
> Doesn't match the above and even worse naming.

OK.

>> +     reg = <0x43c10000 0x10000>;
>> +     clocks = <&pix_clock>;
>> +     ports {
>> +             port@0 {
>
> Single port doesn't need a unit address.

OK.

>> +                     rgb_out: endpoint {
>> +                             remote-endpoint = <&bridge_in>;
>> +                     };
>> +             };
>> +     };
>> +};
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
