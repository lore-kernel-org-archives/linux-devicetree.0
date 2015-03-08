From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Sun, 8 Mar 2015 12:18:39 +0100
Message-ID: <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	<CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
	<20150308005720.GF12966@brian-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150308005720.GF12966@brian-ubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 March 2015 at 01:57, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> 3. I was told that there were only 2 or 3 chips that were released wi=
th
> a v6.1 NAND controller, and BCM4708 wasn't one of them. Apparently I =
was
> told wrong... I'll have to see if there are any other quirks we shoul=
d
> be accounting for.

Please note I'm speaking about 6.01, not 6.10. Maybe it make a differen=
ce?

Buffalo WZR-600DHP2 (BCM47081)
[    0.325732] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    4.838105] bcma: bus0: Found chip with id 53010, rev 0x00 and packa=
ge 0x02

Buffalo WZR-1750DHP (BCM4708)
[    0.326823] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    6.674288] bcma: bus0: Found chip with id 53010, rev 0x00 and packa=
ge 0x02

Netgear R6250 V1 (BCM4708)
[    0.326248] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
[    8.721335] bcma: bus0: Found chip with id 53010, rev 0x00 and packa=
ge 0x02

Netgear R8000 (BCM4709)
[    0.241961] bcma: bus0: Found chip with id 53010, rev 0x00 and packa=
ge 0x00
[    1.990330] bcm_nand bcma0:18: NAND Controller rev 6.01

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
