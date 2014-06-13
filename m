From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] of: avoid format string parsing in kobject names
Date: Fri, 13 Jun 2014 10:30:33 -0700
Message-ID: <CAGXu5jKR4Eo7QR=_N-8Y89KkShBB7yk6_vkUhvh6uOXDz0vuyw@mail.gmail.com>
References: <20140610165700.GA3453@www.outflux.net>
	<CAL_JsqKJq-u7GGDfNONAT7tjAK-2AKQi64X8Au0N8gzPpEoNug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKJq-u7GGDfNONAT7tjAK-2AKQi64X8Au0N8gzPpEoNug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 7:55 AM, Rob Herring <robherring2@gmail.com> wrote:
> On Tue, Jun 10, 2014 at 11:57 AM, Kees Cook <keescook@chromium.org> wrote:
>> This makes sure a format string cannot leak into the kobject name that
>> is constructed. (And splits the >80 character line.)
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Applied.
>
> This seems like a non-obvious thing to do, but I guess most people
> aren't dealing directly with kobjects.

Yeah, it's really unlikely this could get reached, but I just keep
cleaning this up any time I see them just to be safe. :)

Thanks!

-Kees


-- 
Kees Cook
Chrome OS Security
