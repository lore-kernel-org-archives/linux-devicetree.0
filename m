From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 1/3] mfd: stmpe: Get rid of irq_invert_polarity
Date: Thu, 29 Nov 2012 00:09:24 +0530
Message-ID: <CAKohpok=VyQhmfNe_qzM5PKpw6BjH4LyKVoau-ppBy9xdNHejg@mail.gmail.com>
References: <ed0ae069e49728a4c17f16e1735d8ffd6b1e0060.1354127005.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ed0ae069e49728a4c17f16e1735d8ffd6b1e0060.1354127005.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, grant.likely@secretlab.ca, rabin.vincent@stericsson.com, shiraz.hashim@st.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, lee.jones@linaro.org, linus.walleij@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

On 29 November 2012 00:05, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Since the very first patch, stmpe core driver is using irq_invert_polarity as
> part of platform data. But, nobody is actually using it in kernel till now.
>
> Also, this is not something part of hardware specs, but is included to cater
> some board mistakes or quirks.
>
> So, better get rid of it. This is earlier discussed here:
>
> https://lkml.org/lkml/2012/11/27/636
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Please ignore this series.. Two issues:
- rebased over an un accepted patch which rearranges header file
- I can improve patch 2/3 a bit.

I will resend it shortlly.
