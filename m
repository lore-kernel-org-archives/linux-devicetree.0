Return-Path: <SRS0=Au6m=QL=martingkelly.com=martin@kernel.org>
Subject: Re: [PATCH v4 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
References: <20190202215601.20275-1-martin@martingkelly.com>
 <20190202215601.20275-7-martin@martingkelly.com>
 <CAOMZO5DsbEhdW1dhcWxig7b5VB7qnkWtbU-SqY5cGJp2Ld0nuA@mail.gmail.com>
 <aff2e86e-a6be-24da-0f4a-add25a2cbee2@martingkelly.com>
 <CAOMZO5BNK+v6t3qFYs5b+NpPHkrR4jiuy13DsM=AOQxAR3kY4g@mail.gmail.com>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <1197951a-61c3-65a7-b7c7-2396116ea13e@martingkelly.com>
Date: Mon, 4 Feb 2019 09:07:50 -0800
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BNK+v6t3qFYs5b+NpPHkrR4jiuy13DsM=AOQxAR3kY4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 2/4/19 7:15 AM, Fabio Estevam wrote:
> On Sat, Feb 2, 2019 at 10:30 PM Martin Kelly <martin@martingkelly.com> wrote:
> 
>> Jonathan Cameron pointed out that the check is for functions that return
>> 0 on success. Thus, the check should be either "if (ret != 0)" or "if
>> (ret)". Jonathan prefers "if (ret)", so I'm using that. By leaving it at
>> "if (ret < 0)", technically a function could return positive numbers and
>> not count as an error, which is a bug.
> 
> I fail to see how regmap_read()/regmap_write() functions could return
> positive numbers on error.
> 

It's not that the functions actually do return positive numbers (they 
don't). It's just that the success criteria is documented as "returns 0 
on success". Thus logically the correct check for error is "if (ret != 
0)" or just "if (ret)". This also is a bit self-documenting. That's why 
this patch is a cleanup instead of a bugfix.
