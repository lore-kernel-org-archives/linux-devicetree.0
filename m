From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 7/8] gpio/mpc8xxx: Convert to platform device interface.
Date: Tue, 20 Jan 2015 11:54:55 +0100
Message-ID: <CAPybu_0qdumx91RFERp5Ft2HXs6rYv5H0WTFxiiyT4oiGjmzhA@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
 <1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
 <87k30i9ykv.fsf@dell.be.48ers.dk> <CAPybu_180vMPMx4yhFAoL9H2b34+tWtqQCTHjxqkTRt9e_VA5g@mail.gmail.com>
 <8761c191k8.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8761c191k8.fsf@dell.be.48ers.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Peter Korsgaard <jacmet@sunsite.dk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

No worries :)

On Tue, Jan 20, 2015 at 11:41 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Ricardo" == Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> writes:
>
>  > Hello Peter
>  > I thought the logic behind the original driver was:
>
>  > 1) Create gpiochip so it can be used by other modules/userland
>  > 2) if there is also a irq available for it, create a irqdomain.
>  > otherwise continue.
>
> Indeed - Sorry, I must have been confused yesterday.
>
> --
> Bye, Peter Korsgaard



-- 
Ricardo Ribalda
