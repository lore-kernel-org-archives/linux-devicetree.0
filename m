From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Mon, 13 Apr 2015 13:23:17 +0300
Message-ID: <CAK=WgbY-5OsfdKJxGScvGj5sv-M-UvxhCfgSTunHiufvq1PXEQ@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
 <CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
 <CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
 <CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
 <CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
 <CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com>
 <CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg@mail.gmail.com>
 <CAK=WgbYwk=DEgNFKn11BHpS=V_m=6Okf=i7w5NkLHwu8ryMaJg@mail.gmail.com>
 <CAJAp7OgZo8rUGL1xkrSVTXMZfgzbV8eGEMniSquw7owkRAqKmg@mail.gmail.com> <CAK=WgbauoPf52v3P7NLPsXaRUmGWo_K6ZcV4w3UO6xs7MUrJsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbauoPf52v3P7NLPsXaRUmGWo_K6ZcV4w3UO6xs7MUrJsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Tim Bird <tbird20d@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 10:04 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> Mark, are you OK with the latest iteration from Suman? it would be
> nice to get your +1 just to make sure we don't merge stuff you're
> uncomfortable with.

Quick update:

As Tim pointed out, we can move forward with the driver binding patch
according to the process described under II.2 of [1]. Both Bjorn and
myself would still prefer to make sure Mark is satisfied with the
response Bjorn sent to Mark's question, but we understand if Mark is
swamped and we eventually would proceed according to the DT's
submitting-patches guidance below. Tim, thanks for pointing that out
as I wasn't aware of this.

What we probably do need a DT ack on is the hwspinlock subsystem
binding submitted by Suman, again according to the process described
under II.2 of [1]: "Subsystem bindings (anything affecting more than a
single device): then getting a devicetree maintainer to review it is
required".

Mark and Rob: thanks so much for all your help so far as you have
substantially helped shaping the hwspinlock binding. Please let us
know if you are satisfied with Suman's latest iteration, still prefer
to take another look at it, or are too swamped. If the latter, then
maybe we can ask Kumar to take a look, as this seems to be blocking
Qualcomm's upstream roadmap.

Thanks,
Ohad.

[1] Documentation/devicetree/bindings/submitting-patches.txt
