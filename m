From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v2 3/4] ARM: davinci: disable mdio and eth0 in da850.dtsi
Date: Mon, 25 Apr 2016 11:26:19 -0500
Message-ID: <571E452B.7080004@lechnology.com>
References: <1460826020-1256-1-git-send-email-david@lechnology.com>
 <1460826020-1256-4-git-send-email-david@lechnology.com>
 <571E1C13.9050204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571E1C13.9050204-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/25/2016 08:30 AM, Sekhar Nori wrote:
> Hi David,
>
> On Saturday 16 April 2016 10:30 PM, David Lechner wrote:
>> All other devices are disabled by default and not all boards will use
>> these devices, so these should be disabled too..
>>
>> da850-evm.dtb already had status = "okay" for these devices.
>> da850-enbw-cmc.dts did not, so they were added.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> I applied this and other patches in this series. One nit-pick though.
> The commit description should be independently readable and not only as
> continuation of the headline. Even if this means repeating portion of
> the headline. I fixed this for most of the patches in this series. For
> example, for this patch, I have:
>
>      ARM: dts: da850: disable mdio and eth0 in da850.dtsi
>
>      Disable mdio and eth0 in da850.dtsi file. All other
>      devices are disabled by default and not all boards
>      will use these devices, so these should be disabled too.
>
>      da850-evm.dtb already had status = "okay" for these devices.
>      da850-enbw-cmc.dts did not, so they were added.
>
>      Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>      Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>      [nsekhar-l0cyMroinI0@public.gmane.org: commit description updates]
>      Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
>
> Its a minor change and I wont reply to all the patches with the changes
> I made. But I pushed the updated v4.7/dt branch in my tree. Do take a
> look at the commit description there.
>
> Thanks,
> Sekhar
>
>


I had a look at the commits. I'll be sure to follow that advice in the 
future.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
