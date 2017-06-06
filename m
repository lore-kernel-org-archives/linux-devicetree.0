From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Tue, 6 Jun 2017 09:12:23 -0700
Message-ID: <5936D467.4030508@gmail.com>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
 <593657AF.8050208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <593657AF.8050208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Holm Rauchfuss <holm.rauchfuss-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/06/17 00:20, Frank Rowand wrote:
> On 06/05/17 05:59, Stefani Seibold wrote:
>> From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
>>
>> This patch enables external references for symbols which are not
>> exported by the current device tree. For example
>>
>> // RASPI example (only for testing)
>> /dts-v1/;
>> /plugin/;
>>
>> / {
>>     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
>>
>>     fragment@0 {
>>         target-path = "/soc/i2s@7e203000";
>>         __overlay__ {
>>             #address-cells = <0x00000001>;
>>             #size-cells = <0x00000001>;
>>             test = "test";
>>             timer = <&timer>;
>>         };
>>     };
>>
>>     __external_symbols__ {
>>         timer = "/soc/timer@7e003000";
>>     };
>> };
> 
> My hope is that the dtc compiler will stop supporting specification of the
> __symbols__ node in dts source, and only generate it automatically in the dtb.
> That change to dtc would not allow any node name specified in a dts to begin
> with an underscore.  Thus node __external_symbols__ would not be allowed.
> 
> 
>>
>> The "timer" symbol is not exported by the RASPI device tree, because it is
>> missing in the __symbols__ section of the device tree.
>>
>> In case of the RASPI device tree this could be simple fixed by modifing
>> the device tree source, but when the device tree is provided by a closed
>> source BIOS this kind of missing symbol could not be fixed.
> 
> Is there a real example of this issue, or is this a theoretical concern?
> If this is a real example, we should be discouraging such behavior.
> 
> The suggestion by Pantelis should work, but that is just a hack to get
> you out of a bad situation, not a good practice.

Digging a little bit deeper into the suggestion by Pantelis, I don't like
that approach either.  It is still rather hacky.

> 
>>
>> An additional benefit is to override a (possible broken) symbol exported
>> by the currect live device tree.
>>
>> The patch is based and tested on linux 4.12-rc3.
>>
>> Signed-off-by: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
>> ---
>>  drivers/of/overlay.c  | 19 +++++++++++++++++++
>>  drivers/of/resolver.c | 27 ++++++++++++++++++++++-----
>>  2 files changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 7827786718d8..de6516ea0fcd 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
> 
> < snip >
> 
> -Frank
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
