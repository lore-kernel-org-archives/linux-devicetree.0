From: Johannes Sixt <j6t@kdbg.org>
Subject: Re: [PATCH] userdiff: Fix some corner cases in dts regex
Date: Sat, 12 Oct 2019 14:54:00 +0200
Message-ID: <ab9b0dba-5c5b-5a97-07c5-ce8344cd74cd@kdbg.org>
References: <20191004213029.145027-1-sboyd@kernel.org>
 <c3a054d9-2646-e440-40c5-b0aecf21e690@kdbg.org>
 <20191008144306.B2B0820659@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <20191008144306.B2B0820659@mail.kernel.org>
Content-Language: en-US
Sender: git-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, Junio C Hamano <gitster@pobox.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 08.10.19 um 16:43 schrieb Stephen Boyd:
> Quoting Johannes Sixt (2019-10-05 07:09:11)
>> Am 04.10.19 um 23:30 schrieb Stephen Boyd:
>>> --- /dev/null
>>> +++ b/t/t4018/dts-nodes-multiline-prop
>>> @@ -0,0 +1,12 @@
>>> +/ {
>>> +     label_1: node1@ff00 {
>>> +             RIGHT@deadf00,4000 {
>>> +                     multilineprop = <3>,
>>> +                                     <4>;
>>
>> You could insert more lines to demonstrate that "<x>," on a line by
>> itself is not picked up.
> 
> Maybe I should add another test?

This is is the _multi_line test case, right? ;) Just add one or two
lines between the <3> and the <4> that look like common real-world cases
to show that those lines won't be picked up. I don't think that another
test file is required.

>>> +/ { RIGHT /* Technically just supposed to be a slash and brace */
>>
>> Devil's advocate here: insert ';' or '=' in the comment, and the line
>> would not be picked up. Does that hurt in practice?
> 
> I don't think it hurts in practice so I'd like to ignore it.

Sure, no problem.

>>>  PATTERNS("dts",
>>>        "!;\n"
>>> +      "!.*=.*\n"
>>
>> This behaves the same way as just
>>
>>         "!=\n"
>>
>> no?
>>
> 
> Not exactly. Properties don't always get assigned.

I was just refering to the added line, not the combination of the two lines.

But while you are speaking of it:

> There are boolean
> properties that can be tested for by the presence of some string with an
> ending semi-colon, like 'this-is-true;'. If we just check for not equal
> to a line with a semicolon and newline then we'll see boolean
> properties. Should I add that as another test?

I agree that a test case with a Boolean property would be great.

-- Hannes
