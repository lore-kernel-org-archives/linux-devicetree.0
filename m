From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/11] ARM: dts: imx6qdl: video capture support
Date: Wed, 14 Jun 2017 09:45:43 -0700
Message-ID: <c88b7808-7387-4702-dc51-960a691feb40@gmail.com>
References: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
 <20170614150938.GB30112@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170614150938.GB30112@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/14/2017 08:09 AM, Shawn Guo wrote:
> On Mon, Jun 12, 2017 at 11:23:53AM -0700, Steve Longerbeam wrote:
>> This series defines the i.MX6 internal video multiplexers and MIPI CSI-2
>> receiver device nodes, and their connections to eachother and the i.MX6
>> IPU CSI ports.
>>
>> It also implements video capture support on the SabreLite, SabreSD, and
>> SabreAuto reference platforms, by defining the video sensor nodes on those
>> platforms, and their connections to the video muxes and MIPI CSI-2 receiver.
>>
>> There should not be much of anything controversial in this series. The
>> imx-media driver is set to be merged in time for 4.13, so please accept
>> this series soon.
>>
>>
>> Philipp Zabel (2):
>>    ARM: dts: imx6qdl: add multiplexer controls
>>    ARM: dts: imx6qdl: Add video multiplexers, mipi_csi, and their
>>      connections
>>
>> Steve Longerbeam (9):
>>    ARM: dts: imx6qdl: Add compatible, clocks, irqs to MIPI CSI-2 node
>>    ARM: dts: imx6qdl: add capture-subsystem device
>>    ARM: dts: imx6qdl-sabrelite: remove erratum ERR006687 workaround
>>    ARM: dts: imx6-sabrelite: add OV5642 and OV5640 camera sensors
>>    ARM: dts: imx6-sabresd: add OV5642 and OV5640 camera sensors
>>    ARM: dts: imx6-sabreauto: create i2cmux for i2c3
>>    ARM: dts: imx6-sabreauto: add reset-gpios property for max7310_b
>>    ARM: dts: imx6-sabreauto: add pinctrl for gpt input capture
>>    ARM: dts: imx6-sabreauto: add the ADV7180 video decoder
> 
> Applied all, thanks.
> 

Thanks Shawn!

Steve
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
