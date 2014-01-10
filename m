From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts:  add <dt-bindings/> symlink
Date: Fri, 10 Jan 2014 19:46:57 +0900
Message-ID: <52CFCFA1.4080405@samsung.com>
References: <1389346197-5127-1-git-send-email-pankaj.dubey@samsung.com>
 <20140110102226.63f5bf30@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140110102226.63f5bf30-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/10/2014 06:22 PM, Lothar Wa=C3=9Fmann wrote:
> Hi,
>
> Pankaj Dubey wrote:
>> Add symlink to include/dt-bindings from arch/arm64/boot/dts/include/=
 to
>> match the ones in ARM architectures so that preprocessed device
>> tree files can include various useful constant definitions.
>>
>> See commit c58299a (kbuild: create an "include chroot" for DT bindin=
gs)
>> merged in v3.10-rc1 for details.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/include/dt-bindings |    1 +
>>   1 file changed, 1 insertion(+)
>>   create mode 120000 arch/arm64/boot/dts/include/dt-bindings
>>
>> diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/bo=
ot/dts/include/dt-bindings
>> new file mode 120000
>> index 0000000..08c00e4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/include/dt-bindings
>> @@ -0,0 +1 @@
>> +../../../../../include/dt-bindings
>> \ No newline at end of file
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
I just created symlink file to "include/dt-bindings", and when created=20
patch it is showing this line
at the end of patch. I do not have much idea why this came in patch? Bu=
t=20
when I checked similar patches
it looks like it is required.
> Lothar Wa=C3=9Fmann

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
