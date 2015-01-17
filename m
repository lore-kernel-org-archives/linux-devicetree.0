From: Orson Zhai <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: dts: Add support for Spreadtrum SC9836 SoC
 in dts and Makefile
Date: Sat, 17 Jan 2015 16:47:25 +0800
Message-ID: <CA+H2tpFenKzBEvkaHOh7shX7GaYyGFc2CbBTDxgSL9=Wq1Q++g@mail.gmail.com>
References: <1421402411-3479-1-git-send-email-chunyan.zhang@spreadtrum.com>
	<1421402411-3479-4-git-send-email-chunyan.zhang@spreadtrum.com>
	<20150116103558.GD21809@leverpostej>
	<CA+H2tpGPKc8Gu=s+d4PnO=Wp_Uv=o338hxj_1opPRkZ3KZH+rw@mail.gmail.com>
	<20150116140926.GB22569@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150116140926.GB22569@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org, Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org" <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "jslaby-AlSwsSmVLrQ@public.gmane.org" <jslaby-AlSwsSmVLrQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "florian.vaussard-p8DiymsW2f8@public.gmane.org" <florian.vaussard-p8DiymsW2f8@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>an
List-Id: devicetree@vger.kernel.org

On Fri, Jan 16, 2015 at 10:09 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Jan 16, 2015 at 12:49:20PM +0000, Orson Zhai wrote:
>> Hi, Mark,
>>
>> On Fri, Jan 16, 2015 at 6:35 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>[...]
>>
>>  It returns "status busy" after I type the command below.
>
> Is this while other CPUs are active, or after you've hotplugged out all
> other CPUs? The latter is expected, but the former is not.
>
> Are you able to hotplug CPU0 out and back in while other CPUs are
> active

Yes, I have just tested again and confirm that cpu0 could be
turned on/off when one of the other 3 CPUs was active.

>
> [...]
>
> For this bus you could instead use addresses relative to the bus inside,
> rather than absolute addresses,

Do you mean something like  apb@0 {...} apb@1 {...} ?

> or you could have:
>
> ranges = <0x0 0x70000000 0x0 0x70000000 0x0 0x10000000>;
>
> [...]
>>
>> This initial patch is picked up from a very big dt file.
>> There are several apb buses in this chip.
>
> At the same level us the bus hierarchy?
>
These buses are led by some bus matrix to different areas.
But I'd like treat them simply at same level.
Is it right to do that?

>> So I use apb@starting-address to separate them.
>> But I remember another rule that the @address needs to equal  first
>> address in property reg array.
>> Do I have to delete @7000000 as well if i delete reg line?
>
> Hmm. I'm not too keen on encoding a reg or unit-address here, because
> the control interface of the bus isn't at that address. If we want to
> add that later then the reg would be different in those cases. Given
> there's no control interface here, there shouldn't be a reg or
> unit-address.
>

Do you mean something like

   ap-ahb { ... };
   aon-ahb { ... };

without using @xxxx ?

   Thanks, Orson

> Just ensure that the name before the unit-address is unique.
>
> Thanks,
> Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
