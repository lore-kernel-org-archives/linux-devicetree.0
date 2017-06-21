From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 1/5] mtd: partitions: add helper for deleting partition
Date: Wed, 21 Jun 2017 07:33:19 +0200
Message-ID: <CACna6rwsFBFmrdvumBa9H6C0uJuaY=cS-Q+akXsQmgo2dqTFVQ@mail.gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com> <20170526131415.27186-2-zajec5@gmail.com>
 <20170620225007.GB14148@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620225007.GB14148-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 June 2017 at 00:50, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, May 26, 2017 at 03:14:11PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> There are two similar functions handling deletion. One handles single
>> partition and another whole MTD flash device. They share (duplicate)
>> some code so it makes sense to add a small helper for that part.
>>
>> Function del_mtd_partitions has been moved a bit to keep all deleting
>> stuff together.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
>> +/**
>> + * __mtd_del_partition - delete MTD partition
>> + *
>> + * @priv: internal MTD struct for partition to be deleted
>> + *
>> + * This function must be called with the partitions mutex locked.
>> + */
>> +static int __mtd_del_partition(struct mtd_part *priv)
>> +{
>> +     int err;
>> +
>> +     sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
>
> Notably, the above wasn't called in del_mtd_partitions() previously. Is
> that intentional?
>
> As I read the code, we were actually missing this before; either in
> error handling, or on device removal. But in either case, the entire
> device was going to disappear, so the sysfs files would have been
> cleaned up anyway?
>
> Also, is there any chance of double-calling this? I think not, but even
> if there is, it looks like the low-level routines are reslient to
> non-existent files.
>
> I'm mostly thinking out loud here. I think this is a positive change,
> even if it wasn't noted explicitly.

I think that call was missing, however I could make it more clear I'm
adding it. I'll try splitting this change out V7 and add a proper
description.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
