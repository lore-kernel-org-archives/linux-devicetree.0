From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Convert to using %pOF instead of full_name
Date: Thu, 20 Jul 2017 13:34:12 +1000
Message-ID: <87wp73hjd7.fsf@concordia.ellerman.id.au>
References: <20170718214339.7774-6-robh@kernel.org> <878tjkiqgs.fsf@concordia.ellerman.id.au> <CAL_Jsq+f04cbTxoJEz8DW+TnE+TTO++F6M5=kBkMJkbO-w211g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+f04cbTxoJEz8DW+TnE+TTO++F6M5=kBkMJkbO-w211g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Anatolij Gustschin <agust@denx.de>, Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:
> On Wed, Jul 19, 2017 at 7:03 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Rob Herring <robh@kernel.org> writes:
>>
>>> Now that we have a custom printf format specifier, convert users of
>>> full_name to use %pOF instead. This is preparation to remove storing
>>> of the full path string for each node.
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Anatolij Gustschin <agust@denx.de>
>>> Cc: Scott Wood <oss@buserror.net>
>>> Cc: Kumar Gala <galak@kernel.crashing.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> ---
>> ...
>>>  79 files changed, 464 insertions(+), 490 deletions(-)
>>
>> Is the plan that I'll merge this for 4.14 ?
>
> Yes, hence why it's not a series and sent to you.

OK thanks. That was a bit too subtle for me :)

cheers
