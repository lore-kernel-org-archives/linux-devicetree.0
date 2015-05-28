From: =?windows-1252?Q?Noralf_Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Fri, 29 May 2015 00:43:46 +0200
Message-ID: <55679A22.2090909@tronnes.org>
References: <20150528114500.GP11677@x1> <1432837987-22861-1-git-send-email-eric@anholt.net> <55678BBC.5090507@tronnes.org> <87r3q072gl.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r3q072gl.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



Den 29.05.2015 00:38, skrev Eric Anholt:
> Noralf Tr=F8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> writes:
>
>> Den 28.05.2015 20:33, skrev Eric Anholt:
>>> This gives us a function for making mailbox property channel reques=
ts
>>> of the firmware, which is most notable in that it will let us get a=
nd
>>> set clock rates.
>>>
>>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ...
>>> +static int rpi_firmware_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev =3D &pdev->dev;
>>> +	struct rpi_firmware *fw;
>>> +
>>> +	fw =3D devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
>>> +	if (!fw)
>>> +		return -ENOMEM;
>>> +
>>> +	fw->cl.dev =3D dev;
>>> +	fw->cl.rx_callback =3D response_callback;
>>> +	fw->cl.tx_block =3D true;
>>> +
>>> +	fw->chan =3D mbox_request_channel(&fw->cl, 0);
>>> +	if (IS_ERR(fw->chan)) {
>>> +		int ret =3D PTR_ERR(fw->chan);
>>> +		if (ret !=3D -EPROBE_DEFER)
>>> +			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	init_completion(&fw->c);
>>> +
>>> +	platform_set_drvdata(pdev, fw);
>>> +
>>> +	rpi_firmware_print_firmware_revision(dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rpi_firmware_remove(struct platform_device *pdev)
>>> +{
>>> +	struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
>>> +
>>> +	mbox_free_channel(fw->chan);
>> I guess driver data has to be reset here:
>> platform_set_drvdata(pdev, NULL);
> Fixed.
>

I was wrong about this one as Stephen pointed out.
My point became mute now that rpi_firmware_property_list() doesn't look=
=20
up driver data anymore.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
