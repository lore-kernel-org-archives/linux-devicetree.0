From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND controller
 of hisilicon hip04 Soc
Date: Sun, 25 Jan 2015 16:19:43 +0800
Message-ID: <54C4A71F.30200@hisilicon.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com> <20141130090853.GG3608@norris-Latitude-E6410> <548987D3.3060407@gmail.com> <20141217062333.GD7112@brian-ubuntu> <5491638B.5090403@gmail.com> <20150113041701.GM9759@ld-irv-0074> <54C06E05.9050205@hisilicon.com> <20150122084529.GC3268@brian-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150122084529.GC3268@brian-ubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Iwo Mergler <Iwo.Mergler-/K5RfY/kUqoaXkdz0Xzl5EEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2015/1/22 16:45, Brian Norris wrote:
> Hi Zhou,
>=20
> On Thu, Jan 22, 2015 at 11:27:01AM +0800, Zhou Wang wrote:
>> Very sorry for late, I made tests again and also had a talk with the
>> NAND controller hardware colleague. Please find my reply below.
>=20
> No problem. Glad to hear you followed through on this one, as the
> results were curious.
>=20
>> On 2015/1/13 12:17, Brian Norris wrote:
>>> On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
>>>> On 2014=E5=B9=B412=E6=9C=8817=E6=97=A5 14:23, Brian Norris wrote:
>>> [...]
>>>>>> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorr=
ect
>>>>>> despite read success
>>>>>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> [...]
>> I made testes again in 1bit/ECC and 16bit/ECC modes using 2K(page)+6=
4B(oob)
>> NAND flash. here are the logs, I also printed ECC code in OOB area.
>>
>> Results are:
>> 1. in 16bit/ECC, it will return -EBADMSG as the ECC codes have been =
broken.
>> 2. in 1bit/ECC, it will not reture -EBADMSG because a hardware desig=
n problem.
>>    I will explain the detail below.
>>
>> Test logs:
>> 1. in 16bit/ECC(print ECC codes):
>>
>> /home # insmod mtd_nandbiterrs.ko dev=3D2 page_offset=3D1 seed=3D110=
 mode=3D0
>=20
> ...
>=20
>> mtd_nandbiterrs: error: read failed at 0x800
>> mtd_nandbiterrs: After 1 biterrors per subpage, read reported error =
-74
>=20
> ^^^ Ah, that's what I would expect from a driver that doesn't impleme=
nt
> the raw() functions.
>=20
>> mtd_nandbiterrs: finished successfully.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
>>
>> 2. in 1bit/ECC(print ECC codes):
>> /home # insmod mtd_nandbiterrs.ko dev=3D2 page_offset=3D1 seed=3D110=
 mode=3D0
>=20
> ...
>=20
>> mtd_nandbiterrs: ECC failure, read data is incorrect despite read su=
ccess
>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
>>
>> Reason about above 1bit/ECC test result:
>=20
> ...
>=20
>> It can not correct this kind of 2bit errors in 1bit/ECC mode in this=
 NAND
>> controller, however, it will trigger a correctable interrupt. As a r=
esult,
>> software can not find this 1bit error in page data.
>=20
> IOW, uncorrectable errors are getting reported as corrected bitflips?
> That does sound bad.

Yes, so I will not support 1bit ECC mode in patch of next version.

>=20
>> This is a hardware problem of this NAND controller.
>> I plan to remove the 1bit/ECC mode support in patch of next version.
>=20
> OK, sounds good. 1-bit HW ECC is not really very useful these days
> anyway, if your higher-bit ECC can serve to replace it. Can the ECC
> bytes still fit in the same spare area, though?
>

No, different ECC modes have different ECC layouts in oob area.

>>> Are you saying you cannot implement the raw() hooks for this IP? Or=
 just
>>> that you haven't yet? The latter is probably OK for now (I'd recomm=
end
>>> doing this, or at least mark a TODO in the code), but the former is=
 a
>>> little disturbing.
>>
>> The function of raw() hooks is just writing the page data to flash, =
is this right?
>=20
> Right, just data (and OOB, if calling the _oob_ functions) without an=
y
> ECC parity bytes.
>=20
>> In none ECC mode, it can write page date alone to flash. But in ECC =
mode, NAND
>> controller will produce related ECC code automatically, write page d=
ata and ECC code
>> to flash. In ECC mode, it can not write page date alone to flash for=
 this NAND controller.
>=20
> Perhaps you can switch between ECC mode and non-ECC mode?

I also tried to swith to non-ECC mode to implement raw_write, and it is=
 easy to do this.

But, event we do this, it will bring me little help. The reason to impl=
ement raw_write is to
run mtd_nandbiterrs correctly as the discussion above. However, this NA=
ND controller writes
data and ECC code to flash using different layouts in different modes. =
So we should also read data
and ECC code from flash, change related bits, then rewrite the data and=
 ECC code to flash in none-ECC
mode to run mtd_nandbiterrs. It is not easy to do this.

So my plan is not to implement raw_write hook if this function is just =
used in test.

Many thanks for your reply,
Zhou Wang

=2E
>=20
> At any rate, this isn't absolutely required.
>=20
>> As a result, the nandbiterrs test can not pass.
>>
>> I don't know if I have explained these two problems clearly. If stil=
l have something
>> confused, please let me know.
>=20
> Brian
>=20
> .
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
