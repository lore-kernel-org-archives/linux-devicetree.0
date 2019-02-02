Return-Path: <SRS0=WKj2=QJ=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20190202215601.20275-1-martin@martingkelly.com> <20190202215601.20275-7-martin@martingkelly.com>
In-Reply-To: <20190202215601.20275-7-martin@martingkelly.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 2 Feb 2019 21:12:22 -0200
Message-ID: <CAOMZO5DsbEhdW1dhcWxig7b5VB7qnkWtbU-SqY5cGJp2Ld0nuA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
Content-Type: text/plain; charset="UTF-8"
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Feb 2, 2019 at 7:59 PM Martin Kelly <martin@martingkelly.com> wrote:
>
> From: Martin Kelly <martin@martingkelly.com>
>
> We are using "if (ret < 0)" in many places in which the function returns 0
> on success. Use "if (ret)" instead for better clarity and correctness.

What's wrong with "if (ret < 0)" ?
