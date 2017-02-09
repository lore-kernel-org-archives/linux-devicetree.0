From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Thu, 9 Feb 2017 16:58:29 -0600
Message-ID: <CAL_JsqK2RHLoLc_ikHzP2B5_Lof2g9NG+zvamGe4o1ko1ggGQA@mail.gmail.com>
References: <20161023200355.GA5391@amd> <20161119232943.GF13965@valkosipuli.retiisi.org.uk>
 <20161214122451.GB27011@amd> <20161222100104.GA30917@amd> <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd> <20170203123508.GA10286@amd> <20170208213609.lnemfbzitee5iur2@rob-hp-laptop>
 <20170208223451.GB18807@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208223451.GB18807@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 4:34 PM, Pavel Machek <pavel@ucw.cz> wrote:
>> > +
>> > +This is a binding for a gpio controlled switch for camera interfaces. Such a
>> > +device is used on some embedded devices to connect two cameras to the same
>> > +interface of a image signal processor.
>> > +
>> > +Required properties
>> > +===================
>> > +
>> > +compatible : must contain "video-bus-switch"
>>
>> video-bus-gpio-mux
>
> Sakari already asked for rename here. I believe I waited reasonable
> time, but got no input from you, so I did rename it. Now you decide on
> different name.
>
> Can we either get timely reactions or less bikeshedding?

You mean less than 5 days because I don't see any other version of
this? But in short, no, you can't.

Rob
