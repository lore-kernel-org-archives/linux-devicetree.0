From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: hikey: Add pstore support for HiKey
Date: Thu, 8 Sep 2016 17:17:53 -0700
Message-ID: <CALAqxLVU5kusY=PyQrBX8mZRRcLN08Lzrs6XUKUUVd3fb3VBkw@mail.gmail.com>
References: <1471906085-16682-1-git-send-email-john.stultz@linaro.org>
 <1471906085-16682-4-git-send-email-john.stultz@linaro.org> <CAGXu5jJjEchF8MxE5vhLEj9wy1NcibLR88YptGm3uG79DD-sxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJjEchF8MxE5vhLEj9wy1NcibLR88YptGm3uG79DD-sxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 5:12 PM, Kees Cook <keescook@chromium.org> wrote:
> On Mon, Aug 22, 2016 at 3:48 PM, John Stultz <john.stultz@linaro.org> wrote:
>> This patch reserves some memory in the DTS and sets up a
>> pstore device tree node to enable pstore support on HiKey.
>>
>> Cc: Kees Cook <keescook@chromium.org>
>> Cc: Guodong Xu <guodong.xu@linaro.org>
>> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
>> Cc: Wei Xu <xuwei5@hisilicon.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: devicetree@vger.kernel.org
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> I'm going through old emails -- did this get picked up by anyone? I
> don't see an "applied" reply or similar, though I could have easily
> missed it. :)

Wei said he picked up the set, but it hasn't shown up in -next yet, as
his tree isn't automatically pulled in apparently.

thanks
-john
