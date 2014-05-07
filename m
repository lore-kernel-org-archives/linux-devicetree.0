From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 07 May 2014 12:07:02 -0700
Message-ID: <536A8456.1040208@boundarydevices.com>
References: <536A697D.3020002@boundarydevices.com> <6261287.BoJ6nRgupA@wuerfel> <536A7CE0.6070005@boundarydevices.com> <142702592.Qpp2HrZZke@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <142702592.Qpp2HrZZke@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 05/07/2014 11:38 AM, Arnd Bergmann wrote:
> On Wednesday 07 May 2014 11:35:12 Eric Nelson wrote:
>>
>> On 05/07/2014 11:10 AM, Arnd Bergmann wrote:
>>> On Wednesday 07 May 2014 10:47:27 Eric Nelson wrote:
>>>>
>>>> It seems reasonable to tell the kernel to skip this if the
>>>> WiFi driver isn't configured into the kernel (i.e. there's
>>>> no point in enumerating), so I was hoping to surround this
>>>> USDHC2 block with #ifdefs:
>>>>
>>>>           https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_3.10.17_1.0.0_ga/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi#L640
>>>>
>>>> The alternative aren't very nice:
>>>>           populate extra parts to drive these signals, or
>>>>           copy the DTB and strip out the unused parts
>>>>
>>>> The first is wasteful (and environmentally un-friendly), and
>>>> the second doesn't scale very well and pollutes the Git tree.
>>>>
>>>
>>> It's fine to have two .dtb files (as Olof and Jason also suggested)
>>> and you can even have both in the kernel and just pick the right
>>> one for your machine.
>>>
>>> Another option that works is to have the boot loader set up the
>>> present devices. With u-boot, you can easily manipulate the binary dtb
>>> and change a 'status="disabled"' to 'status="ok"' or vice versa
>>> for devices that are only sometimes populated, or you can change
>>> the amount of installed RAM as detected by the loader.
>>>
>>
>> Easily is such a relative term
>>
>> Thanks for the advice.
>
> I haven't done it myself, but I'm told that you can do it from the
> boot script as normal commands, without having to modify the source.
>

It turns out not to be so difficult, but it is kinda quirky.

Once the fdt is loaded and the address set with "fdt addr",
the "fdt" command can print all or parts of the tree:

	U-Boot > fdt print /v4l2_out
	v4l2_out {
		compatible = "fsl,mxc_v4l2_output";
		status = "okay";
	};

And you can read parts of it into variables. This example
sets the "v4lstat" variable to the value of /v4l2_out.status:

	U-Boot > fdt get value v4lstat /v4l2_out status

	U-Boot > echo $v4lstat
	okay

For me, setting the status to "disabled" required a
"resize" first:

	U-Boot > fdt set /v4l2_out status disabled
	libfdt fdt_setprop(): FDT_ERR_NOSPACE
	U-Boot > fdt resize
	U-Boot > fdt set /v4l2_out status disabled

	U-Boot > fdt print /v4l2_out
	v4l2_out {
		compatible = "fsl,mxc_v4l2_output";
		status = "disabled";
	};

Regards,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
