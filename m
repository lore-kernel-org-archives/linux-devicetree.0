From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 0/6] Support HMS Profinet Card over Anybus
Date: Fri, 9 Nov 2018 22:22:04 +0100
Message-ID: <CAK8P3a1STE+vN_yF0Zyu8gGX_KCWZEV=muPxVE6M1EUqdhO4Pg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com> <CAGngYiU+8k4ZHYhFVQGKXW8mATEDi64Mi9PsVkX-5vn2PCY3ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiU+8k4ZHYhFVQGKXW8mATEDi64Mi9PsVkX-5vn2PCY3ew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 5:02 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Arnd, Rob, Linus,
>
> Many thanks for your constructive feedback so far !
>
> Is there anything in general about this set that would prevent it from being
> mainlined? Perhaps I am trying to do too much at once, dropping a patchset
> that is too complex to be properly reviewed?

As usual, it comes down to the user space interfaces I think. Designing
a user interface is hard, most importantly because you cannot change it
once anyone starts relying on it, as opposed to implementation details
that you are free to change at any point.

It's also hard to find reviewers for it, the best you can hope for
is that you find people that have both knowledge about the type of
hardware you work with and Linux user interface design, and
get them to review the code.

> I've been thinking about reworking the host to its simplest, yet feature-
> complete form. Just serialize all card accesses with a single lock.
> Then the kernel thread, kqueue, kcache, kref etc would all disappear.
> The price we pay is a reduction in performance/parallelism.
> We could then increase parallelism at a later stage.
> Would that be of any help?

I don't think that's a major issue. If you are happy with the
implementation there, and you use the interfaces correctly, that
won't stop the driver from getting merged, even if you could
rework it to use something else later.

      Arnd
