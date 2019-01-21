From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
Date: Mon, 21 Jan 2019 10:12:41 -0600
Message-ID: <CAL_JsqLn3wCpAWDTQFsrvuPJqWurTDNcu=j988PpHWtuW4Po6w@mail.gmail.com>
References: <20190109164343.164205-1-tmaimon77@gmail.com> <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
 <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com> <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 20, 2019 at 7:48 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Sat, 19 Jan 2019 at 02:12, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for bringing this to my attention,
> >
> > I think I will leave it the same way it is now because I will like to develop the reset driver and to handle the NPCM7xx SOC resets.
>
> You could also do that.
>
> But I was suggesting you use a phandle, so you could then find the
> node you want without searching the entire device tree for the node
> with the correct compatible.

That's not really any more efficient. You just search the entire tree
for the matching phandle number instead. Well, that was true until we
recently added the phandle cache.

In any case, it you plan to move to the reset binding (which would be
good), then it's better to have nothing in the DT and add something
rather than change the DT binding.

Rob
