From: =?UTF-8?Q?=c5=81ukasz_Majewski?= <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] dts: display5: Device tree description of LWN's
 DISPLAY5 board
Date: Wed, 20 Sep 2017 11:45:12 +0200
Message-ID: <3537f09b-be9d-0b43-0bec-87d08b43312f@denx.de>
References: <1505746765-965-1-git-send-email-lukma@denx.de>
 <CAOMZO5Du4gH1jwcP4ssRPD17GsEAVERpkNBD7W2z5f+4TAd=nA@mail.gmail.com>
 <f203efc5-b85c-aa3d-0dc6-929ea348e5f6@denx.de>
 <CAOMZO5CHR14LWqkgpSiPnMV_6X+Fq=fe-KmE5CrdiqxRUyT8xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5CHR14LWqkgpSiPnMV_6X+Fq=fe-KmE5CrdiqxRUyT8xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> Hi Lukasz,
> 
> On Wed, Sep 20, 2017 at 6:22 AM, Łukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org> wrote:
> 
>> Could you be more specific here?
>>
>> The 0x80000000 corresponds to IMX_NO_PAD_CTL in pinctrl-imx.c, which
>> prevents from manual GPIO control.
>>
>> The 0x80000000 value is the IOMUXC_SW_PAD_CTL_PAD_CSI0_DATA11 (0x020E_0654)
>> config data (16 bits only -> 0x0).
>>
>> Writing 0x0 to this register is perfectly fine for my application.
>>
>>
>> I'm a bit in doubt to what I shall do more?
> 
> As per the Reference Manual, the POR reset for
> IOMUXC_SW_PAD_CTL_PAD_CSI0_DATA11 is 0x1b0b0.
> 
> 0x80000000 tells the kernel to not touch this IOMUX and use whatever
> value comes from the bootloader.
> 
> If your bootloader does not touch this register, then you probably
> read 0x1b0b0 from it.
> 
> In this case, please do this instead:
> 
> MX6QDL_PAD_CSI0_DAT11__GPIO5_IO29 0x1b0b0
> 

Ok. Thanks for explanation :-)


-- 
Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
