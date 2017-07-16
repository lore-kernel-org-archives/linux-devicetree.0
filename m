From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Sat, 15 Jul 2017 19:13:22 -0700
Message-ID: <CAGXu5j+fX-E9ngW3MBhRFgpKBLzpyhR0TCx=ovosXOAqogzMMA@mail.gmail.com>
References: <20170715003836.GA113132@beast> <CAKv+Gu9n0cpznPxiQPYj0_+DALXTdevbvoYgM87A7ej2kdcizA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu9n0cpznPxiQPYj0_+DALXTdevbvoYgM87A7ej2kdcizA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Matt Redfearn <matt.redfearn@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 15, 2017 at 5:42 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> (+ Mark, Will, Catalin)
>
> On 15 July 2017 at 01:38, Kees Cook <keescook@chromium.org> wrote:
>> Document then /chosen/kaslr-seed property (and its interaction with the
>> EFI_RNG_PROTOCOL API).
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>
> For the textual changes:
>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> *However*, documenting the /chosen/kaslr-seed property promotes it
> from a stub<->kernel private interface to an external ABI between the
> kernel and the bootloader, and we need to reach agreement on whether
> doing so is desirable first IMHO.
>

Oh! I thought that was the point (having a bootloader provide kaslr
entropy). And that in the EFI case, it was the stub doing it.

-Kees

-- 
Kees Cook
Pixel Security
