From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Fri, 9 Oct 2015 12:53:17 -0500
Message-ID: <CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ@mail.gmail.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej> <yw1xvbaik4mn.fsf@unicorn.mansr.com>
 <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
 <yw1xmvvtk906.fsf@unicorn.mansr.com> <yw1xy4fchv4z.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xy4fchv4z.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Stephen who has worked on this code.

On Fri, Oct 9, 2015 at 11:19 AM, M=C3=A5ns Rullg=C3=A5rd <mans@mansr.co=
m> wrote:
> M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com> writes:
>
>> Rob Herring <robherring2@gmail.com> writes:
>>
>>> On Wed, Oct 7, 2015 at 11:47 AM, M=C3=A5ns Rullg=C3=A5rd <mans@mans=
r.com> wrote:
>>>> What would be a proper way to select a sched_clock source?  I real=
ise
>>>> it's a Linux-specific thing and DT is supposed to be generic, but =
the
>>>> information must be provided somehow.
>>>
>>> The kernel already has some logic to do this. Most number of bits
>>> followed by highest frequency will be the winning sched_clock. You
>>> might also want to look at things like always on or not.
>>
>> The problem is that sched_clock_register() doesn't take a pointer to=
 be
>> passed back to the read_sched_clock callback like most interfaces of
>> this type do.  This means the callback must use global variables set=
 up
>> before the register call, but at that time there's no way of knowing
>> which one will be used.  If there were a way of getting a pointer to=
 the
>> callback, it would be a simple matter of registering all instances a=
nd
>> letting the kernel choose which to use.
>
> Anyone got a comment on this?  Do I have to send a patch adding this
> before anyone will tell me why it's a bad idea?  (That method almost
> always works.)

Adding a ptr to the callback seems fine to me.

Rob
