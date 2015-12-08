From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 16:26:39 -0600
Message-ID: <CAL_JsqKMsG79TiB7nAOd8rB5m3VqwJYdQU0xiwvzvaqMyCk1BQ@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 3:29 PM, John Stultz <john.stultz@linaro.org> wrote:
> This patch adds a basic driver to allow for commands like
> "reboot bootloader" and "reboot recovery" to communicate this
> reboot-reason to the bootloader.
>
> This is commonly done on Android devices, in order to reboot
> the device into fastboot or recovery mode. It also supports
> custom OEM specific commands, via "reboot oem-<value>".

What are some examples of OEM specific commands?

> This driver pulls the phys memory address from DT as well as
> the magic reason values that are written to the address for
> each mode.

Starting with what does the h/w look like, this is typically
implemented with some sort of persistent register(s) either in the SOC
or PMIC. So I think persistent memory/registers is what we need to
describe in DT. Perhaps this could be tied into pstore (an overkill
for a single register, but useful if you already have pstore support
for persistent memory)? The 2nd part is which register to use and the
mapping of values to reboot reason. Do these vary within SOC families?
If not, then we should just hardcode them in the reboot drivers which
are already vendor specific.

Also, while trying to standardize the values for reboot reason
probably won't work short term, we should define something so people
will start using it. We also should consider any implications with
PSCI.

Rob
