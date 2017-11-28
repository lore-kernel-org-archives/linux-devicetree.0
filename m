MIME-Version: 1.0
In-Reply-To: <20171121200832.d55khzcufo2owcff@latitude>
References: <20171120214520.dcaqvyncojwefmgt@rob-hp-laptop>
	<mhng-dadf76d9-0823-4fc8-9177-1772629573b6@palmer-si-x1c4>
	<20171121200832.d55khzcufo2owcff@latitude>
Date: Tue, 28 Nov 2017 13:43:00 -0600
Message-ID: <CAL_JsqL9XSVCgouCftMfm3FQCPgg6S2775JJ_7HhxBxqDBnB-Q@mail.gmail.com>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, patches@groups.riscv.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 21, 2017 at 2:08 PM, Jonathan Neusch=C3=A4fer <j.neuschaefer@gm=
x.net> wrote:
> On Tue, Nov 21, 2017 at 09:37:02AM -0800, Palmer Dabbelt wrote:
> [...]
>> This isn't really a big deal to me, as I'm only interested in RISC-V
>> systems, but there's been some pushback on the concept of an SBI so it
>> seemed like a simple way to allow people to build non-SBI (and there for=
 not
>> really RISC-V) systems.
>
> For those reading along: I suggested the /firmware/sbi node to Palmer,
> because I'm interested in such "not really RISC-V" systems, (because it
> makes the firmware's job easier to not implement the SBI =E2=80=94 speaki=
ng with
> my coreboot hat, here.)

Seems some property to signify "not really RISC-V" would be better than add=
ing a node for all conformant systems. If this is just one

>
>> One option that wouldn't require a device tree node
>> would be to have Linux boot in machine mode [...] and then provide its
>> own SBI implementation.
>
> I think this can work.
>
>
> Thanks,
> Jonathan Neusch=C3=A4fer
