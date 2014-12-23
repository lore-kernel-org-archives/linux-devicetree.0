From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: Move device-trees into vendor sub-directories
Date: Tue, 23 Dec 2014 08:20:52 -0800
Message-ID: <CAJiQ=7A0ZrNr0+mbHs1xJNDHEJMiG7v69XhEtCyWTYrBtX1zpw@mail.gmail.com>
References: <1419290863-19788-1-git-send-email-abrestic@chromium.org> <CAGVrzcZPODEbQBF8Z+_r-6H3A_S-4Mi=1ALBf87ZmEngWzDpyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGVrzcZPODEbQBF8Z+_r-6H3A_S-4Mi=1ALBf87ZmEngWzDpyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 23, 2014 at 8:07 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2014-12-22 15:27 GMT-08:00 Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
>> Move the MIPS device-trees into the appropriate vendor sub-directories.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  arch/mips/Makefile                                 |  2 +-
>>  arch/mips/boot/dts/Makefile                        | 33 ++++++++--------------
>>  arch/mips/boot/dts/bcm/Makefile                    |  9 ++++++
>>  arch/mips/boot/dts/{ => bcm}/bcm3384.dtsi          |  0
>>  arch/mips/boot/dts/{ => bcm}/bcm93384wvg.dts       |  0
>
> Let's use brcm here, which is the DT vendor prefix, or go full name
> with broadcom, there has been enough debate in the past about this ;)

IOW we want to see:

arch/mips/boot/dts/brcm/bcm3384.dtsi
arch/mips/boot/dts/brcm/bcm93384wvg.dts

right?  "brcm" for the vendor name, "bcmXXXX[X[X]]" for the chip
names, just like the compatible strings.

BTW, this will again create an ordering dependency with respect to my
Generic BMIPS patch series.  If Ralf can take Andrew's updated patches
ASAP (since they're straightforward renamings) it will make it easier
to add/rename platforms without having to fix up merge conflicts.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
