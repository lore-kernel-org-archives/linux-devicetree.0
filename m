From: =?UTF-8?B?S2FuZW1hdHN1LCBTaGluamkv5YW85p2+IOS8uOasoQ==?=
        <kanematsu.shinji@socionext.com>
Subject: Re: [PATCH 0/2] Add Updown Counter support for Milbeaut M10V SoC
Date: Tue, 2 Apr 2019 11:12:32 +0900
Message-ID: <9522af01-1017-08d5-73c7-8b81b749c29a@socionext.com>
References: <1553581954-13487-1-git-send-email-kanematsu.shinji@socionext.com>
 <20190330183603.55886d4f@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190330183603.55886d4f@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kasai.kazuhiro@socionext.com, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On 2019/03/31 3:36, Jonathan Cameron wrote:
> On Tue, 26 Mar 2019 15:32:34 +0900
> Shinji Kanematsu <kanematsu.shinji@socionext.com> wrote:
> 
>> This is a series of patch which adds Updown Counter support on
>> Milbeaut M10V SoC.
>>
>> The Updown Counter counts input pulse signal from external quadrature encoder.
>> It also has input pulse signal counter function.
> Hi Shinji,
> 
> Are you aware of the counter subsystem that has been proposed (and
> as far as I am concerned is ready to be merged)?
> 
> https://patchwork.kernel.org/project/linux-iio/list/?series=147
> (I think that's the latest version posted)..
> William, perhaps you could give an update?
> 
> (bad luck, you are getting popular ;)
> 
> I'll take a quick review as it stands, as some issues may carry over.
> I appreciate that it's always unfortunate to try to upstream stuff at the
> same time as a new framework is being developed / upstreamed, but I don't
> intend to take any additional counter drivers into IIO.  We just
> end up having to maintain old interfaces in more and more drivers.
> 

Thank you for your reply.
I just learned that upstream requires the counter subsystem.
Detailed information was given by William.

Thank you,
Kanematsu

> Thanks,
> 
> Jonathan
> 
>>
>> Shinji Kanematsu (2):
>>    dt-bindings: iio: counter: Add Milbeaut Updown Counter
>>    iio: counter: Add support for Milbeaut Updown Counter
>>
>>   .../bindings/iio/counter/milbeaut-updown_cnt.txt   |  22 ++
>>   drivers/iio/counter/Kconfig                        |  12 +
>>   drivers/iio/counter/Makefile                       |   1 +
>>   drivers/iio/counter/milbeaut-updown.h              |  38 ++
>>   drivers/iio/counter/milbeaut-updown_cnt.c          | 385 +++++++++++++++++++++
>>   5 files changed, 458 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
>>   create mode 100644 drivers/iio/counter/milbeaut-updown.h
>>   create mode 100644 drivers/iio/counter/milbeaut-updown_cnt.c
>>
> 
