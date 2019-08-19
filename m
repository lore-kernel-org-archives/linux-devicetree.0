From: Johannes Sixt <j6t@kdbg.org>
Subject: Re: [PATCH v2] userdiff: Add a builtin pattern for dts files
Date: Mon, 19 Aug 2019 23:35:39 +0200
Message-ID: <806dbf7a-0488-6dde-70b9-a62cc5dca23e@kdbg.org>
References: <20190816225658.8946-1-sboyd@kernel.org>
 <98f9cdc2-fa9b-b639-b906-44b17f0efd76@kdbg.org>
 <20190819204451.522D422CEB@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <20190819204451.522D422CEB@mail.kernel.org>
Content-Language: en-US
Sender: git-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Matthieu Moy <Matthieu.Moy@imag.fr>, devicetree@vger.kernel.org, Alban Gruin <alban.gruin@gmail.com>, Junio C Hamano <gitster@pobox.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 19.08.19 um 22:44 schrieb Stephen Boyd:
> Quoting Johannes Sixt (2019-08-19 11:40:47)
>> Am 17.08.19 um 00:56 schrieb Stephen Boyd:
>>> diff --git a/t/t4018/dts-labels b/t/t4018/dts-labels
>>> new file mode 100644
>>> index 000000000000..27cd4921cfb6
>>> --- /dev/null
>>> +++ b/t/t4018/dts-labels
>>> @@ -0,0 +1,8 @@
>>> +/ {
>>> +     label_1: node1@ff00 {
>>> +             label2: RIGHT {
>>> +                     vendor,some-property;
>>> +                     ChangeMe = <0x45-30>;
>>
>> In these tests, it would be worthwhile to leave another (possibly blank)
>> line before the ChangeMe line in order to demonstrate that lines
>> beginning with a word, such as the 'vendor,some-property;' line, are
>> _not_ picked up when they are not in the hunk context.
> 
> Sure. I can add a blank line. Did you want it on all the tests or just
> some of them?

Some of them. We should have cases that show that
"vendor,some-property;" and "prop-erty = value;" are not picked up.

-- Hannes
