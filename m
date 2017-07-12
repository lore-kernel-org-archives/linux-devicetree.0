From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v6] media: platform: Renesas IMR driver
Date: Wed, 12 Jul 2017 23:26:58 +0300
Message-ID: <c7126515-23de-8dd8-95cb-85141e855243@cogentembedded.com>
References: <20170623203456.503714406@cogentembedded.com>
 <589c2ca4-d1e7-86c3-1ef5-8831a54856ed@xs4all.nl>
 <45854c21-f355-37e4-b677-dddb8222e719@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <45854c21-f355-37e4-b677-dddb8222e719@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello!

On 07/06/2017 09:16 PM, Sergei Shtylyov wrote:

[...]
>>> +=========================================
>>> +
>>> +This file documents some driver-specific aspects of the IMR driver, such as
>>> +driver-specific ioctls.
>>> +
>>> +The ioctl reference
>>> +~~~~~~~~~~~~~~~~~~~
>>> +
>>> +VIDIOC_IMR_MESH - Set mapping data
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +Argument: struct imr_map_desc
>>> +
>>> +**Description**:
>>> +
>>> +    This ioctl sets up the mesh using which the input frames will be
>>
>> s/using/through/
>>
>>> +    transformed into the output frames. The mesh can be strictly rectangular
>>> +    (when IMR_MAP_MESH bit is set in imr_map_desc::type) or arbitrary (when
>>> +    that bit is not set).
>>> +
>>> +    A rectangular mesh consists of the imr_mesh structure followed by M*N
>>> +    vertex objects (where M is imr_mesh::rows and N is imr_mesh::columns).
>>> +    In case either IMR_MAP_AUTOSG or IMR_MAP_AUTODG bits were set in
>>> +    imr_map_desc::type, imr_mesh::{x|y}0 specify the coordinates of the top
>>> +    left corner of the auto-generated mesh and imr_mesh::d{x|y} specify the
>>> +    mesh's X/Y steps.
>>
>> What if any of the other types are used like IMR_MAP_LUCE?
>
>    IMR_MAP_LUCE only affects the vertex object.
>
>> Is this documented in a Renesas datasheet?
>
>    Yes.

    Well, not exactly. The different mesh types are a software concept, the 
hardware only understands series of triangles.

[...]

>> Regards,
>>
>>     Hans

MBR, Sergei
