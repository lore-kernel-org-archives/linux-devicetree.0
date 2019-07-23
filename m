From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 02/10] iio: document bindings for mounting matrices
Date: Tue, 23 Jul 2019 11:46:49 +0200
Message-ID: <4C901747-1657-47AD-A9D7-10E41AFB35CB@goldelico.com>
References: <cover.1550768574.git.hns@goldelico.com> <32025b2a8ccc97cc01f8115ee962529eb5990f00.1550768574.git.hns@goldelico.com> <CACRpkdZ5Z9VY457Fywt6X=K5XONgiPVcwbwSkwL_U+GCqZ+u5g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ5Z9VY457Fywt6X=K5XONgiPVcwbwSkwL_U+GCqZ+u5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>li
List-Id: devicetree@vger.kernel.org

Hi Linus,

> Am 23.07.2019 um 09:42 schrieb Linus Walleij <linus.walleij@linaro.org>:
> 
> Hi H. Nikolaus,
> 
> On Thu, Feb 21, 2019 at 6:03 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> 
>> From: Linus Walleij <linus.walleij@linaro.org>
> 
> It is fair for you to change authorship to yourself at this point.
> Just keeping my Signed-off-by is sufficient.

Well, I think my contribution is less than yours :)

> 
>> The mounting matrix for sensors was introduced in
>> commit dfc57732ad38 ("iio:core: mounting matrix support")
>> 
>> However the device tree bindings are very terse and since this is
>> a widely applicable property, we need a proper binding for it
>> that the other bindings can reference. This will also be useful
>> for other operating systems and sensor engineering at large.
>> 
>> I think all 3D sensors should support it, the current situation
>> is probably that the mounting information is confined in magic
>> userspace components rather than using the mounting matrix, which
>> is not good for portability and reuse.
>> 
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Gregor Boirie <gregor.boirie@parrot.com>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: Samu Onkalo <samu.onkalo@intel.com>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> 
> Did this patch fall off somewhere? I think it's really neat, even in this
> form it is great help for developers. If you want I can try picking up the
> comments and resend it.

Well, I had planned to review it again and promised to send out a new
version. But as usual this ToDo becomes hidden by always more important
tasks.

So I am fine if you can pick comments and resend it. I think there will
be others who help to make it even better in the future if the mount matrix
is more widely used.

BR,
Nikolaus
