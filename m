From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: sun8i: Add board dts file for Banana Pi M2 Ultra
Date: Thu, 28 Sep 2017 23:38:59 +0800
Message-ID: <FCCC8A9F-4818-4CE3-A7E8-62ED9A864F92@aosc.io>
References: <20170928092543.45648-1-icenowy@aosc.io> <20170928092543.45648-3-icenowy@aosc.io> <20170928151225.n4pyvn65u6hvpjd7@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928151225.n4pyvn65u6hvpjd7@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



于 2017年9月28日 GMT+08:00 下午11:12:25, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>On Thu, Sep 28, 2017 at 09:25:42AM +0000, Icenowy Zheng wrote:
>> +&mmc2 {
>> +	vmmc-supply = <&reg_dcdc1>;
>> +	bus-width = <8>;
>> +	non-removable;
>> +	status = "okay";
>> +};
>
>I guess it's an emmc, it doesn't have a vqmmmc regulator?

vqmmc is also 3v3.

>
>Looks good otherwise, thanks!
>Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
