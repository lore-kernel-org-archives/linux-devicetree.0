From: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v4 2/2] Input: bcm-keypad: Add Broadcom keypad controller
Date: Mon, 2 Mar 2015 13:59:15 -0800
Message-ID: <54F4DD33.2050803@broadcom.com>
References: <sbranden@broadcom.com> <1425141357-7807-1-git-send-email-sbranden@broadcom.com> <1425141357-7807-3-git-send-email-sbranden@broadcom.com> <20150228221022.GA36282@dtor-ws> <20150228221518.GB36282@dtor-ws> <54F4BC15.4020205@broadcom.com> <20150302202342.GE17094@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150302202342.GE17094@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

I understand what's missing now.

Thanks,
  Scott

On 15-03-02 12:23 PM, Dmitry Torokhov wrote:
> Hi Scott,
>
>>> Hmm, also bcm_kp_start() and bcm_kp_stop() should check if kp->clk is
>>> valid before trying to enable/disable it.
>>>
>> I checked and other keyboard drivers do not check this.  I return an
>> error in bcm_kp_start if the clk enable fails.  On stop, if the clk
>> is not valid something is really, really wrong as well.
>
> The other drivers simply abort probe() if they can't get clock, you
> decided to allow probe() to finish and assume that clock is already
> enabled, leaving kp->clk == ERR_PTR(-ENOENT) in your version. If you try
> then calling clk_prepare_enable() with that pointer it is going to bomb,
> that is why I said you need to check pointer validity in bcm_kp_start()
> and bcm_kp_stop().
>
> Thanks.
>
