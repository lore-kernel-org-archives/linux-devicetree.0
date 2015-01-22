From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND controller
 of hisilicon hip04 Soc
Date: Thu, 22 Jan 2015 11:27:01 +0800
Message-ID: <54C06E05.9050205@hisilicon.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com> <20141130090853.GG3608@norris-Latitude-E6410> <548987D3.3060407@gmail.com> <20141217062333.GD7112@brian-ubuntu> <5491638B.5090403@gmail.com> <20150113041701.GM9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150113041701.GM9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Iwo Mergler <Iwo.Mergler-/K5RfY/kUqoaXkdz0Xzl5EEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

Very sorry for late, I made tests again and also had a talk with the
NAND controller hardware colleague. Please find my reply below.

On 2015/1/13 12:17, Brian Norris wrote:
> Following up on this last comment from last year's thread:
>=20
> On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
>> On 2014=E5=B9=B412=E6=9C=8817=E6=97=A5 14:23, Brian Norris wrote:
> [...]
>>>> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrec=
t
>>>> despite read success
>>>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
>>>>
>>>> The reason for above failure is that:
>>>> In ECC mode, when rewriting page data to NAND flash, the NAND
>>>> controller will also produce ECC code and write them to NAND flash
>>>> as well. So when we read data from NAND flash, there is no need to
>>>> correct the error bit. We read what we write to the flash.
>>>
>>> BTW, your explanation doesn't seem quite right. The problem is that
>>> even though mtd_read() didn't report errors, the data doesn't match
>>> what's written. It's not that there was "no need to correct the err=
or
>>> bit".
>>
>> Maybe I did not express clearly. In the nandbiterrs test, firstly
>> write data to flash with ECC code in oob area, then change some bits
>> and rewrite data to flash with old ECC code in oob area, at last rea=
d
>> data out with ECC to test if the "error bits" can be corrected. My
>> explanation is that in rewriting process NAND controller also produc=
es
>> new ECC code of the data and write both data and new ECC code to fla=
sh.
>> So in next step we will get what was writen without "correction".
>=20
> But we should at least get an -EBADMSG return status, right? If you'r=
e
> "rewriting" the data, this should result in two sets of data written =
on
> top of each other, which (depending on the flash layout charecteristi=
cs)
> might turn up as a kind of logical AND of all the data+OOB. This is
> "probably" not correctable.
>=20
> But that last "probably" leaves room for the possibility you mentione=
d,
> I guess; that the ECC code is just correcting the data to look like t=
he
> second set of (intentionally) erroneous data.

I made testes again in 1bit/ECC and 16bit/ECC modes using 2K(page)+64B(=
oob)
NAND flash. here are the logs, I also printed ECC code in OOB area.

Results are:
1. in 16bit/ECC, it will return -EBADMSG as the ECC codes have been bro=
ken.
2. in 1bit/ECC, it will not reture -EBADMSG because a hardware design p=
roblem.
   I will explain the detail below.

Test logs:
1. in 16bit/ECC(print ECC codes):

/home # insmod mtd_nandbiterrs.ko dev=3D2 page_offset=3D1 seed=3D110 mo=
de=3D0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
mtd_nandbiterrs: MTD device: 2
mtd_nandbiterrs: MTD device size 8388608, eraseblock=3D131072, page=3D2=
048, oob=3D64
mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
mtd_nandbiterrs: Using page=3D1, offset=3D2048, eraseblock=3D0
mtd_nandbiterrs: incremental biterrors test
mtd_nandbiterrs: write_page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec=
 cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: rewrite page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec=
 cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: read_page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec=
 cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
mtd_nandbiterrs: Inserted biterror @ 0/5
mtd_nandbiterrs: Inserted biterror @ 1024/2
mtd_nandbiterrs: rewrite page

ECC code:(the ECC code in NAND controller buffer, which will be wrote t=
o NAND flash)
11 70 40 2e ab 6e 17 34 1d 2d 2b b0 51 a4 c1 af 05 a6 44 12 25 f1 10 49=
 7d 0b bd 95 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: read_page

