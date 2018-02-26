From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 6/7] arm64: allwinner: h6: add the
 basical Allwinner H6 DTSI file
Date: Mon, 26 Feb 2018 09:54:01 -0600
Message-ID: <b9bc5944-b9e3-91d7-8012-c87a2b2d17fa@sholland.org>
References: <20180223123555.64009-6-icenowy@aosc.io>
 <20180223123555.64009-7-icenowy@aosc.io>
 <20180223152038.2bflylwa6vj4gzfj@flea.lan>
 <81D53DC5-7622-430E-A530-ED0DE5397DC3@aosc.io>
 <20180226092645.xghkmfowenzlbm42@flea.lan>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBH632DKAKGQE4U6LVAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180226092645.xghkmfowenzlbm42-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/26/18 03:26, Maxime Ripard wrote:
> On Fri, Feb 23, 2018 at 11:22:06PM +0800, Icenowy Zheng wrote:
>>>> +	psci {
>>>> +		compatible = "arm,psci-0.2";
>>>> +		method = "smc";
>>>> +	};
>>>
>>> Is it needed? The bootloader should fill it with whatever version it
>>> has, shouldn't it?
>>
>> But we now use ATF rather than U-Boot PSCI. U-Boot will not fill ATF
>> info.
>>
>> See A64/H5 device trees.
> 
> So if the PSCI version implemented in ATF ever changes, we would have
> to update all the DT everywhere, but only if you're running the new
> version?

Yes but no. PSCI 1.0 is generally backward compatible with PSCI 0.2. In fact,
the Linux driver treats them exactly the same:

        { .compatible = "arm,psci-0.2", .data = psci_0_2_init},
        { .compatible = "arm,psci-1.0", .data = psci_0_2_init},

For the H6, however, the oldest ATF source available (which I believe was the
one in use during bringup) is based on mainline 1.4, and is already at PSCI
version 1.1:

[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.

So we could go ahead and bump the compatible to "arm,psci-1.0".

Thanks,
Samuel
