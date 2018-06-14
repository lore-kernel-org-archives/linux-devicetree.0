From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Thu, 14 Jun 2018 08:33:58 -0600
Message-ID: <CAL_JsqJV70m+RXdp1yHEX64u43F57Q66b8zrOKkiz-fLiEFPBw@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com>
 <20180612205638.GA2404@rob-hp-laptop>
 <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
 <CAL_Jsq+0bnEmE2n-O3a7ecSXOsjTfZD3AqJDQunO6xzUF_W-=A@mail.gmail.com>
 <CACRpkdb034f2hZkoPenTurdULeUPuqPxNVE_Mr609ngrfx4Q=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CACRpkdb034f2hZkoPenTurdULeUPuqPxNVE_Mr609ngrfx4Q=g@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 8:14 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jun 13, 2018 at 9:28 PM, Rob Herring <robh@kernel.org> wrote:
>
>>> "Some system-on-chips (SoCs) use the concept of GPIO banks. ...
>>> Usually each such bank is
>>> exposed in the device tree as an individual gpio-controller node. ..."
>>
>> This should be conditioned on being able to divide up the registers by
>> bank which seems like you can't. Or there's the case like the DW GPIO
>> block and the number of banks is configurable.
>
> If it is possible to create one device per bank I usually prefer that
> approach, as it also (often) makes it possible to use the
> generic GPIO library, i.e. the hardware abstraction start to
> share more with other GPIO controllers.

But that should be possible whether there are banks in DT or not, right?

Rob
