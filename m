From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Revert "of: Fix premature bootconsole disable with 'stdout-path'"
Date: Wed, 18 Mar 2015 08:05:58 -0500
Message-ID: <CAL_JsqKOCy9gxC1xhVTY31agnE=gcRUQKWwLih4Q9UTUUSKkrg@mail.gmail.com>
References: <1426625193-5055-1-git-send-email-peter@hurleysoftware.com> <1426654054.6504.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426654054.6504.2.camel@ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Peter Hurley <peter@hurleysoftware.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pranith Kumar <bobby.prani@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 11:47 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Tue, 2015-03-17 at 16:46 -0400, Peter Hurley wrote:
>> This reverts commit 2fa645cb2703d9b3786d850db815414dfeefa51d.
>>
>> The assumption that at least 1 preferred console will be registered
>> when the stdout-path property is set is invalid, which can result
>> in _no_ consoles.
>>
>> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
>
> Grant/Rob, in case you didn't see it, this has caused a panic on at least one
> powerpc box. So would be nice if it could go in for 4.0.

Yes, I'm well aware of it and it will go in this week.

Rob
