Return-Path: <SRS0=3+k0=QK=martingkelly.com=martin@kernel.org>
Subject: Re: [PATCH v4 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
References: <20190202215601.20275-1-martin@martingkelly.com>
 <20190202215601.20275-7-martin@martingkelly.com>
 <CAOMZO5DsbEhdW1dhcWxig7b5VB7qnkWtbU-SqY5cGJp2Ld0nuA@mail.gmail.com>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <aff2e86e-a6be-24da-0f4a-add25a2cbee2@martingkelly.com>
Date: Sat, 2 Feb 2019 16:30:44 -0800
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DsbEhdW1dhcWxig7b5VB7qnkWtbU-SqY5cGJp2Ld0nuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 2/2/19 3:12 PM, Fabio Estevam wrote:
> On Sat, Feb 2, 2019 at 7:59 PM Martin Kelly <martin@martingkelly.com> wrote:
>>
>> From: Martin Kelly <martin@martingkelly.com>
>>
>> We are using "if (ret < 0)" in many places in which the function returns 0
>> on success. Use "if (ret)" instead for better clarity and correctness.
> 
> What's wrong with "if (ret < 0)" ?
> 

Jonathan Cameron pointed out that the check is for functions that return 
0 on success. Thus, the check should be either "if (ret != 0)" or "if 
(ret)". Jonathan prefers "if (ret)", so I'm using that. By leaving it at 
"if (ret < 0)", technically a function could return positive numbers and 
not count as an error, which is a bug.
