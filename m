From: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Subject: Re: [PATCHv0] arm: mvebu: add .dts file for Synology DS213j
Date: Mon, 27 Oct 2014 03:42:42 +1000
Message-ID: <544D3292.4090805@killerwolves.net>
References: <3d0cc6de9ea5506d5fb201129ad277e57d0cdfc8.1414268057.git.arno@natisbad.org> <20141025221611.GA14620@lunn.ch> <544CB246.2030607@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544CB246.2030607-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/10/14 18:35, Ben Peddell wrote:
> On 26/10/14 08:16, Andrew Lunn wrote:
>> What does seem odd is the Reboot, FIS, etc, mtd partition names. 
>> Is there redboot installed at all?
> 
> I think the RedBoot partition names are carried over from the older
> PPC-based Synology DiskStations.  As far as I can tell, the FIS 
> directory partition is never referenced by the Synology kernel or
> bootloader, though the information in it does match what is used by
> the kernel, and it appears it may be used by the Synology updater.

I stand corrected here - on the Marvell Armada XP and Armada 370
DiskStations, the FIS directory (RedBoot parts) does appear to be
used by the Synology kernel.

If I'm reading it right, unless otherwise configured, the RedBoot
partition maps will take precedence over the device tree partition 
maps when CONFIG_MTD_REDBOOT_PARTS is enabled.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
