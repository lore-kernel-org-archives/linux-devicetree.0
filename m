From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Fri, 03 Oct 2014 17:06:59 +0200
Message-ID: <542EBB93.108@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141003141102.GJ3895-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/03/2014 04:11 PM, Jason Cooper wrote:
> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.hessel=
barth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>> this is a patch set preparing barebox support for ix4-300d. As usua=
l,
>>> I stumbled upon a few nice-to-haves before actually touching ix4-30=
0d
>>> dts. As it is a mach-mvebu thing, I just added the related mailing
>>> lists instead of each of the DT maintainers.
>>>
>>> First 5 patches consolidate SoC-specific pinctrl nodes to one commo=
n
>>> node in armada-xp.dtsi, compatible overwrites for each SoC, and nod=
e
>>> alias usage for each board. Also, ge{0,1} pinctrl settings are move=
d
>>> to the common node from one board specific node.
>>>
>>> Last 3 patches then use that ge{0,1} pinctrl settings on ix4-300d w=
hich
>>> is vital for bootloader init. During exploration of ix4-300d, I als=
o
>>> found a i2c eeprom that has not been added to the dts, yet. Finally=
,
>>> there is only one 74hc595 on ix4 mainboard while dts property is se=
t
>>> for two.
>>>
>>> I cannot recall in detail what is on that eeprom, but IIRC it is no=
thing
>>> important. Some reg,addr pairs for some init stuff that should have
>>> already been done by stock u-boot. Anyway, adding the node will do =
no
>>> harm.
>>>
>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am not =
in
>>> a hurry. I only compile tested this, so a formal Tested-by from Ben=
oit
>>> for the ix4 and any other Armada XP board would be great.
>>
>> I'm not sure what to test since I only receive some patch from the
>> series of 8. Should I get all 8 or only those you sent me. I'll be
>> able to test during next week.
>
> Did you ever get a chance to test this series?

Uhm, I never prepared a branch for Benoit to test. I have pushed the
patches with Thomas Acked-by's and renamed eeprom node based on
v3.17-rc1 to

https://github.com/shesselba/linux-dove.git devel/mvebu-ix4

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
