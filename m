From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 1/2] MIPS: Move device-trees into vendor sub-directories
Date: Tue, 23 Dec 2014 08:41:23 -0800
Message-ID: <CAL1qeaH6d5DSU9UgnS4eGvFcAJXEw2iXX8czkCFd8ogdNDLEvQ@mail.gmail.com>
References: <1419290863-19788-1-git-send-email-abrestic@chromium.org>
	<CAGVrzcZPODEbQBF8Z+_r-6H3A_S-4Mi=1ALBf87ZmEngWzDpyw@mail.gmail.com>
	<CAJiQ=7A0ZrNr0+mbHs1xJNDHEJMiG7v69XhEtCyWTYrBtX1zpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiQ=7A0ZrNr0+mbHs1xJNDHEJMiG7v69XhEtCyWTYrBtX1zpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arend van Spriel <arend@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 23, 2014 at 8:20 AM, Kevin Cernekee <cernekee@gmail.com> wrote:
> On Tue, Dec 23, 2014 at 8:07 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> 2014-12-22 15:27 GMT-08:00 Andrew Bresticker <abrestic@chromium.org>:
>>> Move the MIPS device-trees into the appropriate vendor sub-directories.
>>>
>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>> ---
>>>  arch/mips/Makefile                                 |  2 +-
>>>  arch/mips/boot/dts/Makefile                        | 33 ++++++++--------------
>>>  arch/mips/boot/dts/bcm/Makefile                    |  9 ++++++
>>>  arch/mips/boot/dts/{ => bcm}/bcm3384.dtsi          |  0
>>>  arch/mips/boot/dts/{ => bcm}/bcm93384wvg.dts       |  0
>>
>> Let's use brcm here, which is the DT vendor prefix, or go full name
>> with broadcom, there has been enough debate in the past about this ;)
>
> IOW we want to see:
>
> arch/mips/boot/dts/brcm/bcm3384.dtsi
> arch/mips/boot/dts/brcm/bcm93384wvg.dts
>
> right?  "brcm" for the vendor name, "bcmXXXX[X[X]]" for the chip
> names, just like the compatible strings.

Ok, I've renamed the "bcm" directory to "brcm" as you've described above.

> BTW, this will again create an ordering dependency with respect to my
> Generic BMIPS patch series.  If Ralf can take Andrew's updated patches
> ASAP (since they're straightforward renamings) it will make it easier
> to add/rename platforms without having to fix up merge conflicts.

Yes, I'd like to get these in -next ASAP as I have work based on them
as well.  V2 incoming...
