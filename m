From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 0/3] Qualcomm Resource Power Manager driver
Date: Mon, 02 Jun 2014 11:15:24 +0300
Message-ID: <538C329C.8060009@mm-sol.com>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com> <F773CDFB-2957-49C0-99D3-E9CDCE33C378@codeaurora.org> <CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thanks for the patches.

<snip>

> Lately I've been working on rpm, rpm-smd, smem, smd, smsm, smp2p
> patches for mainline.
> It could be argued that smd is a bus and should go in drivers/bus, but
> for the rest I fear that we just created drivers/soc/qcom as another
> dumping ground for things; a "Qualcomm specific drivers/mfd".

Do we have some obstacles to not use a "common mailbox framework" for
this IPC (shared memory) communication. It looks that it fits very well
with our needs for this rpm-regulator and future submitting of smd driver?

-- 
regards,
Stan
