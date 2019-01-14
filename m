From: Junio C Hamano <gitster@pobox.com>
Subject: Re: [PATCH] userdiff: Add a builtin pattern for dts files
Date: Mon, 14 Jan 2019 10:34:07 -0800
Message-ID: <xmqq7ef7w0kg.fsf@gitster-ct.c.googlers.com>
References: <20190111215127.57356-1-sboyd@kernel.org>
        <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com> (Alban Gruin's
        message of "Sun, 13 Jan 2019 22:26:21 +0100")
Sender: git-owner@vger.kernel.org
To: Alban Gruin <alban.gruin@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Johannes Sixt <j6t@kdbg.org>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Alban Gruin <alban.gruin@gmail.com> writes:

> thank you for your patch.  I left a few comments below.
>
> Le 11/01/2019 à 22:51, Stephen Boyd a écrit:
>> The Linux kernel receives many patches to the devicetree files each
>> release. The hunk header for those patches typically show nothing,
>> making it difficult to figure out what node is being modified without
>> applying the patch or opening the file and seeking to the context. Let's
>> add a builtin 'dts' pattern to git so that users can get better diff
>> output on dts files when they use the diff=dts driver.

A sort of meta-question.

What is missing in the current git that prevents the folks involved
in device-tree project from achieving what this patch tries to
accomplish without having to wait the Git project to act on it?  To
put it another way, is it a symptom of a bad design that from time
to time the Git project has to add built-in patterns?

Ability to ship arbitrary piece of text that you would normally
place in .git/config is not exactly an answer to the above question,
and will not happen as that has grave security implications.

But perhaps we can start accepting an in-tree config-like file whose
contents are limited to verified-safe settings
(e.g. "diff.*.xfuncname" and nothing else), so that projects can
ship two files in-tree:

 - ".gitattributes" that says "*.dts diff=dts"

 - ".gitpreferences" that says "[diff "dts"] xfuncname=..." to
   define the pattern the patch under review adds.

without waiting for the next release of Git to add one more built-in
pattern?

Anything that defines executable (e.g. "diff.*.command") should
never be accepted as part of the in-tree config-like file (for two
reasons: security and portability), but there should be some
"obviously safe" subset of config settings that we can allow project
to impose on its users, I hope.
