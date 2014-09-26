From: =?UTF-8?B?SmFudXN6IFXFvHlja2k=?= <j.uzycki-9tnw74Q4ehaHKKo6LODCOg@public.gmane.org>
Subject: Re: Adding selftest testdata dynamically into live tree
Date: Fri, 26 Sep 2014 15:36:42 +0200
Message-ID: <54256BEA.8020004@elproma.com.pl>
References: <542064F1.4000601@elproma.com.pl> <20140926120917.B60B4C40FEB@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140926120917.B60B4C40FEB-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch didn't help. Exactly the same.

best regards
Janusz

W dniu 2014-09-26 14:09, Grant Likely pisze:
> On Mon, 22 Sep 2014 20:05:37 +0200, Janusz U=C5=BCycki <j.uzycki@elpr=
oma.com.pl> wrote:
>> Hi.
>>
>> On 3.17.0-rc6-next-20140922+ with CONFIG_OF_SELFTEST enabled
>> zImage is recreated every time I call "make" despite I've not done
>> any change in source files and zImage was the same.
>> This is caused by the rm line:
>>     CALL    scripts/checksyscalls.sh
>>     CHK     include/generated/compile.h
>>     DTC     drivers/of/testcase-data/testcases.dtb
>>     DTB     drivers/of/testcase-data/testcases.dtb.S
>>     AS      drivers/of/testcase-data/testcases.dtb.o
>>     LD      drivers/of/of_selftest.o
>>     LD      drivers/of/built-in.o
>> rm drivers/of/testcase-data/testcases.dtb.S
>> drivers/of/testcase-data/testcases.dtb
>>     LD      drivers/built-in.o
>>     LINK    vmlinux
>>     LD      vmlinux.o
> Try this change:
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 260bf8acfce9..4555e2e1b4ed 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -269,7 +269,7 @@ cmd_dtc =3D $(CPP) $(dtc_cpp_flags) -x assembler-=
with-cpp -o $(dtc-tmp) $< ; \
>   		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>   	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>  =20
> -$(obj)/%.dtb: $(src)/%.dts FORCE
> +$(obj)/%.dtb: $(src)/%.dts
>   	$(call if_changed_dep,dtc)
>  =20
>   dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