ECC code:
10 60 40 00 88 0e 10 20 05 29 2a b0 51 80 80 0e 01 26 04 10 00 40 00 48=
 4d 01 15 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: error: read failed at 0x800
mtd_nandbiterrs: After 1 biterrors per subpage, read reported error -74
mtd_nandbiterrs: finished successfully.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error

2. in 1bit/ECC(print ECC codes):
/home # insmod mtd_nandbiterrs.ko dev=3D2 page_offset=3D1 seed=3D110 mo=
de=3D0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
mtd_nandbiterrs: MTD device: 2
mtd_nandbiterrs: MTD device size 8388608, eraseblock=3D131072, page=3D2=
048, oob=3D64
mtd_nandbiterrs: Device uses 4 subpages of 512 bytes
mtd_nandbiterrs: Using page=3D1, offset=3D2048, eraseblock=3D0
mtd_nandbiterrs: incremental biterrors test
mtd_nandbiterrs: write_page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: rewrite page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: read_page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
mtd_nandbiterrs: Inserted biterror @ 0/5
mtd_nandbiterrs: Inserted biterror @ 512/6
mtd_nandbiterrs: Inserted biterror @ 1024/2
mtd_nandbiterrs: Inserted biterror @ 1536/6
mtd_nandbiterrs: rewrite page

ECC code:(the ECC code in NAND controller buffer, which will be wrote t=
o NAND flash)
aa aa 59 aa aa 96 aa aa 66 aa aa 96

mtd_nandbiterrs: read_page

ECC code:
aa aa 19 aa aa 96 aa aa 26 aa aa 96

mtd_nandbiterrs: Read reported 2 corrected bit errors
mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Error: page offset 0, expected 23, got 03
mtd_nandbiterrs: Error: page offset 512, expected 69, got 29
mtd_nandbiterrs: Error: page offset 1024, expected 06, got 02
mtd_nandbiterrs: Error: page offset 1536, expected 4c, got 0c
mtd_nandbiterrs: ECC failure, read data is incorrect despite read succe=
ss
insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error

Reason about above 1bit/ECC test result:
As the log above, in rewriting process, the ECC code should be "aa aa 5=
9 aa aa 96 aa aa 66 aa aa 96",
however actually it writes ECC code "aa aa 19 aa aa 96 aa aa 26 aa aa 9=
6" to
flash. ECC code of the first and third 512B of 2k page in flash are "aa=
 aa 19"
which each has 1bit error in ECC code. Taking the first 512B as an exam=
ple,
there are 2bit errors: 1bit in page data and 1bit in related ECC code.
It can not correct this kind of 2bit errors in 1bit/ECC mode in this NA=
ND
controller, however, it will trigger a correctable interrupt. As a resu=
lt,
software can not find this 1bit error in page data.

This is a hardware problem of this NAND controller.
I plan to remove the 1bit/ECC mode support in patch of next version.

>=20
>>> I'd recommend digging a little more to figure out what's wrong here=
=2E You
>>> might need to instrument the nandbiterrs test. This is possibly
>>
>> Thanks, I will do it.
>>
>>> highlighting a driver bug [1].
>>>
>>> Brian
>>>
>>> [1] Besised simply that you didn't implement write_page_raw(). The
>>> default nand_write_page_raw() implementation looks just like your
>>> non-raw version.
>>
>> Yes. In ECC mode, as the NAND controller must write page as a whole
>> with ECC code, the default nand_write_page_raw() looks just like
>> non-raw version.
>=20
> Are you saying you cannot implement the raw() hooks for this IP? Or j=
ust
> that you haven't yet? The latter is probably OK for now (I'd recommen=
d
> doing this, or at least mark a TODO in the code), but the former is a
> little disturbing.

The function of raw() hooks is just writing the page data to flash, is =
this right?
In none ECC mode, it can write page date alone to flash. But in ECC mod=
e, NAND
controller will produce related ECC code automatically, write page data=
 and ECC code
to flash. In ECC mode, it can not write page date alone to flash for th=
is NAND controller.

As a result, the nandbiterrs test can not pass.

I don't know if I have explained these two problems clearly. If still h=
ave something
confused, please let me know.

>=20
> Brian

Many thanks for your comments!
Zhou Wang

>=20
> .
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
