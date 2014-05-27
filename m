From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] coccinelle: Check for missing NULL terminators in of_device_id
 tables
Date: Tue, 27 May 2014 10:44:36 -0700
Message-ID: <5384CF04.8080106@codeaurora.org>
References: <1400888504-31309-1-git-send-email-sboyd@codeaurora.org> <CAL_JsqJyCzNV0xK_uPp4o4F1Jhi8QmTY3KaHfeLcssnTea5H+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJyCzNV0xK_uPp4o4F1Jhi8QmTY3KaHfeLcssnTea5H+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mitchel Humpherys <mitchelh@codeaurora.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/25/14 07:13, Rob Herring wrote:
> On Fri, May 23, 2014 at 6:41 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> Failure to terminate an of_device_id table can lead to confusing
>> failures depending on where the compiler places the array. Add a
>> check to make sure these tables are terminated. Thanks to Mitchel
>> Humpherys for coming up with the initial pattern.
> I've definitely debugged one of those problems. Do you have any actual
> fixes or there are no errors in the kernel?
>
>

Yes I sent five patches out. Here's one for example
https://lkml.org/lkml/2014/5/23/731

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
