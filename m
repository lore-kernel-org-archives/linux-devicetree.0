From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH v2 0/2] Add efuse driver for Ingenic JZ4780 SoC
Date: Tue, 2 Jan 2018 21:47:05 +0530
Message-ID: <CANc+2y5cEoqEkqEr9b-APApd42HXQczFWJfGv+MWPNRdWpQr7Q@mail.gmail.com>
References: <20171228212954.2922-1-malat@debian.org> <828981e5-c23c-8dc4-55e4-23b65b33908b@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <828981e5-c23c-8dc4-55e4-23b65b33908b@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zubair.Kakakhel@mips.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

On 2 January 2018 at 17:31, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
> On 28/12/17 21:29, Mathieu Malaterre wrote:
>>
>> This patchset bring support for read-only access to the JZ4780 efuse as
>> found
>> on MIPS Creator CI20.
>>
>> To keep the driver as simple as possible, it was not possible to re-use
>> most of
>> the nvmem core functionalities. This driver is not compatible with the
>> original
>
> Can you explain a bit more on not able to re-use nvmem core?
>
> If you are referring to adding nvmem cell entires in sysfs, This should
> probably go in to nvmem core, rather that in individual providers.
> This is one of the feature my todo list, will try to come up with some thing
> soon.

We could not find a way to expose different sized segments using nvmem
framework. Do you have any pointers for this?
We were not aware of the fact that nvmem does not expose individual
cell entries in sysfs.

Regards,
PrasannaKumar
