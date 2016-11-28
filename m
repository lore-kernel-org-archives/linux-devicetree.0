From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] [media] dt-bindings: add TI VPIF documentation
Date: Mon, 28 Nov 2016 14:30:01 -0800
Message-ID: <m2shqbs0eu.fsf@baylibre.com>
References: <20161122155244.802-1-khilman@baylibre.com>
        <20161122155244.802-5-khilman@baylibre.com>
        <20161128213822.26oeyzkht5jz5gd3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161128213822.26oeyzkht5jz5gd3@rob-hp-laptop> (Rob Herring's
        message of "Mon, 28 Nov 2016 15:38:22 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bartosz =?utf-8?Q?Go=C5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Tue, Nov 22, 2016 at 07:52:44AM -0800, Kevin Hilman wrote:
>> Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../bindings/media/ti,da850-vpif-capture.txt       | 65 ++++++++++++++++++++++
>>  .../devicetree/bindings/media/ti,da850-vpif.txt    |  8 +++
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif-capture.txt
>>  create mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif-capture.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif-capture.txt
>> new file mode 100644
>> index 000000000000..c447ac482c1d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/ti,da850-vpif-capture.txt
>> @@ -0,0 +1,65 @@
>> +Texas Instruments VPIF Capture
>> +------------------------------
>> +
>> +The TI Video Port InterFace (VPIF) capture component is the primary
>> +component for video capture on the DA850 family of TI DaVinci SoCs.
>> +
>> +TI Document number reference: SPRUH82C
>> +
>> +Required properties:
>> +- compatible: must be "ti,da850-vpif-capture"
>> +- reg: physical base address and length of the registers set for the device;
>> +- interrupts: should contain IRQ line for the VPIF
>> +
>> +VPIF capture has a 16-bit parallel bus input, supporting 2 8-bit
>> +channels or a single 16-bit channel.  It should contain at least one
>> +port child node with child 'endpoint' node. Please refer to the
>> +bindings defined in
>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +Example using 2 8-bit input channels, one of which is connected to an
>> +I2C-connected TVP5147 decoder:
>> +
>> +	vpif_capture: video-capture@0x00217000 {
>> +		reg = <0x00217000 0x1000>;
>> +		interrupts = <92>;
>> +
>> +		port {
>> +			vpif_ch0: endpoint@0 {
>> +				  reg = <0>;
>> +				  bus-width = <8>;
>> +				  remote-endpoint = <&composite>;
>> +			};
>> +
>> +			vpif_ch1: endpoint@1 {
>
> I think probably channels here should be ports rather than endpoints. 
> AIUI, having multiple endpoints is for cases like a mux or 1 to many 
> connections. There's only one data flow, but multiple sources or sinks.

Looking at this closer... , I used an endpoint because it's bascially a
16-bit parallel bus, that can be configured as (up to) 2 8-bit
"channels.  So, based on the video-interfaces.txt doc, I configured this
as a single port, with (up to) 2 endpoints.  That also allows me to
connect output of the decoder directly, using the remote-endpoint
property.

So I guess I'm not fully understanding your suggestion.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
