From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 0/6] Support HMS Profinet Card over Anybus
Date: Fri, 9 Nov 2018 16:46:57 -0500
Message-ID: <CAGngYiWtmHPShpbLOj4qYJCe6PvNT7ZUDd-0jRsRyxD+HWbByQ@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <CAGngYiU+8k4ZHYhFVQGKXW8mATEDi64Mi9PsVkX-5vn2PCY3ew@mail.gmail.com> <CAK8P3a1STE+vN_yF0Zyu8gGX_KCWZEV=muPxVE6M1EUqdhO4Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1STE+vN_yF0Zyu8gGX_KCWZEV=muPxVE6M1EUqdhO4Pg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 4:22 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> As usual, it comes down to the user space interfaces I think. Designing
> a user interface is hard, most importantly because you cannot change it
> once anyone starts relying on it, as opposed to implementation details
> that you are free to change at any point.

Thanks for the feedback !
I will rework v4 so it uses a userspace interface shared with other
fieldbus drivers - uio.
Let's see how it goes.
