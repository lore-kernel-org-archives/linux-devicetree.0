From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] checkpatch.pl: Add SPDX license tag check for dts files
 and headers
Date: Wed, 7 Jun 2017 17:45:03 +0900
Message-ID: <CAK7LNASGzmF_WctWVJRQN_Ko7aOeXbwh6KHujKw1J-LAhvGQ2w@mail.gmail.com>
References: <20170223155644.24213-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170223155644.24213-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

2017-02-24 0:56 GMT+09:00 Rob Herring <robh@kernel.org>:
> Add a check for using SPDX-License-Identifier tags to define the license of
> .dts{i} and DT header files rather than using free form license text. This
> check looks for GPL, BSD, or X11(really incorrectly labeled MIT license)
> license text which are the commonly used DT licenses.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Andy Whitcroft <apw@canonical.com>
> Cc: Joe Perches <joe@perches.com>

I have a question.

Is SPDX encouraged only for DT?

What should we do with C source files?


-- 
Best Regards
Masahiro Yamada
