From: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v7 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
Date: Wed, 6 Jul 2016 18:01:39 -0700
Message-ID: <CACgAJHzoRwfvnGuKLpymLQ2+FNjxZhfg2YnxHyP3CndrjAQapw@mail.gmail.com>
References: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
 <1467850045-10584-2-git-send-email-ttnguyen@apm.com> <1467850751.8360.56.camel@perches.com>
 <CACgAJHyvusvRPKNaxHLFK=gWw2UUtjV80H175eRu6EieutxNiw@mail.gmail.com> <1467852224.8360.60.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467852224.8360.60.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Wed, Jul 6, 2016 at 5:43 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, 2016-07-06 at 17:35 -0700, Tai Tri Nguyen wrote:
>> Hi Joe,
>
> Ch=C3=A0o Tai.
>

Thanks for the greeting!

>> On Wed, Jul 6, 2016 at 5:19 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On Wed, 2016-07-06 at 17:07 -0700, Tai Nguyen wrote:
> []
>> > > diff --git a/MAINTAINERS b/MAINTAINERS
>> > []
>> > >
>> > > @@ -8593,6 +8593,14 @@ L:     linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > >  S:   Supported
>> > >  F:   drivers/scsi/pm8001/
>> > >
>> > > +PMU-XGENE
>> > > +APPLIED MICRO (APM) X-GENE SOC PMU
>> > One line section header please.
>> Is this strictly required?
>
> Yes.
>
> get_maintainer.pl doesn't like multiple line section headers.
>

Okay, I'll drop the first line and move it accordingly.

Regards,
Tai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
