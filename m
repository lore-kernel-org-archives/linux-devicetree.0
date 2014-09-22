From: =?UTF-8?B?SmFudXN6IFXFvHlja2k=?= <j.uzycki-9tnw74Q4ehaHKKo6LODCOg@public.gmane.org>
Subject: Re: Adding selftest testdata dynamically into live tree
Date: Mon, 22 Sep 2014 20:05:37 +0200
Message-ID: <542064F1.4000601@elproma.com.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi.

On 3.17.0-rc6-next-20140922+ with CONFIG_OF_SELFTEST enabled
zImage is recreated every time I call "make" despite I've not done
any change in source files and zImage was the same.
This is caused by the rm line:
   CALL    scripts/checksyscalls.sh
   CHK     include/generated/compile.h
   DTC     drivers/of/testcase-data/testcases.dtb
   DTB     drivers/of/testcase-data/testcases.dtb.S
   AS      drivers/of/testcase-data/testcases.dtb.o
   LD      drivers/of/of_selftest.o
   LD      drivers/of/built-in.o
rm drivers/of/testcase-data/testcases.dtb.S 
drivers/of/testcase-data/testcases.dtb
   LD      drivers/built-in.o
   LINK    vmlinux
   LD      vmlinux.o

best regards
Janusz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
