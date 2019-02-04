Return-Path: <SRS0=5kAC=QL=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20190202215601.20275-1-martin@martingkelly.com>
 <20190202215601.20275-7-martin@martingkelly.com> <CAOMZO5DsbEhdW1dhcWxig7b5VB7qnkWtbU-SqY5cGJp2Ld0nuA@mail.gmail.com>
 <aff2e86e-a6be-24da-0f4a-add25a2cbee2@martingkelly.com>
In-Reply-To: <aff2e86e-a6be-24da-0f4a-add25a2cbee2@martingkelly.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Feb 2019 13:15:34 -0200
Message-ID: <CAOMZO5BNK+v6t3qFYs5b+NpPHkrR4jiuy13DsM=AOQxAR3kY4g@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
Content-Type: text/plain; charset="UTF-8"
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Feb 2, 2019 at 10:30 PM Martin Kelly <martin@martingkelly.com> wrote:

> Jonathan Cameron pointed out that the check is for functions that return
> 0 on success. Thus, the check should be either "if (ret != 0)" or "if
> (ret)". Jonathan prefers "if (ret)", so I'm using that. By leaving it at
> "if (ret < 0)", technically a function could return positive numbers and
> not count as an error, which is a bug.

I fail to see how regmap_read()/regmap_write() functions could return
positive numbers on error.
