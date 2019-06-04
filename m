From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: RFC: use of_match_ptr() and conditional of match table declaration
Date: Tue, 4 Jun 2019 13:59:01 +0000
Message-ID: <293b771e-252c-d376-1347-1e6570758be9@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi folks,


we have a dozen drivers that can be built w/ and w/o oftree support.
In those cases we need conditional compiling (check for CONFIG_OF).
Some already use the of_match_ptr() macro, others still are cluttered
w/ ifdef's.

I've converted some of them to using of_match_ptr(), but I'm curious
whether we also should convert all drivers and make this the standard
policy (also let checkpatch check for it).

Most of that can be done automatically, few cases need some manual
intervention. (already have queue here, which just needs to be a bit
sorted and posted to the individual maintainers)

How do you think about this idea ?

Are there some good reasons for not using this macro ?


By the way: I'm also experimenting w/ using a macro for declaring the
match tables conditionally, so we can reduce the boilerplate a bit.
It then looks like that:

    MODULE_DECLARE_OF_TABLE(foo, { first entry }, { second entry }, ...)

This macro declares a static const struct of_device_id
array by given name, initializes with the given parameters adds the
sentinel (so no chance for forgetting it anymore ;-)), and finally calls
MODULE_DEVICE_TABLE(of, foo)  - but only if CONFIG_OF is enabled.

What I haven't sorted out yet: what exactly to do in !CONFIG_OF case ?

a) if we're always using of_match_ptr() - don't need to do anything
b) declare a static const *pointer* variable, initialized to NULL,
    so the variable name can be used as before - hoping the compiler
    is clever enough to just optimize it away.

What's your oppinion on that ?



--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
