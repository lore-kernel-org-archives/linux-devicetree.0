From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/10] iio: document bindings for mounting matrices
Date: Mon, 25 Feb 2019 19:24:36 +0100
Message-ID: <CACRpkdZn6pS7vBwKk8FNnuSigZjHHjYciQ3V8WR_Fdb=COTdTw@mail.gmail.com>
References: <cover.1550768574.git.hns@goldelico.com> <32025b2a8ccc97cc01f8115ee962529eb5990f00.1550768574.git.hns@goldelico.com>
 <20190225093222.40533238@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225093222.40533238@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gregor Boirie <gregor.boirie@p>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Mon, Feb 25, 2019 at 5:32 PM Jonathan Corbet <corbet@lwn.net> wrote:

> >  .../devicetree/bindings/iio/mount-matrix.txt  | 204 ++++++++++++++++++

So this is a device tree binding.

> So forgive me, but I have to ask: what are the chances of getting this
> file in RST format?  It's 99% of the way there now, finishing the job
> would allow it to be integrated into our docs tree.
>
> It should probably have an SPDX line too.

The recent direction of the Device Tree bindings are not in the RST
direction but in the direction of using another formal structure: YAML
schemas.

See e.g. Documentation/devicetree/bindings/example-schema.yaml

The YAML schema makes it possible to verify device trees and examples
inside the bindings to the specification using a context-free grammar.

If we can join the RST and YAML ambitions is a good question. RST
has nice typesetting properties, YAML has nice grammatic properties.

Yours,
Linus Walleij
