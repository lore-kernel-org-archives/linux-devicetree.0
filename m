From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] powerpc: dts: replace 'linux,stdout-path' with 'stdout-path'
Date: Thu, 1 Mar 2018 07:39:06 -0600
Message-ID: <CAL_JsqKn3hXaaYYef47afK+E=WUfZyfF6ejGD0vX7C8sNjhdFw@mail.gmail.com>
References: <20180228224406.7049-1-robh@kernel.org> <87606ga8bv.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87606ga8bv.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 7:33 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Rob Herring <robh@kernel.org> writes:
>
>> 'linux,stdout-path' has been deprecated for some time in favor of
>> 'stdout-path'. Now dtc will warn on occurrences of 'linux,stdout-path'.
>> Search and replace all the of occurrences with 'stdout-path'.
>
> This patch looks OK.
>
> But please remember that not all device trees are generated with dtc, we
> still have machines in the wild that have firmware which use
> "linux,stdout-path" and may never be updated.

Absolutely. The core code still supports both.

The only scenario I could come up with is someone has an old
bootloader that only understands linux,stdout-path and modifies it and
they update the dtb. We may end up with both properties with
stdout-path taking preference.

Rob
