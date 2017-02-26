From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v5 6/7] arm64: dts: allwinner: add Allwinner
 H5 .dtsi
Date: Sun, 26 Feb 2017 17:00:28 +0800
Message-ID: <CAGb2v67BvVip+CX+HzAf7jAHxpL_EBtbxLxERMHRVv2+zE5Gcg@mail.gmail.com>
References: <20170226011956.53581-1-icenowy@aosc.xyz> <20170226011956.53581-7-icenowy@aosc.xyz>
 <20170226085553.b6o6mv7ibe5op4dg@localhost>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRNSZLCQKGQEPIPS3XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170226085553.b6o6mv7ibe5op4dg@localhost>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 26, 2017 at 4:55 PM, Rask Ingemann Lambertsen
<rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org> wrote:
> On Sun, Feb 26, 2017 at 09:19:55AM +0800, Icenowy Zheng wrote:
>> From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>
>> The Allwinner H5 SoC is pin-compatible to the H3 SoC, but uses
>> Cortex-A53 cores instead.
>> Based on the now shared base .dtsi describing the common peripherals
>> describe the H5 specific nodes on top of that.
>> That symlinks in the sunxi-h3-h5.dtsi from the arch/arm tree.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> [Icenowy: add H5 pinctrl compatible, and changes for my h3-h5 dtsi
>>  refactor, commit message change to met new arm64 naming scheme,
>
> s/change to met/change to meet/ or s/change to met/changed to meet/ ?
>
>> diff --git a/arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi b/arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi
>> new file mode 120000
>> index 000000000000..036f01dc2b9b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi
>> @@ -0,0 +1 @@
>> +../../../../arm/boot/dts/sunxi-h3-h5.dtsi
>> \ No newline at end of file
>
> But it's missing more than just a newline, isn't it? Shouldn't it read

This is a symbolic link.

>
> #include <../../../../arm/boot/dts/sunxi-h3-h5.dtsi>

This won't work directly with the split out device tree repository,
which has a slightly different layout.

ChenYu

>
> ?
>
> --
> Rask Ingemann Lambertsen
