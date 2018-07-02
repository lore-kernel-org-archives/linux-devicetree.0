Return-Path: <SRS0=gRyH=JS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:59007 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752235AbeGBPXf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Jul 2018 11:23:35 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 0/7] mmc: pxamci: cleanups and minor DT tweaks
References: <20180630181405.17630-1-daniel@zonque.org>
        <CAPDyKFo3CPZaLrfcAX=PLYGEdRzdUKQ0Undw6oOSm4+Hd826Fw@mail.gmail.com>
        <6a2d16d5-2aab-b049-7e66-750ca4f9c102@zonque.org>
        <CAPDyKFp6NM8mwyZQK=2MkVbv3FqV4a_JCvLzjsgRBhZ1NZN85Q@mail.gmail.com>
Date: Mon, 02 Jul 2018 17:23:31 +0200
In-Reply-To: <CAPDyKFp6NM8mwyZQK=2MkVbv3FqV4a_JCvLzjsgRBhZ1NZN85Q@mail.gmail.com>
        (Ulf Hansson's message of "Mon, 2 Jul 2018 16:47:11 +0200")
Message-ID: <87lgathdak.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On 2 July 2018 at 16:43, Daniel Mack <daniel@zonque.org> wrote:
>> On Monday, July 02, 2018 04:38 PM, Ulf Hansson wrote:
>>>
>>> On 30 June 2018 at 20:13, Daniel Mack <daniel@zonque.org> wrote:
>> Hmm, applied on top of Robert's patch in [1] (see above)? Without that
>> patch, I expect build breakage with this series.
>
> Right, I drop the series. Thanks for letting me know!
>
> I think [1] is available from an immutable branch somewhere. I look it
> up and merge it before applying this again.
Yup, it's here :
git fetch https://github.com/rjarzmik/linux.git tags/pxa-for-4.19-dma_slave_map

Let it spare a bit of your maintainer time :)

Cheers.

-- 
Robert
