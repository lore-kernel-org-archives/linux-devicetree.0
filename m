From: "Rosenberger, Philipp" <Philipp.Rosenberger@xse.de>
Subject: Re: [PATCH] of_mtd: Fix header file include guard
Date: Fri, 29 Nov 2013 09:22:44 +0000
Message-ID: <52985D12.6060901@xse.de>
References: <52972EEE.8070704@xse.de>
 <20131129081113.GA20013@norris.computersforpeace.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131129081113.GA20013@norris.computersforpeace.net>
Content-Language: de-DE
Content-ID: <BBDCEA37ABFAE644B9ABD6ED275BD942@xse.local>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

Thanks for your replay and all the hints about submitting the correct
way. Is it ok to paste the full git format-patch output like this?

>From a2e84efe0d5335547ca3e6c0a8bf8a026b0f2353 Mon Sep 17 00:00:00 2001
From: Philipp Rosenberger <philipp.rosenberger@xse.de>
Date: Thu, 28 Nov 2013 12:36:52 +0100
Subject: [PATCH] of_mtd: Fix header file include guard

It seems the include guard was copied from of_net.h.

Signed-off-by: Philipp Rosenberger <philipp.rosenberger@xse.de>
---
 include/linux/of_mtd.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index 6f10e93..cb32d9c 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -7,7 +7,7 @@
  */

 #ifndef __LINUX_OF_MTD_H
-#define __LINUX_OF_NET_H
+#define __LINUX_OF_MTD_H

 #ifdef CONFIG_OF_MTD

--
1.7.9.5

On 29.11.2013 09:11, Brian Norris wrote:
> + device tree guys
>
> Hi Grant/Rob,
>
> It looks like this header is technically owned by you guys. Once we have
> a proper submission, should I merge this sort of change through MTD, or
> do one of you want to take care of it?
>
> Hi Philpp,
>
> Thanks for the patch! There are a few things to fix up though.
>
> On Thu, Nov 28, 2013 at 11:53:39AM +0000, Rosenberger, Philipp wrote:
>> It seems the include guard was copied from of_net.h.
>
> Good catch.
>
> Note that all patches require a "Signed-off-by" line in the patch
> description, to signify (among other things) that this is your work and
> that you are submitting it under the GPLv2 license. See
> Documentation/SubmittingPatches (esp. point 12).
>
>> ---
>>  include/linux/of_mtd.h |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
>> index 6f10e93..cb32d9c 100644
>> --- a/include/linux/of_mtd.h
>> +++ b/include/linux/of_mtd.h
>> @@ -7,7 +7,7 @@
>>   */
>>
>>  #ifndef __LINUX_OF_MTD_H
>> -#define __LINUX_OF_NET_H
>> +#define __LINUX_OF_MTD_H
>>
>>  #ifdef CONFIG_OF_MTD
>>
>> -- 1.7.9.5
>>
>> XS Embedded GmbH
>> Peterzeller Strasse 8
>> D-78048 Villingen - Schwenningen
>>
>> Telefon +49 (7721) 4060 - 428
>> Fax     +49 (7721) 4060 - 499
>>
>> www.xse.de
>> Philipp.Rosenberger@xse.de
>>
>> :::::::::: based.on.visions ::::::::::
>>
>>
>> XS Embedded GmbH
>> Gesch=E4ftsf=FChrung: Michael Maier, Rainer Oder
>>
>> Handelsregister: Amtsgericht Freiburg i.Br., HRB 705237
>> Sitz der Gesellschaft: Peterzeller Strasse 8, 78048 Villingen-Schwenning=
en
>> USt-Id Nummer: DE268786819
>>
>> Confidentiality Notice: This e-mail message, including any attachments, =
is for the sole use of the intended recipient(s) and may contain confidenti=
al and privileged information. Any unauthorized review, use, disclosure or =
distribution is prohibited. If you are not the intended recipient, please c=
ontact the sender by return e-mail and destroy all copies of the original m=
essage.
>
> This confidentiality notice is incongruous with sending patches to a
> public mailing list, for inclusion in an open source project. This
> message (combined with a lack of a Signed-off-by) means we cannot take
> your patch. Please remove this footer and resubmit, with a CC to
> linux-mtd@infradead.org and devicetree@vger.kernel.org.
>
> Thanks,
> Brian
>
>

Thank you for this hint. I forgot that the mailserver append this
footer. I hope now there is no company footer anymore.

Best regards

Philipp




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
