From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Thu, 14 Jun 2018 16:14:53 +0200
Message-ID: <CACRpkdb034f2hZkoPenTurdULeUPuqPxNVE_Mr609ngrfx4Q=g@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com>
 <20180612205638.GA2404@rob-hp-laptop>
 <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
 <CAL_Jsq+0bnEmE2n-O3a7ecSXOsjTfZD3AqJDQunO6xzUF_W-=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAL_Jsq+0bnEmE2n-O3a7ecSXOsjTfZD3AqJDQunO6xzUF_W-=A@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2018 at 9:28 PM, Rob Herring <robh@kernel.org> wrote:

>> "Some system-on-chips (SoCs) use the concept of GPIO banks. ...
>> Usually each such bank is
>> exposed in the device tree as an individual gpio-controller node. ..."
>
> This should be conditioned on being able to divide up the registers by
> bank which seems like you can't. Or there's the case like the DW GPIO
> block and the number of banks is configurable.

If it is possible to create one device per bank I usually prefer that
approach, as it also (often) makes it possible to use the
generic GPIO library, i.e. the hardware abstraction start to
share more with other GPIO controllers.

>> If this is not a good approach, could you please me point me out to a
>> device tree example where
>> the correct approach is being used?
>
> I'm not sure offhand. There are lots of examples of single nodes I'm
> sure. Which ones have banks I haven't a clue. IIRC, there were some
> cases where the bank # was part of the GPIO cells, but I seem to
> recall Linus prefers not having 3 cells.

I don't like 3 cells, stuff is complicated enough as it is already.

Better in that case to concatenate the offsets and instead of
having an extra cell 0, 1 and offsets 0-31, 0-31
have two cells and offsets 0-63.

My reasoning is that since it is represented by a single device
we are indexing into that one device from 0-n.

Yours,
Linus Walleij
