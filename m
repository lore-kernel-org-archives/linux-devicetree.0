From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
Date: Mon, 13 May 2019 16:40:47 -0700
Message-ID: <7hef51c48w.fsf@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com> <20190510155327.5759-2-jbrunet@baylibre.com> <7h4l62dlyh.fsf@baylibre.com> <3bad9dc8c53e50c4aea1212bf949215660259412.camel@baylibre.com> <b81b46f1-5e8f-26e8-399f-3baca8336e50@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b81b46f1-5e8f-26e8-399f-3baca8336e50@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 11/05/2019 17:52, Jerome Brunet wrote:
>> On Fri, 2019-05-10 at 14:43 -0700, Kevin Hilman wrote:
>>> minor nit: I kind of like "aliases" and "chosen" at the top since they
>>> are kind of special nodes, but honestly, I can't think of a really good
>>> reason other than personal preference, so keeping things sorted as
>>> you've done here is probably better.
>>>
>> 
>> You thought the same, then thought maybe memory was important too. But going
>> down that path, you end up sorting by feeling. It is going to be difficult
>> to all agree on which nodes are special.
>> 
>> In the end, we just want/need something that is easy to respect and verify.
>
> I think it would be better to have the same layout for aliases and memory over
> all the amlogic DTS, it's common over all socs to have these nodes on top.

aliases, chosen, memory and reserved-memory are ones that are typically
on the top for convience sake, but looking around we have not been
terribly consistent there either.

At this point, to continue the tradition, I'm not going to be too picky
about enforcing "standards" that are loosely defined (or undefined) and
will generally accept cleanups that are moving us towards consistency
and ease of rebasing.

Kevin
