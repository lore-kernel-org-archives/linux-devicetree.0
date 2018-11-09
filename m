From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 0/6] Support HMS Profinet Card over Anybus
Date: Fri, 9 Nov 2018 11:02:04 -0500
Message-ID: <CAGngYiU+8k4ZHYhFVQGKXW8mATEDi64Mi9PsVkX-5vn2PCY3ew@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104155501.14767-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Arnd, Rob, Linus,

Many thanks for your constructive feedback so far !

Is there anything in general about this set that would prevent it from being
mainlined? Perhaps I am trying to do too much at once, dropping a patchset
that is too complex to be properly reviewed?

I've been thinking about reworking the host to its simplest, yet feature-
complete form. Just serialize all card accesses with a single lock.
Then the kernel thread, kqueue, kcache, kref etc would all disappear.
The price we pay is a reduction in performance/parallelism.
We could then increase parallelism at a later stage.
Would that be of any help?

Comments on v3 will go into v4 shortly.
(Rob, I'm not sure how to address your feedback, other than to s/host/slot/g ?)

Yours,
Sven
