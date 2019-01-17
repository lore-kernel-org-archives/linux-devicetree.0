From: Alban Gruin <alban.gruin@gmail.com>
Subject: Re: [PATCH] userdiff: Add a builtin pattern for dts files
Date: Thu, 17 Jan 2019 22:26:30 +0100
Message-ID: <0dc48713-7a17-623f-af75-67cca2cd63b6@gmail.com>
References: <20190111215127.57356-1-sboyd@kernel.org>
 <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com>
 <154749087173.169631.13885160480779834976@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <154749087173.169631.13885160480779834976@swboyd.mtv.corp.google.com>
Content-Language: fr-FR
Sender: git-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, git@vger.kernel.org
Cc: Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Johannes Sixt <j6t@kdbg.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, sorry for the late answer.

Le 14/01/2019 à 19:34, Stephen Boyd a écrit :
> Quoting Alban Gruin (2019-01-13 13:26:21)
>> Hi Stephen,
>>
>> thank you for your patch.  I left a few comments below.
>>
>> Le 11/01/2019 à 22:51, Stephen Boyd a écrit :
>>> diff --git a/userdiff.c b/userdiff.c
>>> index 97007abe5b16..2bc964e11089 100644
>>> --- a/userdiff.c
>>> +++ b/userdiff.c
>>> @@ -23,6 +23,15 @@ IPATTERN("ada",
>>>        "[a-zA-Z][a-zA-Z0-9_]*"
>>>        "|[-+]?[0-9][0-9#_.aAbBcCdDeEfF]*([eE][+-]?[0-9_]+)?"
>>>        "|=>|\\.\\.|\\*\\*|:=|/=|>=|<=|<<|>>|<>"),
>>> +PATTERNS("dts",
>>> +      /* Node name (with optional label and unit address) */
>>> +      "^[ \t]*((([a-zA-Z_][a-zA-Z0-9_]*: )?[a-zA-Z][a-zA-Z0-9,._+-]*(@[a-zA-Z0-9,._+-]+)?"
>>
>> From the spec, label and node names “shall be [between] 1 to 31
>> characters in length”.  It’s not enforced here, and I guess it’s not
>> really git’s job to check for this kind of rule.  Others may disagree
>> with me, though.
>>
>> Should labels end with exactly one space after the colon, or can there
>> be more, or none at all?
> 
> There can be any number of spaces after the colon. I can fix the regex
> here to accept any amount of whitespace after the colon.
> 
>>
>>> +      /* Reference */
>>> +      "|&[a-zA-Z_][a-zA-Z0-9_]*[ \t]*)[ \t]*\\{)[ \t]*$",
>>
>> It’s not specified in the spec, but these lines must end with a curly
>> brace?  
> 
> That isn't common but it is supported. I can change the regex to look
> for a line that ends in '{' or something that isn't ';' with anything
> after the node name?
> 
>> What if there is a comment after the curly brace?
> 
> There can be a comment after the curly brace or before the curly brace.
> The spec allows C style /* */ type comments, in addition to C++ style //
> comments. I've never really seen that happen in practice though so it's
> not very common. Grepping the linux sources shows two hits:
> 
> arch/arm/boot/dts/lpc3250-ea3250.dts:&ohci /* &usbd */ {
> arch/arm/boot/dts/lpc3250-phy3250.dts:&ohci /* &usbd */ {
> 

I grepped through Linux and uboot’s sources and it seems that “it is not
common” is actually “it does not exists in the wild”.  Perhaps it’s not
worth to support them.

>>
>>> +      /* -- */
>>> +      /* Property names and math operators */
>>> +      "[a-zA-Z0-9,._+?#-]+"
>>> +      "|[-+*/%&^|!~]"),
>>
>> There is a `%' operator here and in your tests, but it’s not mentioned
>> in the spec if I’m not mistaken.  Does it actually exists?
> 
> The compiler doesn't seem to complain when it's used. I can send a patch
> to update the spec for this rather esoteric feature. I can also include
> more tests and support for the boolean relational operators which also
> seem to be supported but probably never used.
> 

I’d like you to do this, yes.

To be fair, I don’t know what to think about this patch after Junio’s
message.
