From: Alban Gruin <alban.gruin@gmail.com>
Subject: Re: [PATCH] userdiff: Add a builtin pattern for dts files
Date: Thu, 17 Jan 2019 22:26:20 +0100
Message-ID: <e932c7cb-ebf6-1499-00fb-cf0f5e8d9844@gmail.com>
References: <20190111215127.57356-1-sboyd@kernel.org>
 <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com>
 <xmqq7ef7w0kg.fsf@gitster-ct.c.googlers.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <xmqq7ef7w0kg.fsf@gitster-ct.c.googlers.com>
Content-Language: fr-FR
Sender: git-owner@vger.kernel.org
To: Junio C Hamano <gitster@pobox.com>
Cc: Stephen Boyd <sboyd@kernel.org>, git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Johannes Sixt <j6t@kdbg.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Junio,

Le 14/01/2019 à 19:34, Junio C Hamano a écrit :
> Alban Gruin <alban.gruin@gmail.com> writes:
> 
>> thank you for your patch.  I left a few comments below.
>>
>> Le 11/01/2019 à 22:51, Stephen Boyd a écrit:
>>> The Linux kernel receives many patches to the devicetree files each
>>> release. The hunk header for those patches typically show nothing,
>>> making it difficult to figure out what node is being modified without
>>> applying the patch or opening the file and seeking to the context. Let's
>>> add a builtin 'dts' pattern to git so that users can get better diff
>>> output on dts files when they use the diff=dts driver.
> 
> A sort of meta-question.
> 
> What is missing in the current git that prevents the folks involved
> in device-tree project from achieving what this patch tries to
> accomplish without having to wait the Git project to act on it?  To
> put it another way, is it a symptom of a bad design that from time
> to time the Git project has to add built-in patterns?
> 
> Ability to ship arbitrary piece of text that you would normally
> place in .git/config is not exactly an answer to the above question,
> and will not happen as that has grave security implications.
> 
> But perhaps we can start accepting an in-tree config-like file whose
> contents are limited to verified-safe settings
> (e.g. "diff.*.xfuncname" and nothing else), so that projects can
> ship two files in-tree:
> 
>  - ".gitattributes" that says "*.dts diff=dts"
> 
>  - ".gitpreferences" that says "[diff "dts"] xfuncname=..." to
>    define the pattern the patch under review adds.
> 
> without waiting for the next release of Git to add one more built-in
> pattern?
> 
> Anything that defines executable (e.g. "diff.*.command") should
> never be accepted as part of the in-tree config-like file (for two
> reasons: security and portability), but there should be some
> "obviously safe" subset of config settings that we can allow project
> to impose on its users, I hope.
> 

I really don’t know what to think about this.  I like your proposal, but
it will take some time to write such a feature, while there is a patch
almost ready to support the dts syntax.  But I guess that if it is
merged, it will be nearly-impossible to remove from the source if a
feature like you proposed is eventually implemented.
