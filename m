From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V3 PATCH 7/7] arm64: configs: enable configs for msm899(2/4)
 basic support
Date: Fri, 21 Oct 2016 01:59:05 -0700
Message-ID: <550f1620-00f4-7963-4c2e-5bed7e304dfc@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-8-git-send-email-jeremymc@redhat.com>
 <20161012133710.GD21050@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161012133710.GD21050@remoulade>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-12 6:37 AM, Mark Rutland wrote:
> On Wed, Oct 12, 2016 at 02:37:34AM -0700, Jeremy McNicoll wrote:
>> From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Given the mimimal hardware support for msm899(2/4) currently.
>> A few config options are needed to allow for continued
>> development and booting.
>>
>> The following are needed for continued development and
>> booting:
>>   -InitRD support
>>   -8x74 pinctrl for serial support
>>   -Enable Global Glock Controller (gcc)
>>
>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm64/configs/defconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index fd2d74d..8601388 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -21,6 +21,7 @@ CONFIG_CGROUP_HUGETLB=y
>>  # CONFIG_NET_NS is not set
>>  CONFIG_SCHED_AUTOGROUP=y
>>  CONFIG_BLK_DEV_INITRD=y
>> +CONFIG_BLK_DEV_RAM=y
>
> We already had BLK_DEV_INITRD, which I presume was sufficient.
>
> Why do we need BLK_DEV_RAM, too?
>

BLK_DEV_RAM , has been removed as it turns out my buildroot ramdisk was 
the cause of this dependancy, it has been since updated.  Everything 
works as expected with a slight change to my kernel cmdline,

   'console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xf991e000 
loglevel=15 ddebug_query debug console=ttyMSM0,115200,n8'



-jeremy


> Thanks,
> Mark
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
