From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 0/8] ARM: sun8i: a33: Mali improvements
Date: Fri, 17 Feb 2017 20:39:33 +0000
Message-ID: <CACvgo51vLca_Ji8VQBO5fqCrbhpm_=6mrqx1K-7GddVv5yMKWg@mail.gmail.com>
References: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
 <CACvgo51p+aqegjkbF6jGggwr+KXq_71w0VFzJvFAF6_egT1-kA@mail.gmail.com> <20170217154419.xr4n2ikp4li3c7co@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20170217154419.xr4n2ikp4li3c7co@lukather>
Sender: owner-linux-mm@kvack.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, ML dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

As I feared things have taken a turn for the bitter end :-]

It seems that this is a heated topic, so I'l kindly ask that we try
the following:

 - For people such as myself/Tobias/others who feel that driver and DT
bindings should go hand in hand, prove them wrong.
But please, do so by pointing to the documentation (conclusion of a
previous discussion). This way you don't have to repeat yourself and
get [too] annoyed over silly suggestions.

 - The series has code changes which [seemingly] cater for out of tree
module(s).
Clearly state in the commit message who is the user, why it's save to
do so and get an Ack from more prominent [DRM] developers.

Please try to understand that I do not want to annoy/agitate you, I'm
merely pointing what seems [to me] as incorrect.
Nobody is perfect, so if I/others are wrong do point me/us to a
reading to educate ourselves.

Thanks
Emil

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
