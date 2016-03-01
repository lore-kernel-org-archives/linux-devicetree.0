From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Tue, 1 Mar 2016 12:29:15 +0100
Message-ID: <CAGkQfmP5p3ezZwEub2RDW-y--aeJHDBN_oT9K4Wga=YYfBCLqA@mail.gmail.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com> <56D56E95.4030204@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D56E95.4030204-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

2016-03-01 11:27 GMT+01:00 Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>:
> Le 01/02/2016 11:25, Romain Izard a =C3=A9crit :
>> The NAND Flash controller for SAMA5D2 has small differences that mak=
e
>> it impossible to use the existing driver for SAMA5D3. This patchset
>> uses the device tree's compatible string to get those differences,
>> and the code is slightly modified to handle them.
>>
>> Base on linux-mtd-next, commit
>> 15c0be7bec002f9a529dd0966d0db96dde176fd0
>>
>> See previous revisions to apply on the Atmel Linux 4.1 branch.
>>
>> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as ther=
e
>> is no existing SAMA5D2 board with NAND Flash memory (yet).
>
> Brian,
>
> Hi, do we need to resend this series with all the tags collected (aka
> ping ;-)) ?
>

A v4 has already been sent, and Brian has picked patches 1-4, as seen
in: http://article.gmane.org/gmane.linux.drivers.devicetree/155864/

=46or patch #5, it is the update for the sama5d2.dtsi to describe the
NAND controller. Perhaps you can take it on your tree for 4.6, it
won't change anything until a board needs it, either Atmel's SAMA5D2 PT=
C
or another one.

Best regards,
--=20
Romain Izard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
