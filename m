From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 0/6] Support HMS Profinet Card over Anybus
Date: Fri, 9 Nov 2018 23:32:50 +0100
Message-ID: <CAK8P3a1zME8G0FjqLaL65F6yYOEuPLJLNs6Mdve7YF=Q2BpU5w@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <CAGngYiU+8k4ZHYhFVQGKXW8mATEDi64Mi9PsVkX-5vn2PCY3ew@mail.gmail.com>
 <CAK8P3a1STE+vN_yF0Zyu8gGX_KCWZEV=muPxVE6M1EUqdhO4Pg@mail.gmail.com> <CAGngYiWtmHPShpbLOj4qYJCe6PvNT7ZUDd-0jRsRyxD+HWbByQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiWtmHPShpbLOj4qYJCe6PvNT7ZUDd-0jRsRyxD+HWbByQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 9, 2018 at 10:47 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Fri, Nov 9, 2018 at 4:22 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> >
> > As usual, it comes down to the user space interfaces I think. Designing
> > a user interface is hard, most importantly because you cannot change it
> > once anyone starts relying on it, as opposed to implementation details
> > that you are free to change at any point.
>
> Thanks for the feedback !
> I will rework v4 so it uses a userspace interface shared with other
> fieldbus drivers - uio.

You mentioned this before, but I don't see how this would actually
work. Isn't uio just a slim wrapper for allowing user space access
to hardware registers while avoiding a kernel driver?

      Arnd
