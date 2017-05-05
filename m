From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v8 5/7] coresight: add support for CPU debug module
Date: Fri, 5 May 2017 09:34:44 -0600
Message-ID: <CANLsYkyK=KZsreBYHoDVCztrJh0Cu_MaDcBona8iHizXMw9-kg@mail.gmail.com>
References: <1493719717-27698-1-git-send-email-leo.yan@linaro.org>
 <1493719717-27698-6-git-send-email-leo.yan@linaro.org> <4cd0e395-c177-0b72-9cab-7a95aac9cca4@arm.com>
 <20170505144832.GA4507@linaro.org> <d683a786-b6f2-2d95-2a42-c82b38200bfa@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <d683a786-b6f2-2d95-2a42-c82b38200bfa@arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 5 May 2017 at 09:04, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 05/05/17 15:48, Mathieu Poirier wrote:
>> On Fri, May 05, 2017 at 02:55:17PM +0100, Sudeep Holla wrote:
>
> [...]
>
>>>
>>> Just curious as why this is not registered under coresight bus using
>>> coresight_register ? It would be good to group all the coresight devices
>>> under that bus if possible.
>>
>> The only thing this driver has in common with the coresight framework is the
>> name, everything else is completely different.  Coupling them together (because
>> of the name) would introduce a lot of hacks and make the code unintelligible.
>>
>
> I guessed so from the quick glance at it as it needs descriptors with
> notion of source, sink and links to register. However I felt odd to not
> group under the same "coresight" bus. As someone with least knowledge
> on coresight, I would check under "sys/bus/coresight" to check available
> devices on the system.

2 years ago when implementing the coresight framework, using
"coresight" sounded like a logical choice but in hindsight it probably
should have been something like coresight-hat (HW Assisted Tracing).
That would have been a better representation of the reality, i.e the
term "coresight" being an umbrella for many kind of technology.  Leo
has done the right thing here with "coresight-cpu-debug".

>
> Anyways that's just my thoughts though I agree with you. It may need
> more refactoring to support that and it will look hackish if we try to
> do that with the code as it stands.
>
> --
> Regards,
> Sudeep
