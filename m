From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] mtd: part: add generic parsing of linux,part-probe
Date: Sat, 15 Aug 2015 13:57:48 +0200
Message-ID: <55CF293C.5000304@openwrt.org>
References: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
 <20150518224910.GU11598@ld-irv-0074>
 <CAOiHx=k9SuwEYZ10P8kmHF25P2O2r6+9gaBTSQ6kXFxfDnzL=w@mail.gmail.com>
 <20150519230900.GB11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519230900.GB11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathieu Olivari <mathieu-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Let's get this discussion back on track ;-)

On 20.05.2015 01:09, Brian Norris wrote:
> On Tue, May 19, 2015 at 10:25:58AM +0200, Jonas Gorski wrote:
>> On Tue, May 19, 2015 at 12:49 AM, Brian Norris
>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Sun, May 17, 2015 at 07:35:12PM +0200, Hauke Mehrtens wrote:
>>>> --- a/drivers/mtd/mtdpart.c
>>>> +++ b/drivers/mtd/mtdpart.c
> ...
>>>> @@ -718,6 +719,35 @@ void deregister_mtd_parser(struct mtd_part_parser *p)
>>>> +static const char * const *of_get_probes(struct device_node *dp)
>>>> +{
> ...
>>>> +     cp = of_get_property(dp, "linux,part-probe", &cplen);
>>>
>>> I see this is not property is not documented in the first place. If
>>> we're going to make it generically useful, we definitely need to
>>> document it, including what the supported partition probe names are.
>>>
>>> I'm also kind of ambivalent on this point, but I might as well ask: does
>>> the 'linux,...' naming make sense? We're not really supposed to be
>>> putting pure software information in the device tree, let alone info
>>> that's specific to Linux. I see how the partition parser could be (and
>>> should be, really) considered OS-agnostic, though, and might deserve a
>>> spot in the DT, at least if it's not safe to run arbitrary partition
>>> parsers on all MTDs.
>>
>> As long as we use the direct parser names, we should keep the linux prefix.
>>
>> Actually a common issue is that many firmware partition tags aren't
>> capable of describing the full flash layout, so partition parsers have
>> to "cheat" and make a lot of assumptions, e.g. the location and the
>> size of the bootloader. So wo would need to have a mix of static
>> partitions (bootloader, bootloader config, calibration data) and
>> dynamic ones (kernel, rootfs, overlay).
> 
> OK, so this much seems to suggest that we can't really determine a set of
> parsers that apply to all MTDs, and we have to stick with some kind of
> platform information for choosing a set of custom parsers.

We even want per-device information, because device manufacturers
might "port" image tags to other architectures, e.g. Linksys used the trx
partition table originally from bcm47xx also for ar71xx devices, wich
normally uses u-boot uImage (+ cmdlineparts).

>> So ideally we would pass the
>> static partitions as device tree nodes, and let the partition parsers
>> then be applied to partitions instead of the full mtd device. This
>> would also work as a safeguard against mis-guessing important
>> partitions like calibration data which aren't recoverable in case they
>> get overwritten.
>>
>> So my first Idea would be having something like this:
> [...]
> 
> Not commenting on this portion yet. I'll read the others' comments
> later, but I think that's veering a little off the track of the original
> problem.
> 
>>>> @@ -754,6 +784,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>>>>  {
>>>>       struct mtd_part_parser *parser;
>>>>       int ret = 0;
>>>> +     const char *const *types_of = NULL;
>>>> +
>>>> +     if (data && data->of_node) {
>>>> +             types_of = of_get_probes(data->of_node);
>>>> +             if (types_of != NULL)
>>>> +                     types = types_of;
>>>> +     }
>>>
>>> I'm not sure I really like the semantics here. This means that the
>>> device tree can override all Linux defaults. So we can't, for instance,
>>> have the cmdline parser override all other selections (e.g., for
>>> debugging), or make sure that 'ofpart' is available for all MTDs.
>>
>> Letting the device tree override cmdline parsers is actually a valid
>> use case for OpenWrt, where the bootloader passes a
>> different/incompatible partition layout through mtdparts than what is
>> actually used by the firmware on flash.
> 
> That seems like a sucky firmware, and not an argument for changing how
> Linux works. Can't you override their cmdline somehow?

Sometimes yes, sometimes no. If the bootloader doesn't touch the dtb,
there is no issue, but e.g. ipq806x bootloaders will overwrite any pre-
existing bootargs in the chosen node with the bootloader one.

At OpenWrt we do have hacks like "bootargs-replace" and "bootargs-extend",
but this doesn't feel very clean either.

And sometimes you even want a mix of them, e.g. on devices with support
for multiple images you want the information from which image it booted
(which is usually exposed through bootargs), but still use your own
proprietary layout. Or the bootloader passes the ethernet mac addresses
through the commandline, etc.

>> If we want to make it overrideable for debug purposes adding a
>> commandline parameter like
>> mtdparser="<mtdname>:<parser1[,parser2,...]>" might be a better
>> option.
>>
>>>>
>>>>       if (!types)
>>>>               types = default_mtd_part_types;
>>>
>>> In fact, I don't really like this existing hunk either ^^^. It has the
>>> same effect, of killing things like cmdlinepart, which should be
>>> available on all MTDs.
>>
>> default_mtd_part_types contains cmdline part, so it should be
>> available unless they pass their own parsers.
> 
> Right, but
> (1) I don't like each driver deciding which parsers are available;
> platform setup should be independent of the flash/controller driver, and
> (2) the cmdline partition parser and ofpart parsers should always be
> available for use on all drivers; to break that is a bug, IMO.
> 
> I think Hauke brought up a similar point to (1).

Right. For (1), I think adding a way for specifying parsers to use through
commandline for non-OF and a OF-way would be the way to get away from a
driver centric assignment.

(2) is a lot harder, because we also have to think about precedence. If
there are both cmdline and ofpart parititions, which one should trump? And
what about the platform specific parser(s)?

Also I noticed a thing which I don't like about the current "linux,part-probe"
(or my proposed mtdparsers commandline flag) at all: we define parser names,
but we should define partition table names, which are well defined in a
document somewhere.

So maybe for the of-part, maybe we could make it "similar" to the stdout
thing:

aliases {
	sflash0 = &sflash0;
	sflash1 = &sflash1;
	nand = &nand;
};

chosen {
	...
	mtd-partition-table-type = "nand:fixed-layout",
				   "sflash0:commandline",
				   "sflash1:bcm47xx-trx";
};

Which makes it also clear that this is configuration data.

The commandline version could be then mtdtabletypes="<mtdname>:<table-type>[;...]"

And then translate the table type names to their parser names (maybe parsers might
also support more than one partition table type).

This would make a "clean" separation from the linux-internal parser names.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
