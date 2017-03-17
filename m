From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 05/23] MAINTAINERS: Add file patterns for dove device
 tree bindings
Date: Fri, 17 Mar 2017 13:02:26 +0100
Message-ID: <CAMuHMdXYX8kk_EKkX7vS9tWG=JvfKcRGCNYDTnYCk_xZCdMYQg@mail.gmail.com>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
 <1489324627-19126-6-git-send-email-geert@linux-m68k.org> <20170313130138.GV11350@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313130138.GV11350-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Mon, Mar 13, 2017 at 2:01 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Sun, Mar 12, 2017 at 02:16:49PM +0100, Geert Uytterhoeven wrote:
>> Submitters of device tree binding documentation may forget to CC
>> the subsystem maintainer if this is missing.
>>
>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>> Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> ---
>> Please apply this patch directly if you want to be involved in device
>> tree binding documentation for your subsystem.
>>
>> v2:
>>   - No changes.
>>
>> Impact on next-20170310:
>>
>> +Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
>> +Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
>> +Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
>> +Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (maintainer:ARM/Marvell Dove/MV78xx0/Orion SOC support)
>>  Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>>  Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>> +linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/Marvell Dove/MV78xx0/Orion SOC support)
>>  devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>>  linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6428d3c82fce9670..ce461fefec6c9463 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1486,6 +1486,7 @@ M:      Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>  M:   Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>  L:   linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>>  S:   Maintained
>> +F:   Documentation/devicetree/bindings/soc/dove/
>
> I'm not opposed to the idea, but I'm not seeing how we can do this
> completely.  What you've added only covers dove soc bindings.  There's
> orion5x, kirkwood, and all the newer mvebu socs.  Not to mention a lot
> of IP blocks we care about that aren't SoC- or Marvell-specific.

There's no orion5x, kirkwood, mvebu, ... under
Documentation/devicetree/bindings/soc.

> The dts files have a much more clear file pattern -> maintainer pairing.
> Perhaps we should make checkpatch smarter?  e.g. compatible strings
> found in changed binding docs are searched for in dts{i} files.  Hits
> are mapped to maintainers.

The DTS files are maintained by a platform maintainer, while my patch
series was about Linux kernel subsystem maintainers.

In this particular case both maintainers are the same, but this is not true in
general.  Hence deriving a platform maintainer from a Linux subsystem specific
binding document is the wrong way around.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
